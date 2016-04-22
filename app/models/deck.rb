class Deck < ActiveRecord::Base
  has_many :deckcards
  has_many :cards, through: :deckcards

  belongs_to :deckstyle
end
