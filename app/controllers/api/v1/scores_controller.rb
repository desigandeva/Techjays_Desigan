class Api::V1::ScoresController < ApplicationController
    # GET /api/v1/scores/index
    def index
        @students = Student.all
        @subjects = Subject.all
        @scores = Score.all
    end

    # # GET /api/v1/score/show
    # def show
    # end

    # GET /api/v1/score/new
    def new
        @students = Student.all
        @subjects = Subject.all
        @score = Score.new
    end
    
    # POST /api/v1/score/create
    def addScore
        @score = Score.new(score: params[:score][:score], student_id: params[:student_id], subject_id: params[:subject_id])
        if @score.save
            redirect_to api_v1_scores_index_path
        else
            redirect_to api_v1_score_new_path
        end
    end

    # # GET /api/v1/score/edit
    # def edit
    # end

    # # PATCH /api/v1/score/update
    # def update
    #     if @score.update(score_params)
    #         redirect_to api_v1_scores_index_path
    #     else
    #         redirect_to api_v1_scores_index_path
    #     end
    # end

    # # GET /api/v1/score/destory
    # def destroy
    #     if @score.destroy
    #         redirect_to api_v1_scores_index_path
    #     else
    #         redirect_to api_v1_scores_index_path
    #     end
    # end

    # GET /api/v1/score/display
    def display
        @students = Student.all
        # @subjects = Subject.all
        @scores = Score.select(:student_id,:rank).distinct
    end
end
