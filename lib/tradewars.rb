require 'sinatra'
require 'uri'
require 'mongo'

uri = URI.parse(ENV['MONGOHQ_URL'])
conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
db = conn.db(uri.path.gsub(/^\//, ''))

sectors = db['sectors']

get '/' do
  puts 'log test'
  sector = sectors.find_one "sector" => 1
  sector["warps"]
end

get '/bigbang' do
  sectors.remove
  sectors.insert "sector" => 1, "warps" => [2, 3, 4, 5, 6, 7]
end
