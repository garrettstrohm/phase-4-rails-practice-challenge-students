class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def create
        student = Instructor.students.create(student_params)
        render json: student, status: :created
    end

    def show
        student = find_student
        render json: student, status: :ok
    end

    def update
        student = Student.find(params[:id])
        student.update(student_params)
        render json: student, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        Student.find(params[:id])
    end
end
