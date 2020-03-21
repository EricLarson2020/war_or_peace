require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_accessor :player1, :player2, :spoils_of_war, :turn
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if
      player1.deck.rank_of_card_at(0)!= player2.deck.rank_of_card_at(0)
      turn = :basic
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      turn = :mutually_assured_destruction
    else
      turn = :war
    end
  end

  def winner


    # if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    #   turn = :basic
    #
    # elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
    #   player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    #   turn = :mutually_assured_destruction
    # else turn = :war
    # end

    if type == :basic &&

      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    elsif type == :basic &&
      player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
      player2
    elsif type == :war &&
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif type == :war &&
      player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
      player2
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      turn = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      turn = :mutually_assured_destruction
    else turn = :war
    end

    if turn == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card

    elsif turn == :war
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card

    elsif turn == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
    end
  end


  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
    winner.deck.cards = winner.deck.cards.flatten

  end

  def start

    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}"
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    input = gets.chomp.upcase
    if input == "GO"
      p "The game has started!"
count= 0
      # until player1.has_lost? == true || player2.has_lost? == true
      loop do
        count += 1

        # if  player1.has_lost? == true || player2.has_lost? == true
        #   break



        pile_cards
              if  player1.has_lost? == true || player2.has_lost? == true
                break

              else
        winner
        award_spoils(winner)


if @spoils_of_war.length == 2
        p "Turn #{count}: #{winner.name} won #{@spoils_of_war.length} cards"
elsif @spoils_of_war.length == 6
        p "Turn #{count}: WAR - #{winner.name} won #{@spoils_of_war.length} cards"
else @spoils_of_war.length == 0
        p "Turn #{count}: *mutually assured destruction* #{@spoils_of_war.length}cards removed from"
        p "play"
      end

        @spoils_of_war.clear
      # if  player1.has_lost? == true || player2.has_lost? == true
      #   break
      end
    end
   end
   
 end
end
# @rank=3, @suit=:spades, @value="3"
# @rank=12, @suit=:clubs, @value="Queen" -player2

#player 1 (spoils of war appended to bottom of player1 array)
#1: rank=6, @suit=:spades, @value="6"
#2: @rank=13, @suit=:clubs, @value="King"
#-1:@rank=11, @suit=:clubs, @value="Jack"
#-2:rank=8, @suit=:clubs, @value="8"

#player 2
#1:@rank=2, @suit=:spades, @value="2"
#2:@rank=4, @suit=:spades, @value="4"
#-1:@rank=10, @suit=:clubs, @value="10"
#-2:@rank=9, @suit=:clubs, @value="9"
