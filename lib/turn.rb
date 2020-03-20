require './lib/deck'
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
end
