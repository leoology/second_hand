#require './config/environment'

class ApplicationController< Sinatra::Base
    configure do 
            enable :sessions
            set :session_secret, ENV['SECRET']

        set :public_folder, "public"
        set :views, "app/views"
        use Rack::Flash
    end 

    get '/' do
        erb :index
    end

    helpers do
        def logged_in?
            !!current_user

        end

        def current_user
           @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

        end

        def redirect_if_not_logged
            redirect '/login' if !logged_in?
        end

    end
end