class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = test.current_user.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.user_answer(@test)
  end

  private

  def find_user
    @user = User.find(current_user.id)
    # byebug
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_question_not_found
    render plain: 'Test not found!'
  end
end
