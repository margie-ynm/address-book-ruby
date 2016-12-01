require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe("testing the site", {:type => :feature}) do
  before() do
    Contact.clear
  end
  describe('/') do
    it "routes to the home path" do
      visit("/")
      expect(page).to have_content("Address Book")
    end
  end
  describe('/contact_new') do
    it "creates a new contact" do
      visit('/')
      click_link('Add a new contact')
      fill_in('first_name' , :with=>'Colin')
      fill_in('last_name' , :with=>'Farrell')
      fill_in('job_title' , :with=>'Actor')
      fill_in('company' , :with=>'Hollywood')
      click_button('Add contact')
      expect(page).to have_content('Success')
    end
  end
  describe('/contacts') do
    it "displays all contacts" do
      visit('/')
      click_link('All Contacts')
      expect(page).to have_content('Contact List')
    end
  end
  describe('/email_new') do
    Contact.clear()
    it "creates a new email under existing contact" do
      visit('/contact_new')
      fill_in('first_name' , :with=>'Colin')
      fill_in('last_name' , :with=>'Farrell')
      fill_in('job_title' , :with=>'Actor')
      fill_in('company' , :with=>'Hollywood')
      click_button('Add contact')
      visit('contacts/1')
      click_link('Add emails')
      fill_in('address', :with=>'yayaya@gmail.com')
      fill_in('type', :with=> 'work')
      click_button('Add email')
      expect(page).to have_content('Success')

    end
  end
end
