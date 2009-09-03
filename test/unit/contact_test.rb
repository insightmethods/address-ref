require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < Test::Unit::TestCase 
  fixtures :contacts
  def test_only_called_label_created
    contact = Contact.create
    contact.phone_main = '123.456.8888'
    contact.email_main = 'info@sushi.food'
    contact.save
    assert_equal('123.456.8888', contact.contact_lines.find_by_label('phone_main').value)
    assert_equal('info@sushi.food', contact.contact_lines.find_by_label('email_main').value)
  end
  
  
end
