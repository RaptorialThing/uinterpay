class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.boolean :success
      t.string :description
      t.timestamps
    end
  end
end
