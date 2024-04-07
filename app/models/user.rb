class User < ApplicationRecord
  def history_by_level(level)
    Test.select(:id, :title, :level)
      .joins('JOIN user_answers ON tests.id = user_answers.user_id')
      .where('user_answers.user_id = :id AND tests.level = :level', id: 1, level: level)
  end
end
