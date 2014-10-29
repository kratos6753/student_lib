json.array!(@request_books) do |request_book|
  json.extract! request_book, :id, :book_id
  json.url request_book_url(request_book, format: :json)
end
