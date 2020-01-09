require 'faraday'
require 'JSON'

class Species
  attr_reader :name, :classification

  def initialize(data)
    @name = data["name"]
    @classification = data["classification"]
  end
end

conn = Faraday.new("https://swapi.co/")

response = conn.get("/api/species/")

hash = JSON.parse(response.body)

species = hash["results"]

collection = species.map do |genome_data|
  Species.new(genome_data)
end

require "pry"; binding.pry
