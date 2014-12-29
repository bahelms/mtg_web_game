class CardSetImporter
  def initialize(options)
    @default_path = options.fetch(:path) { "#{Rails.root}/lib/tasks/data/" }
    @csv = load_csv(options.fetch(:csv_name))
  end

  def card_set_name
    @csv.first.split("|").first
  end

  def card_set_code
    @csv.first.split("|").last
  end

  def import
    card_set = create_card_set
    @csv[1..-1].each do |row|
      split_row = row.split("%")
      card_attrs = split_row.shift.split("|")
      abilities = split_row
      create_abilities(abilities, create_card(card_attrs, card_set))
    end
  end

  private
    def load_csv(file_name)
      File.read("#{@default_path}#{file_name}.csv").split("\n")
    end

    def create_card_set
      card_set = CardSet.where(name: card_set_name).first
      card_set.destroy if card_set
      CardSet.create!(name: card_set_name, code: card_set_code)
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
        supertype: Supertype.where(name: attrs[7]).first,
        type: Type.where(name: attrs[8]).first,
        subtypes: set_subtypes(attrs[9]),
        type_class: TypeClass.where(name: attrs[10]).first,
        card_set: card_set
      )
    end

    def set_subtypes(subtypes)
      return [] unless subtypes
      subtypes.split(",").map { |st| Subtype.where(name: st).first }
    end

    def create_abilities(abilities, card)
      abilities.each do |ability|
        attrs = ability.split("|")
        if attrs.first == "keyword"
          card.keyword_abilities << KeywordAbility.where(keyword: attrs[1]).first
        else
          card.abilities.create(ability_params(attrs))
        end
      end
    end

    def ability_params(attrs)
      {
        type: attrs.first,
        trigger: attrs[1],
        cost: parse_mana_cost(attrs[2]),
        effects: set_effects(attrs[3])
      }
    end

    def set_effects(str)
      str.split(",") unless str.nil?
    end

    def parse_mana_cost(str)
      return unless str
      str.split(",").reduce({}) do |total_cost, color_cost|
        total_cost.merge({color_cost.split.first => color_cost.split.last})
      end
    end
end

