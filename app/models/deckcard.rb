class Deckcard < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck

  validates :num_of, presence: true
end
