class UserAnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user_answer, only: %i[update show result]
  before_action :check_time_limit, only: %i[show update]

  def show
    @time_left_in_seconds = calculate_time_left
  end

  def result
  end

  def update
    if params[:answer_ids].present?
      @user_answer.accept!(params[:answer_ids])

      if @user_answer.completed?
        @user_answer.update_success_status
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

  def check_time_limit
    return unless @user_answer.test.timer.present? && @user_answer.test.timer > 0

    if Time.current > (@user_answer.created_at + @user_answer.test.timer.minutes)
      @user_answer.update(success: false)
      redirect_to result_user_answer_path(@user_answer), alert: t('time_expired')
    end
  end

  def calculate_time_left
    return 0 unless @user_answer.test.timer.present? && @user_answer.test.timer > 0

    elapsed_time = Time.current - @user_answer.created_at
    remaining_time = (@user_answer.test.timer * 60) - elapsed_time
    remaining_time > 0 ? remaining_time.to_i : 0
  end

end
