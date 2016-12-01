class Contact
attr_accessor(:first_name, :last_name, :job_title, :company, :mailing_address, :phone_numbers, :emails)

  define_method(:initialize) do |parameters|
    @first_name = parameters.fetch(:first_name)
    @last_name = parameters.fetch(:last_name)
    @job_title = parameters.fetch(:job_title)
    @company = parameters.fetch(:company)
    @mailing_address = []
    @phone_numbers = []
    @emails = []
  end

  define_method(:add_mailing) do |parameters|
    street = parameters.fetch(:street)
    city = parameters.fetch(:city)
    state = parameters.fetch(:state)
    zip = parameters.fetch(:zip)
    type = parameters.fetch(:type)
    @mailing_address.push({:street => street, :city => city, :state => state, :zip => zip, :type => type})
  end


  define_method(:add_phone) do |parameters|
    area_code = parameters.fetch(:area_code)
    number = parameters.fetch(:number)
    type = parameters.fetch(:type)
    @phone_numbers.push({:area_code => area_code, :number => number, :type => type})
  end

  define_method(:add_email) do |parameters|
    address = parameters.fetch(:address)
    type = parameters.fetch(:type)
    @emails.push({:address => address, :type => type})
  end

end



# test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
# test_contact.add_mailing({:street => '123 Happy Lane', :city => 'Seattle', :state => 'Washington', :zip => '98234', :type => 'home' })
# test_contact.add_mailing({:street => 'Another street', :city => 'Portland', :state => 'Oregon', :zip => '123123', :type => 'home' })
#
# p test_contact.mailing_address[1].fetch(:street)
