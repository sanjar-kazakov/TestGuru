class User < ApplicationRecord
  def history_by_level(level)
    Test.joins('JOIN user_answers ON tests.id = user_answers.user_id')
      .where('user_answers.user_id = :id AND tests.level = :level', id: self.id, level: level).pluck(:title)
  end
end
