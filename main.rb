require 'sinatra'
require 'sinatra/reloader'
require 'erb'


Dir.glob('./{helpers,controllers}/*.rb').each { |file| require file }

class App < Sinatra::Base

    helpers ApplicationHelper

    configure do 
        # Make the server to listen for all ports
        set :bind, '0.0.0.0'
        # Run the autoreloader
        register Sinatra::Reloader
    end

    get '/' do 
        'Nice!'
    end

    get '/welcome/:name' do
        title "Midas"
        erb :welcome, {:locals =>{:name => params[:name], :title => "Midas",:prog_frontend => "1", :prog_backend => "10"}, :layout => :layout}
    end

    get '/content' do
        title "Content Page"
        erb :content, {:layout => :layout}
    end
end

# Create the routes from App
App.run!