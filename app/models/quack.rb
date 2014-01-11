class Quack < ActiveRecord::Base
  validates :author, presence: :true
  validates :body, presence: :true, length: { maximum: 140 }
end
