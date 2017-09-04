class SetFieldsToTeam < ActiveRecord::Migration[5.1]
  def self.up
    Team.all.each do |team|
      total_possessions = team.games.sum(:possessions)
      total_fouls = team.games.sum(:fouls)
      fouls_per_possession = total_fouls.to_f/total_possessions.to_f
      team.update(total_possessions: total_possessions, total_fouls: total_fouls, fouls_per_possession: fouls_per_possession)
    end
  end
end
