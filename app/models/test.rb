class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by(category_name)
    Test.select(:title)
    .joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title = :category_name', category_name: category_name)
    .order('tests.title DESC')
  end
end
