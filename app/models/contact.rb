class Contact < ActiveRecord::Base
  has_many :contact_lines, :dependent => :destroy
  
  @@labels = %w( phone_main phone_work phone_home phone_mobile phone_fax phone_evening phone_factory phone_other ) +
             %w( email_main email_work email_personal ) +
             %w( website_main website_work website_personal ) +
             %w( chat_aim chat_jabber chat_msn chat_gtalk chat_skype chat_yahoo ) +
             %w( address_street address_state address_city address_postal_code address_country )
             
  
  def main_name
    is_company? ? company_name : name
  end
  
  def second_name
    is_company? ? name : company_name
  end
  
  def name
    "#{first_name || 'No'} #{last_name || 'Name'}"
  end
  
  def self.search(query)
    self.find(:all, :conditions => ["first_name LIKE ? OR last_name LIKE ? OR company_name LIKE ? OR notes LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"])
  end
  
  def update_all(params)
    transaction do
      update_attributes(params[:contact])
      
      params[:contact_line].each do |cl|
        logger.debug "#{cl.inspect}"
        if cl[0].to_i == 0
          contact_lines.find_or_create_by_label(cl[0]).update_attribute('value',cl[1][:value])
        else
          contact_line = contact_lines.find(cl[0])
          cl[1][:value].blank? ? contact_line.destroy : contact_line.update_attributes(cl[1]) 
        end
      end
      
      if main_name.blank? && second_name.blank?
        destroy
        return false
      else
        if company_name.blank? && is_company?
          update_attribute('is_company', false)
        elsif name.blank? && !is_company?
          update_attribute('is_company', true)
        end
        return true
      end
    end
  end
  
  @@labels.each do |label|
    define_method(label) do
      cl = read_contact_line(label)
      cl.value if cl
    end
    define_method("#{label}=") do |value|
      write_contact_line(label, value)
    end
  end
  
  def self.labels(prefix)
    @@labels.select { |label| label.include?(prefix) }.map { |label| [label.gsub("#{prefix}_", '').titleize, label] }
  end
  
  def phones
    contact_lines.find(:all, :conditions => "label LIKE 'phone%'")
  end
  
  def chats
    contact_lines.find(:all, :conditions => "label LIKE 'chat%'")
  end
  
  def websites
    contact_lines.find(:all, :conditions => "label LIKE 'web%'")
  end
  
  def emails
    contact_lines.find(:all, :conditions => "label LIKE 'email%'")
  end
  
  def address_lines
    contact_lines.find(:all, :conditions => "label LIKE 'address%'")
  end
  
  def map_address
    "#{address_line_value(:address_street)} #{address_line_value(:address_city)} #{address_line_value(:address_state)} #{address_line_value(:address_postal_code)} #{address_line_value(:address_country)}"
  end
  
  def address_line(address_line)
    cl = contact_lines.find_by_label(address_line.to_s)
    (cl && cl.value.blank?) ? ContactLine.new(:label => address_line.to_s) : cl
  end
  
  def address_line_value(address_line)
    (cl = address_line(address_line)) ? cl.value : nil
  end
  
  private
  def read_contact_line(label)
    contact_lines.find_by_label(label)
  end
  
  def write_contact_line(label, value)
    cl = contact_lines.find_or_create_by_label(label)
    cl.value = value
    cl.save
  end
end
