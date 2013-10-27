require_relative "contact"
require_relative "rolodex"

class CRM

  def continue
    puts "\n\n--------------------------------------------"
    puts "Hit ENTER to continue whenever you're ready."
    puts "--------------------------------------------"
    gets
  end 

  def print_main_menu
    puts "\e[H\e[2J"
    puts "MAIN MENU | Please select from one of the following options: \n\n"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit\n\n"
    print "Enter a number: "
  end

  def call_option(user_selected)

    case user_selected
    when 1
      puts "\e[H\e[2J"
      Rolodex.add_new_contact
      continue
    when 2
      puts "\e[H\e[2J"
      Rolodex.modify_existing_contact
      continue
    when 3
      puts "\e[H\e[2J"
      Rolodex.delete_contact
      continue
    when 4
      puts "\e[H\e[2J"
      Rolodex.loop_through_rolodex("print_all")
      continue
    when 5
      puts "\e[H\e[2J"
      Rolodex.display_attr
      continue
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