class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
	begin 
		raise NoSuchStrategyError,
			"Strategy must be one of R,P,S" if /[^RPS]/.match(player1[1]) || /[^RPS]/.match(player2[1]) 
	if player1[1] == 'P'
		if player2[1] == 'S'
			return player2
		else
			return player1
		end
	end
	if player1[1] == 'S'
		if player2[1] == 'R'
			return player2
		else
			return player1
		end
	end
	if player1[1] == 'R'
		if player2[1] == 'P'
			return player2
		else
			return player1
		end
	end
	rescue NoSuchStrategyError => exception
		"#{exception.message}"
	end
  end

  def self.tournament_winner(tournament)
	if (tournament[0][0].is_a? String) && tournament.size == 2
		return winner(tournament[0], tournament[1])
	end
	return tournament_winner([tournament_winner(tournament[0]), tournament_winner(tournament[1])])
  end

end

puts RockPaperScissors != nil
puts RockPaperScissors.winner(['abc', 'P'], ['def', 'S']) == ['def', 'S']
puts RockPaperScissors.winner(['abc', 'P'], ['def', 'R']) == ['abc', 'P']
puts RockPaperScissors.winner(['abc', 'P'], ['def', 'P']) == ['abc', 'P']
puts RockPaperScissors.winner(['abc', 'R'], ['def', 'S']) == ['abc', 'R']
puts RockPaperScissors.winner(['abc', 'R'], ['def', 'P']) == ['def', 'P']
puts RockPaperScissors.winner(['abc', 'S'], ['def', 'S']) == ['abc', 'S']
puts RockPaperScissors.winner(['abc', 'R'], ['def', 'R']) == ['abc', 'R']
puts RockPaperScissors.winner(['a', 'T'], ['b', 'R']) == "RockPaperScissors::NoSuchStrategyError: Strategy must be one of R,P,S"
puts RockPaperScissors.winner(['a', 'R'], ['b', 'T']) == "RockPaperScissors::NoSuchStrategyError: Strategy must be one of R,P,S"
puts RockPaperScissors.winner(['a', 'w'], ['b', 'R'])
#tournament
puts RockPaperScissors.tournament_winner([
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]) == ["Richard", "R"]

puts RockPaperScissors.tournament_winner([['a', 'P'], ['b', 'R']]) == ['a', 'P']
