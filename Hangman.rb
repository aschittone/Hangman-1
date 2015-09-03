class Game
  
  def initialize
    @turn = 0
    @guessed_letters = []
    @random_word = random_word
    @correct_letters = []
    @final_word = []
  end
  
  def random_word
    random_words = []
    
    File.foreach('5desk.txt').each do |word|
      if word.length > 5 && word.length < 12
        random_words << word
      end
    end
    random_words.sample.downcase
  end
  
  # Pops off the "\n" character that was added to the end of the array
  def hidden_word_array
    @hidden_word = @random_word.split("")
    @hidden_word.pop
  end
  
  def guess
    puts " "
    print "Please guess one letter: "
    letter = gets.chomp.to_s.downcase
    if @guessed_letters.include?(letter)
      puts "#{letter.upcase} has already been guessed!"
      guess
    elsif letter.length != 1
      puts "Please guess exactly 1 letter"
      guess
    else 
      @guessed_letters << letter
      if @hidden_word.include?(letter)
        puts "#{letter.capitalize} was found!"
        @correct_letters << letter
        match?(letter)
        puts ""
      else
        puts "#{letter} was not found!"
        @turn += 1
        puts
      end
    end
  end
  
  def turn
    puts ""
    puts "Turn Number: #{@turn}"
    puts "Letters Guessed: #{@guessed_letters}"
    guess
    print_tiles_array
  end
  
  def initialize_final_word_array
    word_length = @hidden_word.length
    word_length.times do 
      @final_word << " _ "
    end
  end
  
  def print_tiles_array
    @final_word.each do |letter, index|
      print " #{letter} "
    end
  end
  
  def win
  end
  
  def match?(letter)
    @hidden_word.each_with_index do |l, index|
      if l == letter
        @final_word[index] = letter
      end
    end
  end
    
  def play
    while @turn < 3
      turn
    end
  end
  
  def debug
    hidden_word_array
    initialize_final_word_array
    play
    puts
    puts
    puts "Sorry, but the correct answer was #{@random_word.upcase}."
  end
  
end
    
test = Game.new.debug