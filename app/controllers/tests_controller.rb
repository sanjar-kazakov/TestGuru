class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.kept.published_tests
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.user_answer(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
