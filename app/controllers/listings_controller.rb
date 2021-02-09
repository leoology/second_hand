class ListingsController< ApplicationController

    get '/listings' do 
       redirect_if_not_logged
            @listings= Listing.all
            erb :'listings/listings'
    end 

    get '/listings/new' do
     redirect_if_not_logged
     erb :'listings/new' 
    end 

    get '/listings/:id/edit' do
        redirect_if_not_logged
        @listing=Listing.find_by_id(params[:id])
       if @listing.user_id==current_user.id
            erb :'/listings/edit'
        end 
    end 

    post '/listing/:id' do
        redirect_if_not_logged
        @comment=current_user.comments.build(:content=>params[:content])
        if @comment.save
            redirect "/listings/#{@listing.id}"
    end



    patch '/listings/:id/edit' do
        redirect_if_not_logged
            @listing= Listing.find_by(params[:id])
            if !params[:description]==""
                redirect "/tweets/#{@listing.id}/edit"
            else 
                @listing.description=params[:description]
                @listing.save
            end  
            redirect '/login' 
    end 

    post '/listings' do
        redirect_if_not_logged
        @listing=current_user.listings.build(:description=> params[:description], :title=> params[:title], :condition=> params[:condition], :price=> params[:price])
        if @listing.save
            redirect "/listings/#{@listing.id}"
        else 
            redirect '/listings/new'
        end 
    end 

    get '/listings/:id' do
        @listing=Listing.find_by_id(params[:id])
        erb :'listings/show'
        

    end 

    delete '/listings/:id/delete' do
        redirect_if_not_logged
            @listing=Listing.find_by_id(params[:id])
            if @listing.user_id==current_user.id
                @listing.delete
                redirect '/listings'
            else 
                erb :'listings/error'
            end 
     
            redirect '/login' 
    end 
end 
