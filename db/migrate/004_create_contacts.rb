class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :company_name
      t.boolean :is_company
      t.integer :updated_by

      t.timestamps 
    end
  end

  def self.down
    drop_table :contacts
  end
end
