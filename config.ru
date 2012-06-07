$LOAD_PATH.unshift 'lib'
$stdout.sync = true

require 'tradewars'

run Sinatra::Application
