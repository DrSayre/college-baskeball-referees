SELECT row_number() OVER (ORDER BY referee_assignments.referee_id) AS id,
    referee_assignments.referee_id,
    games.team_id,
    sum(games.fouls) AS total_fouls,
    sum(games.possessions) AS total_possessions,
    ((sum(games.fouls))::numeric / (sum(games.possessions))::numeric) AS fouls_per_possession,
    (((sum(games.fouls))::numeric / (sum(games.possessions))::numeric)/(SELECT fouls_per_possession FROM teams WHERE id = games.team_id LIMIT 1)::numeric - 1.0) AS referee_change,
    count(*) AS games
   FROM games,
    referee_assignments
  WHERE (games.id = referee_assignments.game_id)
  GROUP BY games.team_id, referee_assignments.referee_id;