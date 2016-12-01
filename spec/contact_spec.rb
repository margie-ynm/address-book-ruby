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
end
