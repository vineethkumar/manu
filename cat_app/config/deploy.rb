require 'bundler/capistrano'
set :user, 'vineeth'
set :domain, 'localhost'
set :applicationdir, "appdir"


#set :application, "set your application name here"
set :application, "cat_app"

 
set :scm, 'git'
#set :repository,  "set your repository location here"

set :repository,  "qburstpoc@git.qburst.com:/Repo/projects/githome/qburstpoc.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export
# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false
 


# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
  task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
