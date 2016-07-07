require('rspec')
require('contact')

describe("Contact") do
  before do
    Contact.clear()
  end

  it('returns the first name of the contact') do
    test_contact = Contact.new({:first_name => "Mike", :last_name => "Smith", :job_title => "CEO", :company => "Turbotype"})
    expect(test_contact.first_name()).to(eq("Mike"))
    expect(test_contact.last_name()).to(eq("Smith"))
    expect(test_contact.job_title()).to(eq("CEO"))
    expect(test_contact.company()).to(eq("Turbotype"))
  end

  it("adds a mail address to a contact") do
    test_address = MailAddress.new({:type => "home", :street => "123 main st", :city => "Portland", :state => 'OR', :zip => "90435" })
    test_contact = Contact.new({:first_name => "Mike", :last_name => "Smith", :job_title => "CEO", :company => "Turbotype"})
    expect(test_contact.add_address(test_address)[0]).to(eq(test_address))
  end

  it("adds a phone number to a contact") do
    test_phone = PhoneNumber.new({:type => "home", :number => "1234567890"})
    test_contact = Contact.new({:first_name => "Mike", :last_name => "Smith", :job_title => "CEO", :company => "Turbotype"})
    expect(test_contact.add_phone_number(test_phone)[0]).to(eq(test_phone))
  end

  it("adds a email address to a contact") do
    test_email = Email.new({:type => "personal", :email => "abc@asd.com"})
    test_contact = Contact.new({:first_name => "Mike", :last_name => "Smith", :job_title => "CEO", :company => "Turbotype"})
    expect(test_contact.add_email(test_email)[0]).to(eq(test_email))
  end

  it("saves a contact to the list of contacts") do
    test_contact = Contact.new({:first_name => "Mike", :last_name => "Smith", :job_title => "CEO", :company => "Turbotype"})
    test_contact.save()
    expect(Contact.all()).to(eq([test_contact]))
  end

end

describe ("MailAddress") do
  it("returns a mailing address") do
    test_address = MailAddress.new({:type => "home", :street => "123 main st", :city => "Portland", :state => 'OR', :zip => "90435" })
    expect(test_address.type()).to(eq("home"))
    expect(test_address.street()).to(eq("123 main st"))
    expect(test_address.city()).to(eq("Portland"))
    expect(test_address.state()).to(eq("OR"))
    expect(test_address.zip()).to(eq("90435"))
  end
end

describe(PhoneNumber) do
  it ("returns a phone number ") do
    test_phone = PhoneNumber.new({:type => "home", :number => "1234567890"})
    expect(test_phone.type()).to(eq("home"))
    expect(test_phone.number()).to(eq("1234567890"))
  end
end

describe(Email) do
  it ("returns an email address ") do
    test_email = Email.new({:type => "personal", :email => "abc@asd.com"})
    expect(test_email.type()).to(eq("personal"))
    expect(test_email.email()).to(eq("abc@asd.com"))
  end
end
