# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'uri'
require 'open-uri'
require 'nokogiri'


def team_coach(team_name)
  # FIND THE TEAM'S CODE
  season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=d5wwmmjjqu9bqa4x7zdwqvg5'))
  puts
  games = season_schedule_url.xpath('//game')
  teams = []
  teams_code = Hash.new
  games.each do |game|
    away_team = game.xpath('away//@name') + game.xpath('away//@id')
    home_team = game.xpath('home//@name') + game.xpath('home//@id')
    away_name = game.xpath('away//@name').text
    away_id = game.xpath('away//@id').text
    teams_code["#{away_name}"] = "#{away_id}"
    teams << teams_code
  end
 @team_code = teams_code["#{team_name}"]
# USE CODE TO FIND TEAM'S ROSTER
  url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=d5wwmmjjqu9bqa4x7zdwqvg5")
  team_url = Nokogiri::HTML(open(url))
    coach = team_url.xpath('//coaches/coach/@full_name').first.value
    players_full_name = team_url.xpath('//players//@full_name')
    all_players = players_full_name.each do |player|
       player
    end
    return coach
end

def team_players(team_name)
  # FIND THE TEAM'S CODE
  season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=d5wwmmjjqu9bqa4x7zdwqvg5'))
  games = season_schedule_url.xpath('//game')
  teams = []
  teams_code = Hash.new
  games.each do |game|
    away_team = game.xpath('away//@name') + game.xpath('away//@id')
    home_team = game.xpath('home//@name') + game.xpath('home//@id')
    away_name = game.xpath('away//@name').text
    away_id = game.xpath('away//@id').text
    teams_code["#{away_name}"] = "#{away_id}"
    teams << teams_code
  end
 @team_code = teams_code["#{team_name}"]
# USE CODE TO FIND TEAM'S ROSTER
  url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=d5wwmmjjqu9bqa4x7zdwqvg5")
  team_url = Nokogiri::HTML(open(url))
    coach = team_url.xpath('//coaches/coach/@full_name').first.value
    players_full_name = team_url.xpath('//players//@full_name')
    player_array = []
    players_full_name.each do |player|
       player_array << player
    end
    return player_array
end

def wait
  return sleep 1.5
end


def nba_refs
  url = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_National_Basketball_Association_referees'))
  li = url.xpath('//li')
  refs = []
  li.each do |list|
    li_text = list.text
    if li_text[0..2] == "No."
      refs << li_text
    end
  end
return refs
end

#CREATING ALL REFS

nba_refs.each do |ref|
  r = Ref.new
  r.number_name = ref
  r.save
  wait
end


#CREATING TEAMS + COACH
teams = ['Atlanta Hawks', 'Brooklyn Nets', 'Boston Celtics', 'Charlotte Bobcats', 'Chicago Bulls', 'Cleveland Cavaliers', 'Dallas Mavericks', 'Denver Nuggets', 'Detroit Pistons', 'Golden State Warriors', 'Houston Rockets', 'Indiana Pacers', 'Los Angeles Clippers', 'Los Angeles Lakers', 'Memphis Grizzlies', 'Miami Heat', 'Milwaukee Bucks', 'Minnesota Timberwolves', 'New Orleans Pelicans', 'New York Knicks', 'Oklahoma City Thunder', 'Orlando Magic', 'Philadelphia 76ers', 'Phoenix Suns', 'Portland Trail Blazers', 'Sacramento Kings', 'San Antonio Spurs', 'Toronto Raptors', 'Utah Jazz', 'Washington Wizards']
wait
teams.each do |name|
    t = Team.new
    t.name = name
    t.coach = team_coach(t.name)
    wait
    t.save
    wait
end

#CREATING PLAYER6S FOR EACH TEAM
wait
teams.each do |team|
  team_players(team).each do |player|
    player = player.to_s
    p = Player.new
    p.name = player
    p.team_id = 1
    if p.save
      p.team_id += 1
    end
    wait
  end
end


