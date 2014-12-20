module UsersHelper
  def has_book?(book_id)
    book = Book.find(book_id)
    current_user.books.where(id: book_id)
  end
end
