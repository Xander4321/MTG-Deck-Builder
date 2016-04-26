class Card < ActiveRecord::Base
  has_many :deckcards
  has_many :decks, through: :deckcards

  belongs_to :supertype
  belongs_to :type
  belongs_to :subtype
  belongs_to :artist
  belongs_to :expantion
  belongs_to :rarity

  include PgSearch
  pg_search_scope :search_name,
  against: [:name],
  using: {
    tsearch: { prefix: true, dictionary: "english" }
  }

  pg_search_scope :search_more,
  associated_against: {
    supertype: :sptypname,
    type: :typname,
    subtype: :sbtypname,
    expantion: :name,
    rarity: :value
  },
  using: {
    tsearch: { prefix: true, dictionary: "english" }
  }

  scope :search, -> (query) do
    if query.present?
      search_name(query) + search_more(query)
    end
  end

  self.per_page = 3
end
