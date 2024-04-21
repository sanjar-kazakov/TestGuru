class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: []

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = Question.all.pluck(:body)
    questions_new = questions.each_with_index.map do |question, index|
      "#{index + 1}: #{question}"
    end
    render plain: questions_new.join("\n")

    # questions = Question.all.pluck(:body)
    # render plain: questions.join("\n")
    # render plain: Question.pluck(:body).join("\n")
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
    # byebug
  end

  def create
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")

    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @question.destroy
  end

  private
  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
