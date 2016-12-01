class Contact
attr_accessor(:first_name, :last_name, :job_title, :company, :mailing_address, :phone_numbers, :emails, :id)

  @@contacts =[]

  define_method(:initialize) do |parameters|
    @first_name = parameters.fetch(:first_name)
    @last_name = parameters.fetch(:last_name)
    @job_title = parameters.fetch(:job_title)
    @company = parameters.fetch(:company)
    @mailing_address = []
    @phone_numbers = []
    @emails = []
    @id = @@contacts.length().+(1)
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

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:find) do |id|
    found = nil
    @@contacts.each do |contact|
      if contact.id == id
        found = contact
      end
    end
    found
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end
end



# test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
# test_contact.save()
# test_contact2 = Contact.new({:first_name => "2", :last_name => "2", :job_title => "2", :company => "2" })
# test_contact2.save()
#
# p Contact.find(1)
