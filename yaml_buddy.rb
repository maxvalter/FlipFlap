# frozen_string_literal: true

require 'yaml'

# Contains methods for converting yaml table to array of hashes and vice versa
module YamlBuddy
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
end
# Module that can be included (mixin) to take and output Yaml data
