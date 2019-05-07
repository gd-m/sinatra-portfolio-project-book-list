class CreateBookEntries < ActiveRecord::Migration
  def change
    create_table :book_entries do |t|
      t.integer :user_id
      t.string :name
      t.string :author
      t.boolean :status #status for read/ unread. true = read / false = unread

      t.timestamps null: false
    end
  end
end
