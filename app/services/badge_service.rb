class BadgeService

  PERFECT_SCORE = 100

  def initialize(user_answer)
    @user_answer = user_answer
    @user = user_answer.user
    @test = user_answer.test
    @new_badges = []
  end

  def call
    Badge.find_each do |badge|
      call_method = "#{badge.title.parameterize.underscore}?"
      if respond_to?(call_method) && send(call_method, badge.rule_value)
        @user.badges.push(badge)
        @new_badges << badge
      end
    end
    @new_badges
  end

  def category_pass?(category_name)
    category_test_ids = Test.sort_by_category_name(category_name).published.kept.pluck(:id).uniq
    user_test_ids = @user.user_answers.successful.where(test_id: category_test_ids).pluck(:test_id).uniq
    category_test_ids.sort == user_test_ids.sort
  end

  def perfect_score?(_rule_value = nil)
    @user_answer.result == PERFECT_SCORE
  end

  def level_pass?(level)
    test_level_ids = Test.where(level: level).published.kept.pluck(:id).uniq
    user_test_ids = @user.user_answers.successful.where(test_id: test_level_ids).pluck(:test_id).uniq
    test_level_ids.sort == user_test_ids.sort
  end

  def first_try_success?(_rule_value = nil)
    previous_attempts = @user.user_answers.where(test: @test).count
    previous_attempts == 1 && @user_answer.success?
  end

end