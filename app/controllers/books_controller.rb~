class BooksController < ApplicationController
  include ApplicationHelper
  include SessionsHelper
  require 'asin'
  include ASIN::Client

  def index
    @books = current_user.books
  end

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
    @book.genre = params[:book][:genre] 
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book Created Successfully"
      redirect_to @book
    else
      render 'new'
    end
  end

  def create_book_isbn
    client = ASIN::Client.instance
    @item = client.lookup params[:isbn]
    @book = Book.new
    @book.isbn = params[:isbn]
    @book.cover = @item.first.medium_image.url
    @book.title = @item.first.item_attributes.title
    @book.description = @item.first.editorial_reviews.editorial_review.kind_of?(Array) ? @item.first.editorial_reviews.editorial_review[-1].content : @item.first.editorial_reviews.editorial_review.content 
    @book.author = @item.first.item_attributes.author
    @book.pages = @item.first.item_attributes.number_of_pages
    @book.genre = "computer science"  #hard coding the genre for some time
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book Created Successfully"
      redirect_to @book
    else
      render isbn_search
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
    isbn = params[:isbn]
    @items = ( isbn.length == 10 ) ? (client.lookup isbn) : (client.lookup convert_to_isbn10(isbn))
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
