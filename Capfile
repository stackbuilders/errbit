require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rbenv' if ENV['RBENV']
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/puma'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
