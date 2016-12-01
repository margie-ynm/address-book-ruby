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
