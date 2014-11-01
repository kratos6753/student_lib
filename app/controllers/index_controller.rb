class IndexController < ApplicationController
  def index
    @books = Book.all
  end

  def requests
    @requests = RequestBook.where(user_id:current_user.id)
  end

  def approvals
    @approvals = Book.where(user_id:current_user.id).where(request:true)
  end
end
