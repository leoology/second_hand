class ListingsController< ApplicationController

    get '/listings' do 
        if !logged_in?
            redirect '/login'
        else 
            @listings= Listings.require_all
            erb :'listings/listings'
        end 
    end 

    get '/listings/new' do
        if !logged_in?
            redirect '/login'
        else 
            erb :'listings/new'
        end 
    end 

    patch '/listings/:id/edit' do
        if logged_in?
            @listing= Listing.find_by(params[:id])
            if !params[:description]==""
                redirect "/tweets/#{@listing.id}/edit"
            else 
                @listing.description=params[:description]
                @listing.save
            end 
        else 
            redirect '/login'
        end 
    end 

    post '/listings' do
        if logged_in?
            if params[:description]==""
                redirect 'listings/new'
            else 
                @listing= current_user.listings.build(description: params[:description])
                @listing.save
                if @listing.save
                    redirect "/listings/#{@listing.id}"
                else 
                    redirect '/listings/news'
                end 
            end 
        else 
            redirect '/login'
        end 
    end 

    delete '/listings/:id/delete' do
        if logged_in?
            @listing=Listing.find_by_id(params[:id])
            if @tweet.user_id==current_user.id
                @listing.delete
                redirect '/listings'
            else 
                erb :'tweets/error'
            end 
        else 
            redirect '/login'
        end 
    end 
end 
