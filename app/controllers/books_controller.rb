class BooksController < ApplicationController
  include SessionsHelper
  require 'asin'
  include ASIN::Client

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.isbn = params[:book][:isbn]
    @book.cover = params[:book][:cover]
    @book.title = params[:book][:title]
    @book.description = params[:book][:description]
    @book.author = params[:book][:author]
    @book.pages = params[:book][:pages]
    @book.genres = params[:book][:genres] 
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book Created Successfully"
      redirect_to @book
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
  
  def isbn
  end

  def isbn_search
    client = ASIN::Client.instance
    @items = client.lookup params[:isbn]
  end

  def search
    @books = []
    
      @books_title = Book.search(params[:search], 'title')
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
