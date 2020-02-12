require "nyc_neighborhoods/version"
require 'json'
require_relative 'data'
module NycNeighborhoods
  class Error < StandardError; end

  # Returns Neighborhood name from Zip Code input
  def self.neighborhood(zip_code)
    zip_code = zip_code.to_s
    data = JSON.parse(File.read 'data.rb')
    data.each do |hood_hash|
      return hood_hash['neighborhood'] if hood_hash['zip_codes'].include?(zip_code)
    end
  end
end
