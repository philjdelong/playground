require 'faraday'

conn = Faraday.new

response = conn.get("https://swapi.co/api/")
