class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.name = params[:book][:name]
    @book.author = params[:book][:author]
    @book.pages = params[:book][:pages]
    @book.user = current_user
    @book.save
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

end
