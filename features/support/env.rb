$LOAD_PATH.unshift 'lib'

require 'tradewars'
require 'capybara/cucumber'
require 'akephalos'

$tradewars_logging = false

Capybara.app = Sinatra::Application
Capybara.javascript_driver = :akephalos
