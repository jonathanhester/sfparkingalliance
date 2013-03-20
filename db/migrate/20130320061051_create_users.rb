class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :code
      t.text :address

      t.timestamps
    end
  end
end
