class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @user=User.all
  end

  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end  

  def create
    @user=User.new(permitted_params)
   if @user.save
        flash[:notice]= "A new User has been successfully created."
     redirect_to users_path

      else
        flash[:error] = @user.errors.full_messages.to_sentence
        redirect_to new_user_path 
      end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    if @user.update(permitted_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        redirect_to edit_user_path(@user)
      end
  end

  def destroy
        @user.destroy
    redirect_to :back
  end

  private

  def set_user
    @user=User.find(params[:id])
    #@book=@user.books
  end

 def permitted_params
  params.require(:user).permit(:first_name, :last_name, :username, :picture)
   
 end

end
