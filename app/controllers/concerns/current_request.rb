module CurrentRequest
  extend ActiveSupport::Concern

  private
    def request
      @request = RequestBook.find(session[:request_book_id])
    rescue ActiveRecord::RecordNotFound
      @request = RequestBook.create
      session[:request_book_id] = @request.id
    end
end
