role :app, %w{rasp-api.ddns.net}
role :web, %w{rasp-api.ddns.net}
role :db,  %w{rasp-api.ddns.net}
server 'rasp-api.ddns.net', user: 'pi', roles: %w{web app}
set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
}

set :branch, :token
