CONFIG = YAML.load_file("#{Rails.root}/config/app_config.yml").
  with_indifferent_access
