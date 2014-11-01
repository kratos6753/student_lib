class GenresController < ApplicationController

  def index
    @books = Book.all.reverse_order
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def display
    @genre = Genre.find(params[:id])
    @books = Genre.includes(:books).find(@genre.id).books.reverse_order
  end

  def update
    @genre = Genre.find(params[:id])
    if params[:genres][:name].length!=0
      @genre.name = params[:genres][:name]
    end
    if params[:genres][:description].length!=0
      @genre.description = params[:genres][:description]
    end
    @genre.save
    redirect_to :back
  end

end
