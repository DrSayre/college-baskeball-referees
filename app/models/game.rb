class Game < ApplicationRecord
  belongs_to :team
  belongs_to :opponent_team, class_name: 'Team', foreign_key: 'opponent_team_id'
  has_many :referee_assignments
  has_many :referees, through: :referee_assignments
  after_save :update_team

  def update_team
    team_record = team
    wins = team_record.games.where('points > opponent_points').count
    losses = team_record.games.where('points < opponent_points').count
    team.update(total_possessions: team_record.games.sum(:possessions), total_fouls: team_record.games.sum(:fouls), wins: wins, losses: losses, number_of_games: team_record.games.count, winning_percentage: wins.to_f / (wins.to_f + losses.to_f))
  end
end
