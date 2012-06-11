require 'sinatra'
require 'uri'
require 'mongo'
require 'json'

uri = URI.parse(ENV['MONGOHQ_URL'])
conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
db = conn.db(uri.path.gsub(/^\//, ''))


get '/sector/:sector' do |num|
  sectors = db['sectors']
  sector = sectors.find_one({ "sector" => num.to_i }, { :fields => { "_id" => 0, "sector" => 1, "warps" => 1 } })
  puts sector
  content_type 'application/json'
  sector.to_json
end

get '/bigbang' do
  db.drop_collection 'sectors'
  db.create_collection 'sectors'
  sectors = db['sectors']
  sectors.insert "sector" => 1, "warps" => [2, 3, 4, 5, 6, 7]
  sectors.insert "sector" => 2, "warps" => [1, 3, 7]
  sectors.insert "sector" => 3, "warps" => [1, 2, 4]
  sectors.insert "sector" => 4, "warps" => [1, 3, 5]
  sectors.insert "sector" => 5, "warps" => [1, 4, 6]
  sectors.insert "sector" => 6, "warps" => [1, 5, 7]
  sectors.insert "sector" => 7, "warps" => [1, 2, 6]
  "Universe generated"
end
