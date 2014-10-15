# rake db:seed

formats = [:standard, :modern, :legacy, :vintage]
supertypes = [:basic, :legendary, :elite, :snow, :world]
types = [
  { name: :sorcery, permanent: false },
  { name: :instant, permanent: false },
  { name: :creature, permanent: true },
  { name: :artifact, permanent: true },
  { name: :enchantment, permanent: true },
  { name: :land, permanent: true },
  { name: :planeswalker, permanent: true },
]

formats.each { |f| Format.create!(name: f) }
supertypes.each { |st| Supertype.create!(name: st) }
types.each { |t| Type.create!(name: t[:name], permanent: t[:permanent]) }

classes = File.read("db/classes.csv").split("\n")
classes.each { |c| TypeClass.create!(name: c) }

subtypes = File.read("db/subtypes.csv").split("\n")
subtypes.each { |sub| Subtype.create!(name: sub) }

