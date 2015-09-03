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
  
  def start
    puts "================================================================="
    puts "Hello!  Welcome to a command line version of the classic Hangman."
    puts "The word we have chosen for you is #{@random_word.length} letters long.  Good Luck!" 
    puts "================================================================="
  end
  
  def guess
    print "Please guess a letter: "
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
        puts ""
        puts "#{letter.capitalize} was found!"
        @correct_letters << letter
        match?(letter)
      else
        puts ""
        puts "#{letter.capitalize} was not found!"
        @turn += 1
      end
    end
  end
  
  def turn
    puts "Letters Guessed: #{@guessed_letters}"
    guess
    hangman_graphic
    print_tiles_array
    puts ""
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
  
  def match?(letter)
    @hidden_word.each_with_index do |l, index|
      if l == letter
        @final_word[index] = letter
      end
    end
  end
    
  def play
    while @turn < 6
      turn
      win
    end
  end
  
  def run
    hidden_word_array
    initialize_final_word_array
    start
    play
    puts ""
    puts "Game Over!"
    puts "The special word was actually #{@random_word}"
  end
  
  def win
    if @hidden_word.all? { |letters| @correct_letters.include?(letters) }
      puts "You won! Congrats!"
      puts ""
      abort
    end
  end
  
  def hangman_graphic
    case @turn
    when 0
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 1
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 2
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "      |        |"
      puts "      |        |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 3
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "      |/       |"
      puts "      |        |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 4
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "     \\|/       |"
      puts "      |        |"
      puts "               |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 5
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "     \\|/       |"
      puts "      |        |"
      puts "     /         |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    when 6
      puts ""
      puts "      __________"
      puts "      |        |"
      puts "      0        |"
      puts "     \\|/       |"
      puts "      |        |"
      puts "     / \\       |"
      puts "               |"
      puts "               |"
      puts "    ------------"
    end
  end
  
end
    
test = Game.new.run