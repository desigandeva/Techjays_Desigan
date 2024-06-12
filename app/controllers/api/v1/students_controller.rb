class Api::V1::StudentsController < ApplicationController
    # before perform specified action call set_student method
    before_action :set_student, only: %i[edit update show destroy]

    # GET api/v1/students/index
    def index
        @students = Student.all
    end

    # GET api/v1/student/show
    def show
    end

    # GET api/v1/student/new
    def new
        @student = Student.new
    end

    # POST api/v1/create
    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to api_v1_students_index_path
        else
            redirect_to api_v1_students_new_path
        end
    end

    # GET api/v1/student/edit
    def edit
    end

    # PATCH api/v1/update/
    def update
        if @student.update(student_params)
            redirect_to api_v1_students_index_path
        else
            redirect_to url: { action: 'edit', :id => @student.id }
        end
    end

    # GET api/v1/student/destroy
    def destroy
        if @student.destroy
            redirect_to students_index_path
        else
            redirect_to url: {action: 'show', :id => @student.id}
        end
    end

    # GET api/v1/students/publish_score
    def publishScore
        @students = Student.all
        @students.each do |s|
            # UpdateTotalJob.perform_async(s.id)
            Student.update(s.id, :total => Score.where(student_id: s.id).sum(:score))
        end
        @student = Student.order(total: :desc)
        @student.each_with_index do |s, i|
            UpdateRankJob.perform_async(s.id,i+1)
            # Score.where(student_id: s.id).upsert(rank: i+1)
        end
        redirect_to root_path
    end

    # private method's
    private        
        # set_student by given :id
        def set_student
            @student = Student.find(params[:id])
        end

        # get required student parameter's
        def student_params
            params.require(:student).permit(:name)
        end
end