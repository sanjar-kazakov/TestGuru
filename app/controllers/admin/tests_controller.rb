class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline publish]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @tests = Test.kept
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @test.soft_delete
    redirect_to admin_tests_path, notice: t('.success')
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: "Test was successfully updated."
    else
      render :edit
    end
  end

  def publish
    message = @test.published? ? t('.unpublished') : t('.published')
    if @test.publish_test

      redirect_to admin_tests_path, notice: message
    else
      render :index
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_test
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :timer, :category_id)
  end

  def rescue_with_question_not_found
    render plain: 'Test not found!'
  end
end
