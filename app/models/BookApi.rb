class BookApi

    def self.fetch
        response = HTTP.get("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=YpppMZ9kyOW4ONAii0MLeGCVH5ExmtHT")
        books = JSON.parse(response)["results"]["books"]
        books.each do |book|
          Book.create(title: book["title"], genre: book["publisher"], author: book["author"], years_published: book["rank"])
        end
        
    end
end