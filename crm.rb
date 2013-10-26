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
      Rolodex.add_new_contact
    when 2
      Rolodex.modify_existing_contact
    when 3
      Rolodex.delete_contact
    when 4
      Rolodex.display_all
    when 5
      Rolodex.display_attr
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