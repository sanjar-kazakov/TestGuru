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
      if respond_to?(call_method) && self.send(call_method)
        @user.badges.push(badge)
        @new_badges << badge
      end
    end
    @new_badges
  end

  private

  def category_pass?
    category_test_ids = Test.sort_by_category_name(@test.category.title).kept.deleted.pluck(:id).uniq
    user_test_ids = @user.tests.where(id: category_test_ids, success: true).pluck(:id).uniq
    category_test_ids == user_test_ids
  end

  def perfect_score?
    passage_percentage == PERFECT_SCORE
  end

  def level_pass?
    test_level_ids = Test.where(level: @test.level, published: true).kept.pluck(:id).uniq
    user_test_ids = @user.user_answers.where(test_id: test_level_ids, success: true).pluck(:test_id).uniq
    test_level_ids.sort == user_test_ids.sort
  end

  def first_try_success?
    previous_attempts = @user.user_answers.where(test: @test).count
    previous_attempts == 1 && @user_answer.success?
  end

  def passage_percentage
    ( @user_answer.correct_questions / @user_answer.test.questions.count.to_f ) * 100
  end

end