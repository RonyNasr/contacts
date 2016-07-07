class Contact
  attr_accessor(:first_name, :last_name, :job_title, :company, :phone_numbers, :mail_addresses, :emails, :id)

  @@contacts = []
  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @phone_numbers = []
    @mail_addresses = []
    @emails = []
    @id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method (:save) do
    @@contacts.push(self)
  end

  define_method (:add_address) do |address|
    address.id = self.mail_addresses.length() + 1
    self.mail_addresses.push(address)
  end

  define_method (:add_phone_number) do |phone_number|
    phone_number.id = self.phone_numbers.length() + 1
    self.phone_numbers.push(phone_number)
  end

  define_method (:add_email) do |email|
    email.id = self.emails.length() + 1
    self.emails.push(email)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

end

class MailAddress
  attr_accessor(:type, :street, :city, :state, :zip, :id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @id = nil
  end
end

class PhoneNumber
  attr_accessor(:type,:number, :id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @number = attributes.fetch(:number)
    @id = nil
  end
end


class Email
  attr_accessor(:type, :email, :id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @email = attributes.fetch(:email)
    @id = nil
  end

end
