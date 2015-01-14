class IndexController < ApplicationController
  def index
  	if signed_in?
      current_user_id = current_user.id
      @books = Book.where("user_id != #{current_user_id}")
    end
  end

  def requests
    @requests = RequestBook.where(user_id:current_user.id)
  end

  def approvals
    @approvals = Book.where(user_id:current_user.id).where(request:1)
  end
end
