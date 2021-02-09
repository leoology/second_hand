
class CommentsController <ApplicationController

    post '/comments' do
        listing=Listing.find_by(id: params[:listing_id])
        comment=listing.comments.build(content: params[:comment], user:current_user)
        if comment.save
            flash[:success]="successfully created comment!"
            redirect "/listings/#{listing.id}"
        end 
    end
end 