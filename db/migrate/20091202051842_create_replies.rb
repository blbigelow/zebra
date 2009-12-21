class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer :discussion_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
  
  def self.down
    drop_table :replies
  end
end
