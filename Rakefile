require 'rubygems'
require 'rake'

ERLC_FLAGS = "+debug_info -W2 -o ebin"

task :default => :test

task :chdir do
  Dir.chdir(File.join(File.dirname(__FILE__), *%w[.]))
end

task :build => :chdir do
  sh "mkdir -p ebin"
  sh "erlc #{ERLC_FLAGS} src/*.erl"
end

task :test => :chdir do
  sh "mkdir -p ebin"
  sh "erlc #{ERLC_FLAGS} -DTEST -I etest src/*.erl"
  sh "test/run.es"
end

task :console => :chdir do
  sh "erl +Bc +K true -smp enable -pa ebin -sname local_console_#{$$} -kernel start_boot_server true"
end
