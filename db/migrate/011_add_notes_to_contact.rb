class AddNotesToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :notes, :string
  end

  def self.down
    remove_column :contacts, :notes
  end
end
