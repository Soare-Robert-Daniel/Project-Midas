
class AppController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  
  helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  set :bind, '0.0.0.0'
  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end
  
  # will be used to display 404 error pages
  not_found do
    title 'Not Found!'
    erb :not_found
  end
end