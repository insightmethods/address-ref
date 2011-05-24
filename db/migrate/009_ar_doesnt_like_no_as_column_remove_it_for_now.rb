class ArDoesntLikeNoAsColumnRemoveItForNow < ActiveRecord::Migration
  def self.up
    #rename_column :invoices, :no, :invoice_no
  end

  def self.down
    #rename_column :invoices, :invoice_no, :no
  end
end
