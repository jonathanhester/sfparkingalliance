class CreateAngelEvents < ActiveRecord::Migration
  def change
    create_table :angel_events do |t|
      t.string :phone
      t.string :code
      t.string :status
      t.integer :user_id
      t.string :sms_sid
      t.text :body

      t.timestamps
    end
  end
end
