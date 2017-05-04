class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
