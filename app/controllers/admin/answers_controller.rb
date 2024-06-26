class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[ new create show edit]
  before_action :find_answer, only: %i[ show edit update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_test_question_answer_path(@question.test, @question, @answer), notice: 'Answer was successfully saved.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_question_answer_path(@answer), notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def rescue_with_question_not_found
    render plain: 'Answer not found!'
  end
end
