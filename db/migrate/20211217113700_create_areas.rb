class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer :zone
      t.string :city
      t.string :post_code

      t.timestamps
    end
  end
end
