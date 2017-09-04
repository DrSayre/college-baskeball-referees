class RefereeAssignment < ApplicationRecord
  belongs_to :referee
  belongs_to :game
  # after_save :update_referee

  # def update_referee
  #   referee.update(total_fouls: referee.games.sum(:fouls), total_possessions: referee.games.sum(:possessions), fouls_per_possession: referee.games.sum(:fouls).to_f/referee.games.sum(:possessions).to_f, fouls_change: referee.referee_team_stats.sum('referee_change * games').to_f / referee.referee_team_stats.sum(:games).to_f, number_of_games: referee.games.count.to_i / 2)
  # end
end
