class Rolodex
  @contacts = []
  @id = 1001

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.loop_through_rolodex(output)

    placement = 0

    @contacts.each do |x|

      if output == "choices"
        puts "[" + (placement + 1).to_s + "] " + "#{x.first_name} " "#{x.last_name}"
      elsif output == "prints_all"
        puts "ID: #{x.id}: | First Name: #{x.first_name} | Last Name: #{x.last_name} | Email: #{x.email} | Note: #{x.note}"
      placement += 1
      end

    end

  end

  def self.display_all

    loop_through_rolodex("prints_all")

  end

  def self.add_new_contact

    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    add_contact(Contact.new(first_name, last_name, email, note))

  end
  
  def self.modify_existing_contact
    
    puts "Please choose which contact you'd like to modify:"

    loop_through_rolodex("choices")
    
    @contacts[gets.chomp.to_i - 1].modification

  end

  def self.delete_contact

    puts "What contact would you like to delete?"

    loop_through_rolodex("choices")

    @contacts.delete_at(gets.chomp.to_i-1)

  end

  def self.display_attr

    puts "What would you like to see? [1] first names [2] last names [3] emails [4] notes"

    choice = gets.chomp
    @contacts.each do |contact|
      case choice
      when "1"
        puts contact.first_name
      when "2"
        puts contact.last_name
      when "3"
        puts contact.email
      when "4"
        puts contact.note
      else
        "Not a valid entry."
      end
    end
  end
end
