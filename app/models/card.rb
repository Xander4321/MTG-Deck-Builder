class Card < ActiveRecord::Base
  belongs_to :supertype
  belongs_to :type
  belongs_to :subtype
end
