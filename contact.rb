module Looping

  def loop_through_attributes

    @choices = {"1" => "first name", "2" => "last name", "3" => "email", "4" => "note"}

    @choices.each do |k, v|
      puts "[" + "#{k.to_s}" + "] " + "#{v}"
    end

    print "\nYour choice: "
    choice = gets.chomp

    while @choices.has_key?(choice) != true
      print "Not a valid option, try again: "
      choice = gets.chomp
    end 

    return choice

  end

  def find_attr(choice)

    return @choices[choice]
  end

end

class Contact

  attr_accessor :id, :first_name, :last_name, :email, :note

  include Looping

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def modification

    puts "\nFor #{@first_name} #{@last_name}, what would you like to modify?\n\n"

    choice = loop_through_attributes

    print "\nPlease enter a new #{@choices[choice]}: "

    change = gets.chomp

    puts "\nAre you sure you want to modify this user's #{@choices[choice]} to #{change}, Y or N?"
    if gets.chomp.downcase == "y"
      case choice.to_s
      when "1"
        @first_name = change
      when "2"
        @last_name = change
      when "3"
        @email = change
      when "4"
        @note = change
      end
      puts "\nModification has been made. Profile now reads:"
      puts "\nID: #{@id} \nFIRST NAME: #{@first_name} \nLAST NAME: #{@last_name} \nEMAIL: #{@email} \nNOTE: #{@note}\n\n"
    else
      puts "Change cancelled."
    end 
  end

end
