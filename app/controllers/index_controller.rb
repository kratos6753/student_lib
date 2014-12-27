class IndexController < ApplicationController
  def index
  	current_user_id = current_user.id
    @books = Book.where("user_id != #{current_user_id}")
  end

  def requests
    @requests = RequestBook.where(user_id:current_user.id)
  end

  def approvals
    @approvals = Book.where(user_id:current_user.id).where(request:1)
  end
end
