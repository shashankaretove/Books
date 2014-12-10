class BooksController < ApplicationController
  before_action :load_User, only: [:show, :edit, :update, :destroy]

  def index
   @user = User.find(params[:user_id])
   @books = @user.books

  end

  def create
     user=User.find(params[:user_id])
     @book=user.books.new(permitted_params)
   if @book.save
        flash[:notice]= "A Book has been successfully added."
     redirect_to user_books_path

      else
        flash[:error] = @book.errors.full_messages.to_sentence
        redirect_to new_user_book_path 
      end
  end

  def new
    @user=User.find(params[:user_id])
    @book=Book.new
  end

  def show
  @user=User.find(params[:user_id])
  @comments = @book.comments
  @comment=Comment.new
  end

  def edit
   @user=User.find(params[:user_id])
  end

  def update
    @user=User.find(params[:user_id])
      if @book.update(permitted_params)        
          redirect_to user_books_path, notice: 'User was successfully updated.'
      else
        flash[:error] = @book.errors.full_messages.to_sentence
        redirect_to edit_user_book_path(@book)
      end
  end

  def destroy
    
    @book.destroy
     redirect_to user_books_path(@user)
  
  end

  private

  def load_User
    @book=Book.find(params[:id])
    @user=@book.user
  end

 def permitted_params
  params.require(:book).permit(:title, :author, :summary, :picture)
   
 end
end
