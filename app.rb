require('./lib/contact')
require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")

get('/') do
  erb(:index)
end

get('/contact_new') do
  erb(:contact_form)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company}).save()
  erb(:success)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  id = params.fetch('id').to_i
  @contact = Contact.find(id)
  erb(:contact)
end

get('/contacts/:id/email_new') do
  id = params.fetch('id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  erb(:email_form)
end

post('/email') do
  address = params.fetch('address')
  type = params.fetch('type')
  id = params.fetch('contact_id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  @contact.add_email({:address => address, :type => type})
  erb(:success)
end

get('/contacts/:id/phone_new') do
  id = params.fetch('id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  erb(:phone_form)
end

post('/phone') do
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  type = params.fetch('type')
  id = params.fetch('contact_id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  @contact.add_phone({:area_code => area_code, :number=> number, :type => type})
  erb(:success)
end

get('/contacts/:id/mailing_address_new') do
  id = params.fetch('id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  erb(:mailing_form)
end

post('/address') do
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  type = params.fetch('type')
  id = params.fetch('contact_id').to_i #grabbing id
  @contact = Contact.find(id) #finding contact with id
  @contact.add_mailing({:street => street, :city => city, :state => state, :zip=> zip, :type => type})
  erb(:success)
end
