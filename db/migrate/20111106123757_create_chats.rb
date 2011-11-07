class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :text
      t.string :user_name

      t.timestamps
    end
  end
end
