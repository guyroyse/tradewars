require 'sinatra'
require 'uri'
require 'mongo'
require 'json'

uri = URI.parse(ENV['MONGOHQ_URL'])
conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
db = conn.db(uri.path.gsub(/^\//, ''))

sectors = db['sectors']

get '/sector/:sector' do |num|
  sector = sectors.find_one "sector" => num.to_i
  sector.to_json
end

get '/bigbang' do
  sectors.remove
  sectors.insert "sector" => 1, "warps" => [2, 3, 4, 5, 6, 7]
  "Universe generated"
end
