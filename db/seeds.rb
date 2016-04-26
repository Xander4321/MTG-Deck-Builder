# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

supertypes = Supertype.create([
    { sptypname: "Legendary" },
    { sptypname: "Basic" },
    { sptypname: "Ongoing" },
    { sptypname: "Snow" },
    { sptypname: "World" }
])

types = Type.create([
    { typname: "Artifact" },
    { typname: "Creature" },
    { typname: "Enchantment" },
    { typname: "Instant" },
    { typname: "Land" },
    { typname: "Planeswalker" },
    { typname: "Sorcery" },
    { typname: "Tribal" },
    { typname: "Artifact Creature" },
    { typname: "Enchantment Creature" },
    { typname: "Tribal Enchantment" }
])

subtypes = Subtype.create([
    { sbtypname: "Zombie" },
    { sbtypname: "Vampire" },
    { sbtypname: "Dragon" },
    { sbtypname: "Goblin" },
    { sbtypname: "Elf" },
    { sbtypname: "Werewolf" },
    { sbtypname: "Human" },
    { sbtypname: "Eldrazi" },
    { sbtypname: "Sphinx" },
    { sbtypname: "Faerie" },
    { sbtypname: "Plains" },
    { sbtypname: "Island" },
    { sbtypname: "Swamp" },
    { sbtypname: "Mountain" },
    { sbtypname: "Forest" },
    { sbtypname: "Xenagos" }
])

artists = Artist.create([
    { name: "Chris Rahn", gender: "Male" },
    { name: "Aleksi Briclot", gender: "Male" },
    { name: "Jason Chan", gender: "Male" },
    { name: "Michael Bruinsma", gender: "Male" },
    { name: "Rebecca Guay", gender: "Female" }
])

expantions = Expantion.create([
  { name: "Vintage Masters",
    symbol: "http://www.spllbk.com/assets/symbol/set/vma/c-6d1ef3b0f14cc7303384465017de6907.svg",
    total: 325 },
  { name: "Oath of the Gatewatch",
  symbol: "http://media.wizards.com/2015/images/daily/D5np80NlZx.png",
  total: 186 },
  { name: "Theros",
  symbol: "https://upload.wikimedia.org/wikipedia/en/thumb/e/ec/Icon_of_Theros_block_from_Magic_The_Gathering.jpg/96px-Icon_of_Theros_block_from_Magic_The_Gathering.jpg",
  total: 249 },
  { name: "Shards of Alara",
  symbol: "https://upload.wikimedia.org/wikipedia/en/thumb/2/24/ShardsAlara_expsym.svg/96px-ShardsAlara_expsym.svg.png",
  total: 249 },
  { name: "Modern Masters 2015",
  symbol: "http://hydra-media.cursecdn.com/mtgsalvation.gamepedia.com/thumb/5/5f/MM2_symbol.png/28px-MM2_symbol.png?version=f380c40c5d772ff2ff152bccfb18ef9f",
  total: 249 }
])

rarities = Rarity.create([
  { value: "Common" },
  { value: "Uncommon" },
  { value: "Rare" },
  { value: "Mythic Rare" },
])

formats = Deckstyle.create([
  { name: "Standard", cardlmt: 60 },
  { name: "Modern", cardlmt: 60 },
  { name: "Legacy", cardlmt: 60 },
  { name: "Vintage", cardlmt: 60 },
  { name: "Pauper", cardlmt: 60 },
  { name: "Commander/EDH", cardlmt: 100 },
  { name: "Highlander", cardlmt: 100 }
])

Card.create(
  name: "Black Lotus",
  color_identity: "Colorless",
  mana_cost: "0",
  cmc: 0,
  rarity: rarities[2],
  rules_text: "{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.",
  image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card",
  type: types.first,
  artist: artists.first,
  expantion: expantions.first,
  number: 4
)

Card.create(
  name: "Kozilek, the Great Distortion",
  color_identity: "Colorless",
  mana_cost: "8CC",
  cmc: 10,
  rarity: rarities.last,
  rules_text: %(
      When you cast Kozilek, the Great Distortion, if you have fewer than seven cards in hand, draw cards equal to the difference.
      Menace
      Discard a card with converted mana cost X: Counter target spell with converted mana cost X.
    ),
  flavor_text: "A void as cryptic as reality itself.",
  image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=407514&type=card",
  power: 12,
  toughness: 12,
  supertype: supertypes.first,
  type: types[1],
  subtype: subtypes[7],
  artist: artists[1],
  expantion: expantions[1],
  number: 4
)

Card.create(
  name: "Xenagos, the Reveler",
  color_identity: "Red Green",
  mana_cost: "2RG",
  cmc: 4,
  rarity: rarities.last,
  rules_text: %(
    +1: Add X mana in any combination of Red and/or Green to your mana pool, where X is the number of creatures you control.
    0: Put a 2/2 red and green Satyr creature token with haste onto the battlefield.
    −6: Exile the top seven cards of your library. You may put any number of creature and/or land cards from among them onto the battlefield.
  ),
  image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=373502&type=card",
  loyalty: 3,
  type: types[5],
  subtype: subtypes[15],
  artist: artists[2],
  expantion: expantions[2],
  number: 209
)

Card.create(
  name: "Sharding Sphinx",
  color_identity: "Blue",
  mana_cost: "4UU",
  cmc: 6,
  rarity: rarities[2],
  rules_text: %(
  Flying
  Whenever an artifact creature you control deals combat damage to a player, you may put a 1/1 blue Thopter artifact creature token with flying onto the battlefield.
  ),
  image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=376496&type=card",
  power: 4,
  toughness: 4,
  type: types[8],
  subtype: subtypes[8],
  artist: artists[3],
  expantion: expantions[3],
  number: 55
)

Card.create(
  name: "Bitterblossom",
  color_identity: "Black",
  mana_cost: "1B",
  cmc: 2,
  rarity: rarities[3],
  rules_text: %(
  At the beginning of your upkeep, you lose 1 life and put a 1/1 black Faerie Rogue creature token with flying onto the battlefield.
  ),
  flavor_text: %(
  In Lorwyn's brief evenings, the sun pauses at the horizon long enough for a certain species of violet to bloom with the fragrance of mischief.
  ),
  image: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=397701&type=card",
  type: types[10],
  subtype: subtypes[9],
  artist: artists[4],
  expantion: expantions[4],
  number: 71
)

Deck.create(
  name: "Mill it All!",
  deckstyle: formats[5]
)
