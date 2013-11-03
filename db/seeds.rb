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


# def team_coach(team_name)
#   # FIND THE TEAM'S CODE
#   season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=x4n9p2at386n9x9g3trzu3kw'))
#   puts
#   games = season_schedule_url.xpath('//game')
#   teams = []
#   teams_code = Hash.new
#   games.each do |game|
#     away_team = game.xpath('away//@name') + game.xpath('away//@id')
#     home_team = game.xpath('home//@name') + game.xpath('home//@id')
#     away_name = game.xpath('away//@name').text
#     away_id = game.xpath('away//@id').text
#     teams_code["#{away_name}"] = "#{away_id}"
#     teams << teams_code
#   end
#  @team_code = teams_code["#{team_name}"]
# # USE CODE TO FIND TEAM'S ROSTER
#   url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=x4n9p2at386n9x9g3trzu3kw")
#   team_url = Nokogiri::HTML(open(url))
#     coach = team_url.xpath('//coaches/coach/@full_name').first.value
#     players_full_name = team_url.xpath('//players//@full_name')
#     all_players = players_full_name.each do |player|
#        player
#     end
#     return coach
# end

def team_players(team_name)
  # FIND THE TEAM'S CODE
  season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=x4n9p2at386n9x9g3trzu3kw'))
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
  url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=x4n9p2at386n9x9g3trzu3kw")
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



# nba_refs.each do |ref|
#   r = Ref.new
#   r.number_name = ref
#   r.save
# end

  # teams = ['Atlanta Hawks1', 'Brooklyn Nets2', 'Boston Celtics3', 'Charlotte Bobcats4', 'Chicago Bulls5', 'Cleveland Cavaliers6', 'Dallas Mavericks7', 'Denver Nuggets8', 'Detroit Pistons9', 'Golden State Warriors10', 'Houston Rockets11', 'Indiana Pacers12', 'Los Angeles Clippers13', 'Los Angeles Lakers14', 'Memphis Grizzlies15', 'Miami Heat16', 'Milwaukee Bucks17', 'Minnesota Timberwolves18', 'New Orleans Pelicans19', 'New York Knicks20', 'Oklahoma City Thunder21', 'Orlando Magic22', 'Philadelphia 76ers23', 'Phoenix Suns24', 'Portland Trail Blazers25', 'Sacramento Kings26', 'San Antonio Spurs27', 'Toronto Raptors28', 'Utah Jazz29', 'Washington Wizards30']

  team_players('Washington Wizards').each do |player|
    player = player.to_s
    p = Player.new
    p.name = player
    p.team_id = 30
    p.save
  end

  # teams.each do |name|
  #   t = Team.new
  #   t.name = name
  #   t.coach = team_coach(t.name)
  #   wait
  #   t.save
  # end
