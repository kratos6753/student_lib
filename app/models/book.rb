class Book < ActiveRecord::Base

  belongs_to :user, inverse_of: :books
  #has_and_belongs_to_many :genres 
  
  validates :isbn, allow_blank:true, numericality:{only_integer:true},length:{is:10}
  validates :title, presence: true, length:{maximum:100}
  validates :description, presence:true, length:{maximum:1000}
  validates :cover, allow_blank:true, format:{with:/\.(jpg|png|gif)\z/i}
  validates :genre, presence: true
  validates :author, presence: true
  validates :pages, presence:true, numericality:{only_integer:true}

  def self.search(search, designation)
    search_condition = "%" + search + "%"
    where("#{designation} LIKE ?", "%#{search}%")
  end
end
