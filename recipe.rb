# change accordingly to your project
#
#
#
#

set :dmtcpsnooze_path, "."

load "#{dmtcpsnooze_path}/roles.rb"
load "#{dmtcpsnooze_path}/roles_definition.rb"
load "#{dmtcpsnooze_path}/output.rb"

set :dmtcpsnooze_url, "https://ci.inria.fr/snooze-software/job/dmtcp-snooze/ws/target/DMTCPSnooze-0.0.1-dist.tar.gz"
set :proxy, "http_proxy=http://proxy:3128 https_proxy=http://proxy:3128"
set :wget_p, "#{proxy} wget"

namespace :dmtcpsnooze do

  desc 'install dmtcpsnooze on node'
  task :default do
    java
    install
    generateConfig
    uploadConfig 
    start  
  end

  task :java, :roles => [:dmtcpsnooze] do
    set :user, "root"
    run "apt-get update"
    run "apt-get install -y openjdk-7-jre"
  end


  task :install, :roles => [:dmtcpsnooze] do
    set :user, "#{g5k_user}"
    run "#{wget_p} #{dmtcpsnooze_url} -O /tmp/dmtcpsnooze.tar.gz"
    #upload "/Users/msimonin/snooze/dmtcp-snooze/target/DMTCPSnooze-0.0.1-dist.tar.gz", "/tmp/dmtcpsnooze.tar.gz", :via => :scp 
    run "cd /tmp && tar -xvzf /tmp/dmtcpsnooze.tar.gz"
    run "cd /tmp && mv DMTCP* DMTCPsnooze"
  end

  task :generateConfig do
    template = File.read("#{dmtcpsnooze_path}/templates/application.cfg.erb")
    renderer = ERB.new(template)
    server = find_servers :roles => :dmtcpsnooze
    @storageEndpoint = server.first.host
    generate = renderer.result(binding)
    myFile = File.open("#{dmtcpsnooze_path}/tmp/application.cfg", "w")
    myFile.write(generate)
    myFile.close
  end

  task :uploadConfig, :roles => [:dmtcpsnooze] do
    set :user, "root"
    upload  "#{dmtcpsnooze_path}/tmp/application.cfg", "/tmp/DMTCPsnooze/configs/.", :via => :scp
  end

  desc 'start the service' 
  task :start, :roles => [:dmtcpsnooze] do
    set :user, "#{g5k_user}"
    run "cd /tmp/DMTCP* ; nohup java -jar *.jar configs/application.cfg configs/log4j.xml"
  end


end


