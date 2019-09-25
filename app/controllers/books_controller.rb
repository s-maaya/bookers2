class BooksController < ApplicationController
before_action :authenticate_user!

before_action :correct_book, only:[:edit, :update]

  def index
  	@books =Book.all
  	@book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(books_params)#空箱だけど、情報の入った箱を持っている
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have updated book successfully."#[:notice]に表示させたい文字を代入している。
      redirect_to book_path(@book.id)#画像の投稿が成功した時に飛ぶページのリンク
    else
      @books =Book.all
      render :index
    end
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
    @books = Book.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] ="You have updated book successfully."
       redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
	  book.destroy
	  redirect_to  books_path
  end




private
def correct_book
  @book = Book.find(params[:id])
    if @book.user != current_user
    redirect_to books_path
  end
end


	def books_params
		params.require(:book).permit(:title, :body)#どこのカラムなのか聞いている
	end

end
