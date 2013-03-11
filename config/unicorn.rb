work_dir = '/srv/www/christianeventlink.com/'

socket_path = "#{work_dir}tmp/sockets/unicorn.sock"
pid_path = "#{work_dir}tmp/pids/unicorn.pid"
err_log = "#{work_dir}logs/unicorn.stderr.log"
out_log = "#{work_dir}logs/unicorn.stdout.log"

worker_processes 2
working_directory "#{work_dir}/app"

preload_app true

timeout 30

listen socket_path, :backlog => 64

pid pid_path

stderr_path err_log
stdout_path out_log

before_fork do |server, worker|
	defined? (ActiveRecord::Base) and
		ActiveRecord::Base.connection.disconect!
end

after_fork do |server, worker|
	defined? (ActiveRecord::Base) and
		ActiveRecord::Base.establish_connection
end