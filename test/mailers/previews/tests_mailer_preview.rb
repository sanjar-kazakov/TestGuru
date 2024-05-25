# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tests_mailer/completed_test
  def completed_test
    user_answer = UserAnswer.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(user_answer)
  end

end
