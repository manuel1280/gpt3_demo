class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :body
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
