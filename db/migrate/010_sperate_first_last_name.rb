class SperateFirstLastName < ActiveRecord::Migration
  def self.up
    rename_column :contacts, :name, :first_name
    add_column :contacts, :last_name, :string
  end

  def self.down
    remove_column :contacts, :last_name
    rename_column :contacts, :first_name, :name
  end
end
