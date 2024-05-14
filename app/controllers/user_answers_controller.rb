class UserAnswersController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :set_user_answer, only: %i[update show result ]


  def show
  end

  def result
  end

  def update
    @user_answer.accept!(params[:answer_ids])

    if @user_answer.completed?
      redirect_to result_user_answer_path(@user_answer)
    else
      render :show
    end
  end

  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

end
