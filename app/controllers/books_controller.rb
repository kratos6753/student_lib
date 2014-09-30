class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.name = params[:books][:name]
    @book.author = params[:books][:author]
    @book.pages = params[:books][:pages]
    @book.user_id = current_user.id
    
    if @book.save
     render 'show'
    else
        render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def home
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end
  def search
    @books = []
    
      @books_title = Book.search(params[:search], 'name')
      @books = @books + @books_title
   
      @books_contents = Book.search(params[:search], 'description' )
      @books = @books + @books_contents
      #@books_genres = Book.search(params[:search], 'genres' )
      #@books = @books + @books_genres
      @books_author = Book.search(params[:search], 'author' )
      @books = @books + @books_author
     # @comments = Comment.where("content LIKE ?", "%#{params[:search]}%")
     # @books_comments = Book.find(@comments.uniq.pluck(:Book_id))
      #@books = @books + @books_comments
    #end
  end

end
