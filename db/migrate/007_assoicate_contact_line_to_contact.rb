class AssoicateContactLineToContact < ActiveRecord::Migration
  def self.up
    add_column :contact_lines, :contact_id, :integer
  end

  def self.down
    remove_column :contact_lines, :contact_id
  end
end
