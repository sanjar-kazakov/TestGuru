class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_question_path(@test, @question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question = @test.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to admin_test_question_path(@test, @question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @test.questions
  end

  private

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end
