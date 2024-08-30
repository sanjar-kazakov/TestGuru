class UserAnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_answer, only: %i[update show result]

  def show
  end

  def result
  end

  def update
    if params[:answer_ids].present?
      @user_answer.accept!(params[:answer_ids])

      if @user_answer.completed?
        @user_answer.success
        new_badges = BadgeService.new(@user_answer).call if @user_answer.success?
        TestsMailer.completed_test(@user_answer).deliver_now
        redirect_to result_user_answer_path(@user_answer, badges: new_badges)
      else
        render :show
      end
    else
      flash.now[:alert] = t('.failure')
      render :show
    end
  end

  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

end
