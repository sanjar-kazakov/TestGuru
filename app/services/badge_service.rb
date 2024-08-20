class BadgeService

  PERFECT_SCORE = 100

  def initialize(user_answer)
    @user_answer = user_answer
    @user = user_answer.user
    @test = user_answer.test
  end

  def call
    badge = Badge.find_by(title: "Category pass")
    @user.badges.push(badge)
  end

  def method_name?
    category_test_ids = @test.category.tests.where(deleted_at: nil, published: true).pluck(:id).uniq
    user_test_ids = @user.tests.where(id: category_test_ids).pluck(:id).uniq
    category_test_ids == user_test_ids
  end

  def perfect_score?
    passage_percentage == PERFECT_SCORE
  end

  def assign_badge(title)
    badge = Badge.find_by(title: title)
    badge.path if badge.present?
  end




  # <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 50vh;">
  # <% if @user_answer.perfect_score? %>
  #   <div class="alert alert-success" role="alert">
  # <%= "Congrats! You get Badge for Perfect Score" %>
  #   </div>
  #   <%= image_tag @user_answer.assign_badge("Perfect score"), width: "400", height: "400" %>
  # <% end %>
  # </div>

end