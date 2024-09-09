class UserAnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_answer, only: %i[update show result]

  def show
    @time_left_in_seconds = @user_answer.calculate_time_left
  end

  def result
  end

  def update
    @user_answer.accept!(params[:answer_ids]) unless @user_answer.expired?

    if @user_answer.completed? || @user_answer.expired?
      @user_answer.update_success_status
      new_badges = BadgeService.new(@user_answer).call if @user_answer.success?
      TestsMailer.completed_test(@user_answer).deliver_now
      redirect_to result_user_answer_path(@user_answer, badges: new_badges)
    else
      render :show
    end
  end

  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

end
