include Looping

class Rolodex

  @contacts = [Contact.new("Arya", "Iranpour", "arya.iranpour@gmail.com", "Me, myself & I"), Contact.new("Jamshed", "Irani", "jamshed.rohinton@gmail.com", "Hubby Wubby")]
  @id = 1001

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.loop_through_rolodex(desired_output)

    placement = 0

    @contacts.each do |x|
      if desired_output == "choices"
        puts "[" + (placement + 1).to_s + "] " + "#{x.first_name} " "#{x.last_name}\n\n"
        placement += 1
      elsif desired_output == "print_all"
        puts "ID: #{x.id} \nFIRST NAME: #{x.first_name} \nLAST NAME: #{x.last_name} \nEMAIL: #{x.email} \nNOTE: #{x.note}\n\n"
      end

    end

  end

  # def self.display_all

  #   loop_through_rolodex("prints_all")

  # end

  def self.add_new_contact

    add_more = "y"

    while add_more.downcase == "y" do
      puts "\nADD NEW CONTACT:\n\n" 
      sleep 0.5
      print "Enter First Name: "
      first_name = gets.chomp
      print "Enter Last Name: "
      last_name = gets.chomp
      print "Enter Email Address: "
      email = gets.chomp
      print "Enter a Note: "
      note = gets.chomp
      add_contact(Contact.new(first_name, last_name, email, note))

      puts "\nContact added!" 
      sleep 0.5
      puts "\nWould you like to add another contact?" 
      add_more = gets.chomp

    end

  end
  
  def self.modify_existing_contact
    
    puts "Please choose which contact you'd like to modify:\n\n"

    loop_through_rolodex("choices")

    print "Your choice: "

    @contacts[gets.chomp.to_i - 1].modification

  end

  def self.delete_contact

    puts "What contact would you like to delete?\n"

    loop_through_rolodex("choices")

    choice = gets.chomp.to_i - 1

    print "\nAre you sure you want to delete #{@contacts[choice].first_name} #{@contacts[choice].last_name}? Hit y to confirm: "
    
    choice = gets.chomp
    puts "#{choice}"

    if choice.downcase == "y"
      @contacts.delete_at(choice.to_i)
      puts "\nContact deleted."
    else
      "\nDeletion cancelled."
    end
  end

  def self.display_attr

    puts "What attribute would you like to see?\n\n"

    choice = loop_through_attributes

    puts "\nYou chose #{find_attr(choice)}s:\n\n"

    @contacts.each do |contact|
      case choice
      when "1"
        puts contact.first_name + "\n\n"
      when "2"
        puts contact.last_name + "\n\n"
      when "3"
        puts contact.email + "\n\n"
      when "4"
        puts contact.note + "\n\n"
      end
    end
  end
end
