require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the contact path', {:type => :feature}) do
  it('opens the form to create a new contact') do
    visit('/')
    expect(page).to have_content("Welcome to your Address Book")
    click_link("Add a contact")
    expect(page).to have_content("Add a contact")
  end

  it('displays list of all contacts') do
    visit('/')
    expect(page).to have_content("Welcome to your Address Book")
    click_link("View Contacts")
    expect(page).to have_content("Contact List")
  end
end


describe('the new contact form path', {:type => :feature}) do
  it('creates a new contact from user input and renders success page') do
    visit('/contacts/new')
    fill_in("first_name", :with => "Mike")
    fill_in("last_name", :with => "Smith")
    fill_in("job_title", :with => "CEO")
    fill_in("company", :with => "Shoetopia")
    click_button("submit")
    expect(page).to have_content("Success!")
  end
end
