class BooksController < ApplicationController
   before_action :authenticate_user!, only:[:create, :index, :show, :update, :new, :edit, :destroy]
   before_action :not_error, only:[:edit, :update]

	def new
		@book = Book.new
	end

	def create
		@book =Book.new(book_params)
		@book.user_id = current_user.id
		# バリデーション エラーの場合
		if @book.save
		   redirect_to book_path(@book.id), notice: "Book was successfully created."
	    else
           @books = Book.all
	       @user = current_user
		   render :index
	    end
	end

	def index
		@books = Book.all
		
		@user = current_user
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
        @user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		# バリデーションエラーの場合
		if @book.update(book_params)
  	       redirect_to book_path(@book), notice: "Book was successfully updated."
  	    else
  		   render :edit
  		end
    end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path, notice: "Book was successfully destroyed."
	end

	def top
	end

	def about

	end

	private
	def not_error
  	@book = Book.find(params[:id])
  	if (@book.user_id != current_user.id)
  		redirect_to books_path
  	end
    end

    def book_params
    params.require(:book).permit(:title, :body,:user_id)
    end

end
