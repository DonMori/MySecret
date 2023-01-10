require_relative "handler/constants"
require_relative "handler/main"

# Create MySecret folder
Dir.mkdir(CONFIG_DIRECTORY) unless File.exists?(CONFIG_DIRECTORY)
Dir.mkdir(MYSECRET_DIRECTORY) unless File.exists?(MYSECRET_DIRECTORY)
Dir.mkdir(NOTES_DIRECTORY) unless File.exists?(NOTES_DIRECTORY)

while true
  # List notes
  notes = Dir.glob("#{NOTES_DIRECTORY}/*")
  puts "__________________________"
  puts "Existing notes on MySecret :"
  notes.each do |note|
    print "#{note.gsub! "#{NOTES_DIRECTORY}/", ""}; "
  end

puts "" # Creating space between lines

  # Display menu options
  valid_options = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  puts " ____________________________________"
  puts "|___________ | MySecret | ___________|"
  puts "|This is the MySecret User Interface.|"
  puts "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  puts "| [1] - Create new note              |"
  puts "| [2] - Read a note                  |"
  puts "| [3] - Edit a note                  |"
  puts "| [4] - Delete a note                |"
  puts "| [5] - Encrypt an existing note     |"
  puts "| [6] - Decrypt an existing note     |"
  puts "| [7] - Change secret key            |"
  puts "| [8] - Change text editor           |"
  puts "| [0] - Exit                         |"
  puts "|____________________________________|"
  print " -> "
  option = gets.chomp.to_i

  # Input Validation
  is_valid = valid_options.include? option
  if is_valid == false
    puts "error: invalid option" 
    return
  end
  if option == 0
    print 'cls' # se eu deixar o clear ele quebra o windows õ-ô era um bagulho print `clear` isso n funciona noup
    return
  end

  # Handle options
  handler(option)

  system("cls") # Cleans the CMD terminal
end
