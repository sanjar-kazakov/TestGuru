class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: "Test is succeccfully created"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @test.user_answers.destroy_all
    @test.questions.each do |question|
      question.answers.destroy_all
    end
    @test.questions.destroy_all
    @test.destroy
    redirect_to admin_tests_path, notice: 'Test was successfully destroyed.'
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_question_not_found
    render plain: 'Test not found!'
  end
end
