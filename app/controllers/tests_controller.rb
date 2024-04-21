class TestsController < ApplicationController
  def index
    tests = Test.all.pluck(:title)
    render plain: tests.join("\n")

    # render inline: '<h1>All test questions:</h1>
    # <h3><%= Test.all.pluck(:title).join("<br>").html_safe%></h3>'
  end

  def show
    render plain: Test.find(1).title
  end


end
