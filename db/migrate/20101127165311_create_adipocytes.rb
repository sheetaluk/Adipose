class CreateAdipocytes < ActiveRecord::Migration
  def self.up
    create_table :adipocytes do |t|
      t.string :userId
      t.string :subject
      t.text :content
      t.integer :noVotes
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :adipocytes
  end
end
