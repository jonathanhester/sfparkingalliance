class AddMessageAndResponseToAngelEvents < ActiveRecord::Migration
  def up
    add_column :angel_events, :message, :string
    add_column :angel_events, :response, :string
    remove_column :angel_events, :body
  end

  def down
    remove_column :angel_events, :message
    remove_column :angel_events, :response
    add_column :angel_events, :body, :string
  end
end
