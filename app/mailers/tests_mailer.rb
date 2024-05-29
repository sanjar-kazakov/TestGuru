class TestsMailer < ApplicationMailer

  def completed_test(user_answer)
    @user = user_answer.user
    @test = user_answer.test

    mail to: @user.email
  end

end
