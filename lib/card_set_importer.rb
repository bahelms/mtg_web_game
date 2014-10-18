class CardSetImporter
  def initialize(options)
    @default_path = options.fetch(:path)
    @csv = load_csv(options.fetch(:csv_name))
  end

  def card_set_name
    @csv.first
  end

  def import
    set = CardSet.create!(name: card_set_name)
    @csv[1..-1].each do |row|
      split_row = row.split("%")
      card = split_row.shift.split("|")
      abilities = split_row
      create_card(card, set)
      create_abilities(abilities, card)
    end
  end

  private
    def load_csv(file_name)
      File.read("#{@default_path}#{file_name}.csv").split("\n")
    end

    def create_card(card, set)
      attrs = card.split("|")
      Card.create!(
        name: attrs[0],
        mana_cost: parse_mana_cost(attrs[1]),
        colors: attrs[2].split(","),
        rarity: attrs[3],
        power: attrs[4],
        toughness: attrs[5],
        dual_card: attrs[6],
        # type: attrs[7],
        # subtypes: attrs[8],
        # supertype: attrs[9],
        # type_class: attrs[10]
      )
    end

    def create_abilities(abilities, card)
    end

    def parse_mana_cost(str)
      str.split(",").reduce({}) do |total_cost, color_cost|
        total_cost.merge({color_cost.split.first => color_cost.split.last})
      end
    end
end

