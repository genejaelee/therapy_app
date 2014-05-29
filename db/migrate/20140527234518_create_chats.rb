class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :owner
      t.string :channel
      
      t.timestamps
    end
  end
end
