role :app, %w{192.168.1.112}
role :web, %w{192.168.1.112}
role :db,  %w{192.168.1.112}
server '192.168.1.112', user: 'pi', roles: %w{web app}
set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
}

set :branch, :master
