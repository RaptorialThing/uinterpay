class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :count
      t.string :currency
      t.belongs_to :user
      t.timestamps
    end
  end
end
