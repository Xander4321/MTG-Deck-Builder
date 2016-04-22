class Card < ActiveRecord::Base
  has_many :deckcards
  has_many :decks, through: :deckcards

  belongs_to :supertype
  belongs_to :type
  belongs_to :subtype
  belongs_to :artist
  belongs_to :expantion
  belongs_to :rarity
end
