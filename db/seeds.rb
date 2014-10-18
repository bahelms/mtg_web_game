# rake db:seed

formats = [:standard, :modern, :legacy, :vintage]
supertypes = [:basic, :legendary, :elite, :snow, :world]
types = [
  { name: :sorcery,      permanent: false },
  { name: :instant,      permanent: false },
  { name: :creature,     permanent: true },
  { name: :artifact,     permanent: true },
  { name: :enchantment,  permanent: true },
  { name: :land,         permanent: true },
  { name: :planeswalker, permanent: true },
  { name: :token,        permanent: true },
]

Format.destroy_all
Supertype.destroy_all
Type.destroy_all
TypeClass.destroy_all
Subtype.destroy_all
Ability.where(type: :keyword).destroy_all

formats.each { |f| Format.create!(name: f) }
supertypes.each { |st| Supertype.create!(name: st) }
types.each { |t| Type.create!(name: t[:name], permanent: t[:permanent]) }

classes = File.read("db/classes.csv").split("\n")
classes.each { |c| TypeClass.create!(name: c) }

subtypes = File.read("db/subtypes.csv").split("\n")
subtypes.each { |sub| Subtype.create!(name: sub) }

keyword_abilities = File.read("db/keyword_abilities.csv").split("\n")
keyword_abilities.each { |a| Ability.create!(type: :keyword, name: a) }

