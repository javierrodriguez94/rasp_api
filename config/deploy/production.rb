role :app, %w{192.168.1.110}
role :web, %w{192.168.1.110}
role :db,  %w{192.168.1.110}
server '192.168.1.110', user: 'pi', roles: %w{web app}
set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
}

set :branch, :gpio
