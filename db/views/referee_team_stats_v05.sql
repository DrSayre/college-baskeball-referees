SELECT row_number() OVER (ORDER BY referee_assignments.referee_id) AS id,
    referee_assignments.referee_id,
    games.team_id,
    sum(games.fouls) AS total_fouls,
    sum(games.possessions) AS total_possessions,
    ((sum(games.fouls))::numeric / (sum(games.possessions))::numeric) AS fouls_per_possession,
    (( (((sum(games.fouls))::numeric / (sum(games.possessions))::numeric) - (SELECT sum(fouls) FROM games WHERE team_id = games.team_id)::numeric / (SELECT sum(possessions) FROM games WHERE team_id = games.team_id)::numeric)) / ((SELECT sum(fouls) FROM games WHERE team_id = games.team_id)::numeric / (SELECT sum(possessions) FROM games WHERE team_id = games.team_id)::numeric) ) AS referee_change,
    count(*) AS count 
   FROM games,
    referee_assignments
  WHERE (games.id = referee_assignments.game_id)
  GROUP BY games.team_id, referee_assignments.referee_id;