#!/usr/bin/env puma

directory '/var/projects/haystak/current'
rackup "/var/projects/haystak/current/config.ru"
environment 'staging'

pidfile "/var/projects/haystak/shared/tmp/pids/puma.pid"
state_path "/var/projects/haystak/shared/tmp/pids/puma.state"
stdout_redirect '/var/projects/haystak/shared/log/puma_access.log', '/var/projects/haystak/shared/log/puma_error.log', true

threads 0,16

bind 'unix:///var/projects/haystak/shared/tmp/sockets/puma.so
ck';

workers 1

preload_app!

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/var/projects/haystak/current/Gemfile"
end


on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
