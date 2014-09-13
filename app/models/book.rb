class Book < ActiveRecord::Base

  belongs_to :user, inverse_of: :books
  has_and_belongs_to_many :genres 

  validates :name, presence: true
  validates :genres, presence: true, length: {in: 1..4}
  validates :author, presence: true
  validates :user_id, presence: true
end
