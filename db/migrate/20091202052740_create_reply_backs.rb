class CreateReplyBacks < ActiveRecord::Migration
  def self.up
    create_table :reply_backs do |t|
      t.integer :reply_id
      t.integer :reply_to_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reply_backs
  end
end
