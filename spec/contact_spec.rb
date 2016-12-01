require('contact')
require('rspec')

describe(Contact) do
  describe('#initialize') do
    it("check the initial attributes") do
      test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
      expect(test_contact.first_name).to(eq("Colin"))
      expect(test_contact.last_name).to(eq("Farrell"))
      expect(test_contact.job_title).to(eq("Actor"))
      expect(test_contact.company).to(eq("Hollywood"))
    end
  end
  describe('#add_mailing') do
    it "will add a new mailing address to the contact" do
      test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
      test_contact.add_mailing({:street => '123 Happy Lane', :city => 'Seattle', :state => 'Washington', :zip => '98234', :type => 'home' })
      expect(test_contact.mailing_address[0].fetch(:street)).to(eq('123 Happy Lane'))
    end
  end
  describe("#add_phone") do
    it "add a new phone number for the contact" do
      test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
      test_contact.add_phone({:area_code => "503", :number => '887-8899', :type => "home"})
      expect(test_contact.phone_numbers[0].fetch(:type)).to(eq('home'))

    end
  end
  describe("#add_email") do
    it "add a new email number for the contact" do
      test_contact = Contact.new({:first_name => "Colin", :last_name => "Farrell", :job_title => "Actor", :company => "Hollywood" })
      test_contact.add_email({:address => "yoyoyo@bmail.com", :type => "work"})
      expect(test_contact.emails[0].fetch(:type)).to(eq('work'))
    end
  end
end
