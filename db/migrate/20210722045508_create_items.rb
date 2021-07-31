class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                 nill: false
      t.text    :description,          nill: false
      t.integer :category_id,          nill: false
      t.integer :status_id,            nill: false
      t.integer :shipping_fee_id,      nill: false
      t.integer :shipping_address_id,  nill: false
      t.integer :delivery_day_id,      nill: false
      t.integer :price,                nill: false
      t.references :user,              null: false, foreing_key: true

      t.timestamps
    end
  end
end
