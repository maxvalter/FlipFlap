# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    @data = CSV.parse(tsv, headers: true, col_sep: "\t").map(&:to_h)
    # @data = []
    # rows = tsv.split("\n")
    # headers = rows[0].split("\t")

    # rows[1..].each do |row|
    #   row_data = row.split("\t")
    #   row_hash = {}
    #   headers.each_with_index do |header, index|
    #     row_hash[header] = row_data[index]
    #   end
    #   @data << row_hash
    # end
    # @data
  end

  def to_tsv
    tsv = ''
    if !@data.nil? && @data.any?
      headers = @data[0].keys
      tsv += "#{headers.join("\t")}\n"
      @data.each do |row|
        tsv += "#{row.values.join("\t")}\n"
      end
    end

    tsv
  end
end
