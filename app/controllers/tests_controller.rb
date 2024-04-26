class TestsController < ApplicationController

  # before_action :find_test, only: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      render plain: 'Done!'
    else
      render plain: 'Failed!'
      # render plain: @test.errors.full_messages.join(', ')
    end
  end

  def show
    @test = Test.find(params[:id])
    # render plain: @test.title
    # byebug
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  # def find_test
  #   @test = Test.find(params[:id])
  # end

  def rescue_with_question_not_found
    render plain: 'Test not found!'
  end
end
