class Place < ActiveRecord::Base
  attr_protected

  def self.unique_column_values column_name
    self.select("DISTINCT \"#{column_name}\"")
        .map(&:"#{column_name}")
        .reject(&:nil?)
  end
end
