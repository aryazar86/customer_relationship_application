class Rolodex
  @contacts = []
  @id = 1001

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.contacts
    @contacts.each do |x|
      puts "#{x.id} #{x.first_name} #{x.last_name} #{x.email} #{x.note}"
    end
  end

end
