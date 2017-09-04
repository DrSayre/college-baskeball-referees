# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170903224102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "team_id"
    t.integer "fouls"
    t.integer "possessions"
    t.date "played_at"
    t.integer "opponent_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.integer "opponent_points"
    t.integer "overtimes"
    t.index ["opponent_team_id"], name: "index_games_on_opponent_team_id"
    t.index ["played_at", "team_id", "opponent_team_id"], name: "index_games_on_played_at_and_team_id_and_opponent_team_id", unique: true
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "referee_assignments", force: :cascade do |t|
    t.integer "referee_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "referee_id"], name: "index_referee_assignments_on_game_id_and_referee_id", unique: true
    t.index ["game_id"], name: "index_referee_assignments_on_game_id"
    t.index ["referee_id"], name: "index_referee_assignments_on_referee_id"
  end

  create_table "referees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_possessions", default: 0
    t.integer "total_fouls", default: 0
    t.decimal "fouls_per_possession", default: "0.0"
    t.decimal "fouls_change", default: "0.0"
    t.integer "number_of_games"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_possessions", default: 0
    t.integer "total_fouls", default: 0
    t.decimal "fouls_per_possession", default: "0.0"
    t.integer "number_of_games"
    t.integer "wins"
    t.integer "losses"
    t.decimal "winning_percentage"
    t.boolean "division_i", default: false
  end


  create_view "referee_team_stats",  sql_definition: <<-SQL
      SELECT row_number() OVER (ORDER BY referee_assignments.referee_id) AS id,
      referee_assignments.referee_id,
      games.team_id,
      sum(games.fouls) AS total_fouls,
      sum(games.possessions) AS total_possessions,
      ((sum(games.fouls))::numeric / (sum(games.possessions))::numeric) AS fouls_per_possession,
      ((((sum(games.fouls))::numeric / (sum(games.possessions))::numeric) / ( SELECT teams.fouls_per_possession
             FROM teams
            WHERE (teams.id = games.team_id)
           LIMIT 1)) - 1.0) AS referee_change,
      count(*) AS games
     FROM games,
      referee_assignments
    WHERE (games.id = referee_assignments.game_id)
    GROUP BY games.team_id, referee_assignments.referee_id;
  SQL

end
