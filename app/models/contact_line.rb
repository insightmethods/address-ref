class ContactLine < ActiveRecord::Base
  belongs_to :contact
  # validates_presence_of :value
  
  def show_label
    label.gsub(/(phone|email|address|chat|website)_/,'').titleize
  end
  
end
