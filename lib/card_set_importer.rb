class CardSetImporter
  def initialize(options)
    @default_path = options.fetch(:path)
    @csv = load_csv(options.fetch(:csv_name))
  end

  def card_set_name
    @csv.first
  end

  def import
    @csv[1..-1].each do |row|
      split_row = row.split("%")
      card_attrs = split_row.shift.split("|")
      abilities = split_row
      create_abilities(abilities, create_card(card_attrs, create_card_set))
    end
  end

  private
    def load_csv(file_name)
      File.read("#{@default_path}#{file_name}.csv").split("\n")
    end

    def create_card_set
      card_set = CardSet.where(name: card_set_name).first
      card_set.destroy if card_set
      CardSet.create!(name: card_set_name)
    end

    def create_card(attrs, card_set)
      Card.create!(
        name: attrs[0],
        mana_cost: parse_mana_cost(attrs[1]),
        colors: attrs[2].split(","),
        rarity: attrs[3],
        power: attrs[4],
        toughness: attrs[5],
        dual_card: attrs[6],
        type: Type.where(name: attrs[7]).first,
        subtypes: set_subtypes(attrs[8]),
        supertype: Supertype.where(name: attrs[9]).first,
        type_class: TypeClass.where(name: attrs[10]).first,
        card_set: card_set
      )
    end

    def set_subtypes(subtypes)
      subtypes.split(",").map { |st| Subtype.where(name: st).first }
    end

    def create_abilities(abilities, card)
      abilities.each do |ability|
        attrs = ability.split("|")
        if attrs.first == "keyword"
          card.abilities << Ability.where(name: attrs[1]).first
        else
          # create activated or triggered ability
        end
      end
    end

    def parse_mana_cost(str)
      str.split(",").reduce({}) do |total_cost, color_cost|
        total_cost.merge({color_cost.split.first => color_cost.split.last})
      end
    end
end

