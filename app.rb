require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  erb(:index)
end

get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  Contact.new(params.inject({}){|param,(k,v)| param[k.to_sym] = v; param}).save()
  @contacts = Contact.all()
  erb(:success)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

post('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  parameters = params.delete_if{|key, value|["id", "splat", "captures"].include?(key)}
  parameters = parameters.inject({}){|param,(k,v)| param[k.to_sym] = v; param}
  new_address =  MailAddress.new(parameters)
  @contact.add_address(new_address)
  erb(:success)
end

get('/contacts/:id/address/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:mail_address_form)
end
