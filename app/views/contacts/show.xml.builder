xml.contact(:id => @contact.id) do
  xml.name do
    xml.main(@contact.main_name)
    xml.second(@contact.second_name)
  end

  %w{phones emails websites chats}.each do |cat|
    xml.tag!(cat) do
      for cl in @contact.send(cat)
        xml.label(cl.show_label)
        xml.value(cl.value)
      end
    end
  end
  
  xml.address do
    [:street, :city, :state, :postal_code, :country].each do |label|
      unless (clv = @contact.address_line("address_#{label}".to_sym).value).blank?
        xml.tag!(label, clv)
      end
    end
  end
  
end