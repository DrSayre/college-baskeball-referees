class Team < ApplicationRecord
  has_many :games
  has_many :opponent_teams, through: :games
  has_many :referees, through: :games
  has_many :referee_team_stats
  before_save :update_fouls_per_possession

  def update_fouls_per_possession
    self.fouls_per_possession = total_fouls.to_f / total_possessions.to_f
  end

  def self.set_win_loss
    Team.all.each do |team|
      wins = team.games.where('points > opponent_points').count
      losses = team.games.where('opponent_points > points').count
      total_games = team.games.count
      winning_percentage = wins.to_f / total_games.to_f
      total_fouls = team.games.sum(:fouls)
      total_possessions = team.games.sum(:possessions)
      fouls_per_possession = total_fouls.to_f/total_possessions.to_f
      team.update(wins: wins, losses: losses, number_of_games: total_games, winning_percentage: winning_percentage, total_possessions: total_possessions, total_fouls: total_fouls, fouls_per_possession: fouls_per_possession)
    end
  end
end
