class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.string :author
      t.string :years_published

      t.timestamps
    end
  end
end
