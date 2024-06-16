class GistsController < ApplicationController

  before_action :set_user_answer, only: %i[create]

  def create
    result = GistQuestionService.new(@user_answer.current_question).call

    flash_options = if result[:id]
      current_user.gists.create!(
        question: @user_answer.current_question,
        gist_url: result[:html_url]
      )
      { notice: t('.success', gist_url: "#{ view_context.link_to('Gist', result[:html_url], target: "_blank").html_safe }" ) }
    else
      { alert: t('.failure') }
    end

    redirect_to @user_answer, flash_options
  end

  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

end
