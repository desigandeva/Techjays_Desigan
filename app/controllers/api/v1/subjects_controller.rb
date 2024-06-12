class Api::V1::SubjectsController < ApplicationController
    before_action :set_subject, only: %i[show edit update destroy]

    # GET api/v1/subjects/index
    def index
        @subjects = Subject.all
    end

    # GET api/v1/subject/show
    def show
    end

    # GET api/v1/subject/new
    def new
        @subject = Subject.new
    end

    # POST api/v1/subject/create
    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to api_v1_subjects_path
        else
            redirect_to new_api_v1_subject_path
        end
    end

    # GET api/v1/subject/edit
    def edit
    end

    # PATCH api/v1/subject/update
    def update
        if @subject.update(subject_params)
            redirect_to api_v1_subjects_path
        else
            redirect_to url: {action: 'update', id: @subject.id}
        end
    end

    # DELETE api/v1/subject/destroy
    def destroy
        if @subject.destroy
            redirect_to api_v1_subjects_path
        else
            redirect_to url: {action: 'destroy', id: @subject.id}
        end
    end

    # private method's
    private
        # set_subject with :id
        def set_subject
            puts params[:id]
            if params[:id]
                @subject = Subject.find(params[:id])
            end
        end

        # get subject parameters
        def subject_params
            params.require(:subject).permit(:name)
        end
end