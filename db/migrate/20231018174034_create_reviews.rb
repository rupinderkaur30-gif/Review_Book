class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :user_id
      t.string :book_id

      t.timestamps
    end
  end
end
