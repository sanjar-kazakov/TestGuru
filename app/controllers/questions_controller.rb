class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :show, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    question = @test.questions.pluck(:body)

    render plain: question.join("\n")
  end

  def show
    # byebug
    render plain: @question.body
  end

  def new
    # byebug
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: 'Done!'
    else
      render plain: 'Failed!'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def find_test
    # byebug
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end
