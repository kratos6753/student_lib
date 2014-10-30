class RequestBooksController < ApplicationController
  #include CurrentRequest
  #before_action :request,only: [:create]
  before_action :set_request_book, only: [:show, :edit, :update, :destroy]

  # GET /request_books
  # GET /request_books.json
  def index
    @request_books = RequestBook.all
  end

  # GET /request_books/1
  # GET /request_books/1.json
  def show
  end

  # GET /request_books/new
  def new
    @request_book = RequestBook.new
  end

  # GET /request_books/1/edit
  def edit
  end

  # POST /request_books
  # POST /request_books.json
  def create
    @request_book = RequestBook.new
    @request_book.book_id = params[:book_id]
    @request_book.user_id = current_user.id
    respond_to do |format|
      if @request_book.save
        RequestMailer.request_notify(@request_book,current_user).deliver
        format.html { redirect_to @request_book, notice: 'Request book was successfully created.' }
        format.json { render :show, status: :created, location: @request_book }
      else
        format.html { render :new }
        format.json { render json: @request_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_books/1
  # PATCH/PUT /request_books/1.json
  def update
    respond_to do |format|
      if @request_book.update(request_book_params)
        format.html { redirect_to @request_book, notice: 'Request book was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_book }
      else
        format.html { render :edit }
        format.json { render json: @request_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_books/1
  # DELETE /request_books/1.json
  def destroy
    @request_book.destroy
    respond_to do |format|
      format.html { redirect_to request_books_url, notice: 'Request book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_book
      @request_book = RequestBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_book_params
      params.require(:request_book).permit(:book_id)
    end
end
