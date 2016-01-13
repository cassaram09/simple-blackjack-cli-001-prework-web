def welcome #welcomes the player
  puts "Welcome to the Blackjack Table"
end

def deal_card #deals a random card between (including) 1 and 11
  card = rand(1..11)
  return card
end

def display_card_total(card_total) #displays the player's total from two cards
  puts "Your cards add up to #{card_total}"
end

def prompt_user #prompts the player to hit or stay
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input #gets the player's response
  input = gets.chomp
  return input
end

def end_game(card_total) #message displayed at the end of the game
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round #first round of card dealt to the player. Two cards. Adds them and returns the sum
  card1 = deal_card
  card2 = deal_card
  sum = card1 + card2
  display_card_total(sum)
  return sum
end

def invalid_command #tells the player that the command they entered is incorrect
  puts "Please enter a valid command"
end

def hit?(card_total) #asks the player if they want to hit (another card)
  prompt_user
  action = get_user_input
  if action == "s" #player stays, does not get dealt a card. Initial_round card total is returned.
    return card_total
  elsif action == 'h' #player is dealt a card, and that amount is added to the players card total. New card total is returned. 
    card = deal_card
    card_total += card
    return card_total
  else 
    invalid_command
    return card_total
  end
  
end



#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome #welcomes player 
  cardtotal = initial_round #stores the two cards from the first dealing
  until cardtotal > 21 #until their card total is greater than 21
    cardtotal = hit?(cardtotal) #set the new card total equal to the player's decision
    display_card_total(cardtotal)
    if cardtotal == 21
      puts "You cards add up to #{cardtotal}! Blackjack!"
      return
    end
  end
    end_game(cardtotal) #ends the game and returns player's cardtotal
end
 


