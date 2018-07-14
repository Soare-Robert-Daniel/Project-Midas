require 'sinatra'
require 'sinatra/reloader'
require 'erb'


Dir.glob('./{helpers,controllers,renders}/*.rb').each { |file| require file }

class App < Sinatra::Base

    helpers ApplicationHelper

    configure do 
        # Make the server to listen for all ports
        set :bind, '0.0.0.0'
        # Run the autoreloader
        register Sinatra::Reloader
        enable :sessions
    end

    register do
        def auth (type)
          condition do
            redirect "/login" unless send("is_#{type}?")
          end
        end
      end
    
      helpers do
        def is_user?
          @user != nil
        end
      end
    
      before do
        @user = session[:user]
      end
    
    

    get '/' do
        redirect to("/welcome/Stranger")
    end

    get '/user/:name' do |name|
        if name != session[:user]
            redirect to("/login")
        end
        user = UserPanel.new("views/user_panel.erb")
        user.build name
        erb :layout, {:locals =>{:info_panel => user.getHTML, :content => "<p> #{name} <p>"}}
    end

    get '/welcome/:name' do
        erb :welcome, {:locals =>{:name => params[:name],:prog_frontend => "1", :prog_backend => "10"},  :layout => :default_layout}
    end

    get '/content' do
        title "Content Page"
        erb :content, {:layout => :layout}
    end

    get '/javascript/:name' do
        File.read("javascript/#{params[:name]}.js")
    end

    get '/login' do
        erb :login, {:layout => false}
    end

    post '/login' do 
        user = params['name']
        pass = params['pass']
        if validate(user, pass)
            session[:user] = user
            redirect to("/user/" + user)
        else
            redirect to("/error")
        end
    end

    get '/error' do
        "Error"
    end

    def validate(user, pass)
        true
    end
end

# Create the routes from App
App.run!