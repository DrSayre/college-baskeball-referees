class SetFieldsToReferee < ActiveRecord::Migration[5.1]
  def self.up
    Referee.all.each do |referee|
      total_possessions = referee.games.sum(:possessions)
      total_fouls = referee.games.sum(:fouls)
      fouls_per_possession = total_fouls.to_f/total_possessions.to_f
      average_fouls_per_possession = referee.teams.sum(:fouls_per_possession)/referee.teams.count.to_f
      change = (fouls_per_possession.to_f - average_fouls_per_possession.to_f)/average_fouls_per_possession.to_f
      referee.update(total_possessions: total_possessions, total_fouls: total_fouls, fouls_per_possession: fouls_per_possession, change: change)
    end
  end
end
