require_relative "contact"
require_relative "rolodex"

class CRM

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    
    case user_selected
    when 1
      add_new_contact
    when 2
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_all
    when 5
      display_attr
    end
 
  end

  def main_menu
    user_selected = 0
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected) 
    if user_selected == 6
      return "end"
    elsif user_selected > 6
      return "error"
    else 
      return "continue"  
    end
  end


  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Rolodex.add_contact(contact)
  end
  
  def modify_existing_contact
    Rolodex.contacts
  end

end

crm_action = "start"
the_CRM = CRM.new
while crm_action != "end" do 
  crm_action = the_CRM.main_menu
  puts "Not a valid selection, try again." if crm_action == "error"
end


# begin
#   call_option(user_selected)
# rescue
#   wrong option
#   print_main_menu
# raise