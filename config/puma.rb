root = "#{Dir.getwd}"
daemonize true
bind "unix://#{root}/../../tmp/puma/socket"
pidfile "#{root}/../../tmp/puma/pid"
state_path "#{root}/../../tmp/puma/state"
rackup "#{root}/config.ru"

threads 2, 4

activate_control_app

