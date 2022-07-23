
library(baseballr)
library(dplyr)



mlbteams <- mlb_teams(season = 2022)
mlbteams <- mlbteams %>% filter(sport_name == 'Major League Baseball')


affiliates <- mlb_team_affiliates(team_ids = c(mlbteams$team_id), season = 2022)


allschedule <- mlb_schedule(2022, level_ids = c(11, 13, 14))

schedule <- left_join(x = allschedule, y = affiliates, by = c("teams_home_team_name" = "team_full_name"))


schedule$team <- schedule$teams_home_team_name
schedule$org <- schedule$parent_org_name
schedule$level <- schedule$sport_name
schedule$stadium <- schedule$venue_name.x


schedule <- schedule %>% select(resumed_from_date, date, org, level, team, stadium, game_pk)


schedule <- schedule %>% filter(team %in% c(#Client names)


write.csv(schedule, "Hawkeye Sharing Network Schedule.csv")
