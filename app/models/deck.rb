class Deck < ActiveRecord::Base
  has_many :deckcards
  has_many :cards, through: :deckcards

  belongs_to :deckstyle

  validates :name, presence: true
  validates :deckstyle_id, presence: true
end
