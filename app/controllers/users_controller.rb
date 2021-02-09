
class UsersController< ApplicationController
    get '/signup' do
        #binding.pry
        if logged_in?
            redirect '/listings' 
        else 
            erb :'users/signup'
        end 
    
    end

    post '/signup' do
        if params[:name]==""||params[:email]==""||params[:password]==""
            redirect 'signup'
            puts "Fields cannot be left blank."
        else 
           # @user=User.create(params)
            @user=User.create(name: params[:name], email: params[:email], password: params[:password])
           # binding.pry
            session[:user_id]=@user.id
            redirect '/listings'
        end 
    end 

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else 
            redirect '/listings'
        end 
    end 

    post '/login' do
        @user = User.find_by(:name => params[:name])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/listings'
        else
          redirect '/login'
        end
      end
    
      get '/logout' do
        if logged_in?
          session.clear
          redirect '/login'
        else
          redirect '/'
        end
      end


end 