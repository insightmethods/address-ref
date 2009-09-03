class ChangeNameToLabelContactLine < ActiveRecord::Migration
  def self.up
    rename_column :contact_lines, :name, :label
  end

  def self.down
    rename_column :contact_lines, :label, :name
  end
end
