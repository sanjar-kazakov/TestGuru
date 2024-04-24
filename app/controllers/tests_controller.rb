class TestsController < ApplicationController

  before_action :find_test, only: [:index, :show]

  def index
    tests = Test.all.pluck(:title)
    render plain: tests.join("\n")

    # render inline: '<h1>All test questions:</h1>
    # <h3><%= Test.all.pluck(:title).join("<br>").html_safe%></h3>'
  end

  def show
    render plain: @test.title
    # byebug
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
