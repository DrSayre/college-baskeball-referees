class Referee < ApplicationRecord
  has_many :referee_assignments, dependent: :destroy
  has_many :games, through: :referee_assignments
  has_many :teams, through: :games
  has_many :referee_team_stats

  def self.update_stats_column
    all.each do |ref|
      ref.update(total_fouls: ref.games.sum(:fouls), total_possessions: ref.games.sum(:possessions), fouls_per_possession: ref.games.sum(:fouls).to_f/ref.games.sum(:possessions).to_f, fouls_change: ref.referee_team_stats.sum('referee_change * games').to_f / ref.referee_team_stats.sum(:games).to_f)
    end
  end

  def self.update_number_of_games
    all.each do |ref|
      ref.update(number_of_games: ref.games.count/2)
    end
  end

  def self.merge_ref(wrong, right)
    wrong_ref = find(wrong)
    right_ref = find(right)
    wrong_ref.referee_assignments.each do |assignment|
      assignment.update(referee: right_ref)
    end
    wrong_ref.destroy
  end
end
