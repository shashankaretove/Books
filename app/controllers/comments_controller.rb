class CommentsController < ApplicationController
  def create
  	comment = Comment.new(permitted_params)
  	if comment.save
       flash[:notice]= "A new User has been successfully created."
  		redirect_to :back
  	else
      flash[:error] = comment.errors.full_messages.to_sentence
  		redirect_to :back
  	end
  end

def destroy
    @comment=Comment.find(params[:id])
	@comment.destroy
	redirect_to :back
end


  private
   def permitted_params
  params.require(:comment).permit(:book_id, :user_id, :comment)
   
 end
end
