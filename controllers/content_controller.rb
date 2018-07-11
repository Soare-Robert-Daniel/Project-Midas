
class ContentController < AppController

    get '/content' do
        title "Content Page"
        erb :content
    end
end