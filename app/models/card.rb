class Card < ActiveRecord::Base
  belongs_to :supertype
  belongs_to :type
  belongs_to :subtype
  belongs_to :artist
  belongs_to :expantion
end
