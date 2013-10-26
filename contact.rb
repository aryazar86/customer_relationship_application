class Contact

  attr_accessor :id, :first_name, :last_name, :email, :note 

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def modification

    puts "#{@first_name} #{@last_name}: What would you like to modify?"

    choices = {"1" => "first name", "2" => "last name", "3" => "email", "4" => "note"}
    choices.each do |k, v|
      puts "[" + "#{k.to_s}" + "]" + "#{v}"
    end

    choice = gets.chomp

    puts "Are you sure you want to modify this user's #{choices[choice]}, Y or N?"

    if gets.chomp.downcase == "y"

      case choice
      when "1"
        puts "Please enter a new first name:"
        @first_name = gets.chomp
      when "2"
        puts "Please enter a new last name"
        @last_name = gets.chomp
      when "3"
        puts "Please enter a new email address"
        @email = gets.chomp
      when "4"
        puts "Please enter a new note"
        @note = gets.chomp
      end
      
      puts "Here is the new profile: #{@first_name} #{@last_name} #{@email} #{@note}"
    
    end
  end
end
