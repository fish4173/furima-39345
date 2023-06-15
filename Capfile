require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/scm/git'              # 追加する行
install_plugin Capistrano::SCM::Git       # 追加する行
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'


Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
