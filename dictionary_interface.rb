require "./lib/dictionary"
require './lib/word'
require './lib/definition'
require 'pry'

def main_menu
  puts ""
  puts 'Welcome to the Ruby Dictionary'
  puts '--------------'
  puts "Press 'A' to add a new word to the dictionary"
  puts "Press 'S' to search for a term in your dictionary"
  puts "Press 'D' to display words with definitions"
  puts "Press 'L' to show all the words you have added, and edit one"
  puts "Press 'X' to exit"

  main_choice = gets.chomp.downcase

  if main_choice == 'a'
    new_term
  elsif main_choice == 'l'
    show_words
  elsif main_choice == 's'
    search
  elsif main_choice == 'd'
    show_dictionary
  elsif main_choice == 'x'
    puts "Thanks for using Ruby Dictionary, Good-Bye!"
  else
    puts "Invalid choice please try something else."
    main_menu
  end
end

def new_term
  puts "Enter a new word:"
  word = gets.chomp
  puts "Enter the definition:"
  definition = gets.chomp
  Term.create(word, definition)
  main_menu
end

def show_dictionary
  puts "\nEntries: "
  Term.all.each do |term|
    puts term.word.word + ": " + term.definition.defi
  end
  main_menu
end

def show_words
  puts "\n"
  Term.all.each { |term| puts term.word.word }
  puts "\n"
  puts "Press 'E' if you would like to edit an entry, or 'M' to return to the Main Menu"
  choice = gets.chomp.downcase
  if choice == 'e'
    edit_menu
  elsif choice == 'm'
    main_menu
  else
    puts "That is not a valid option"
    show_words
  end
end

def edit_menu
  puts "What word you would like to edit?: "
  edit_word = gets.chomp
  puts "\nPress 'W' to edit #{edit_word}."
  puts "Press 'D' to edit #{edit_word}'s definition."
  puts "Press 'A' to add another definition to #{edit_word}"
  puts "Press 'L' to add #{edit_word} in another language"
  puts "Press 'X' to delete this word from your dictionary"
  edit_choice = gets.chomp.downcase

  if edit_choice == 'w'
    Term.all.select do |term|
      if term.word.word.eql? edit_word
      puts "What would you like to change #{edit_word} to"
        new_word = gets.chomp
        term.word.edit_word(new_word)
        show_dictionary
      else
        puts "That is not a word in the dictionary"
        edit_menu
      end
    end
  elsif edit_choice == 'd'
    Term.all.select do |term|
      if term.word.word.eql? edit_word
      puts "What would you like to change #{edit_word}'s definition to"
        new_def = gets.chomp
        term.definition.edit_defi(new_def)
        show_dictionary
      else
        puts "That is not a word in the dictionary"
        edit_menu
      end
    end
  elsif edit_choice == 'a'
    "Please enter the additional definition: "
    new_def = gets.chomp
    Term.all.each do |x|
      if x.word == edit_word
        x.def_array << new_def
      end
    end
    main_menu
  elsif edit_choice == 'l'
    "Please enter the word's equivalent in the new language: "
    new_language = gets.chomp
    Term.all.each do |x|
      if x.word == edit_word
        x.word_array << new_language
      end
    end
    main_menu
  elsif edit_choice == 'x'
    Term.all.delete_if {|stuff| stuff.word == edit_word}
    show_definitions
  end
end

def search
  puts "Enter a word to search: "
  search_word = gets.chomp
  search_word = Term.search(search_word)
  puts search_word.word + ": " + search_word.definition
  main_menu
end

main_menu
