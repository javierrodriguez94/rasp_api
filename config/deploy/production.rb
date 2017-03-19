role :app, %w{192.168.1.179}
role :web, %w{192.168.1.179}
role :db,  %w{192.168.1.179}
server '192.168.1.179', user: 'pi', roles: %w{web app}
set :branch, :master
set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
}