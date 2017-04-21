class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :category
      t.integer :status
      t.integer :rating
      t.integer :priority
      t.string :link

      t.timestamps
    end
  end
end
