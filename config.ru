require 'sinatra/base'
require "sinatra/reloader" 
Dir.glob('./{helpers,controllers}/*.rb').each { |file| require file }

# TO DO
# Try to figure out why is not working to make server to listen to all ports when lunching with 'rackup'

run ContentController 
run AppController 