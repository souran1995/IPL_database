
/* Top 3 run maker player*/
select distinct player.player_name as player_Name, score.runs as run
	from 
		indivisual_score score
		inner join player player
			on player.player_id = score.player_id
order by
	run desc
Limit 3


/* Top 3 wicket taker bowler*/
select distinct player.player_name as player_Name, score.wickets as wickets
	from 
		indivisual_score score
		inner join player player
			on player.player_id = score.player_id
order by
	wickets desc
Limit 3


/* who have grabbed the most catches*/
select distinct player.player_name as player_Name, score.catches as catches
	from 
		indivisual_score score
		inner join player player
			on player.player_id = score.player_id
order by
	catches desc
Limit 3



/* Total wins by teams*/
select team.team_name, count(matches.match_winner_id) as "Total wins"
	from team, matches
	where team.team_id = matches.match_winner_id
	group by team.team_name
	order by count(matches.match_winner_id) desc



/*Check total players by team */
select team.team_name, count(player.team_id) as "Total Players" 
	from team , player
	where team.team_id = player.team_ids
	group by team.team_name
	


/* Batting coach by teams*/
select team.team_name, sup.name as "Batting Coach" from support_staff as sup
	
	inner join team
	on team.team_id = sup.team_id
	where roll_id = 5;
	
	
/*nested queary total players by team and overall players */

select team.team_name, count(player.team_id) as "Players in a team", 
	(
	select count(player_name) from player
	) as Total_Players
	
	from team , player
	where team.team_id = player.team_id
	group by team.team_name;


/* Function for get count players top runner*/ 

create function get_players_count(len_from int)
returns int
language plpgsql
as
$$
declare
   players_count integer;
begin
   select count(*) 
   into players_count
   from indivisual_score
   where runs >= len_from;
   return players_count;
end;
$$;



/* Function for get count players top wicket taker*/ 
create function get_top_wicket_taker(len_from int)
returns int
language plpgsql
as
$$
declare
   players_count integer;
begin
   select count(*) 
   into players_count
   from indivisual_score
   where wickets >= len_from;
   return players_count;
end;
$$;




/*function return table get top runner player*/

create or replace function get_top_runner_player (
  p_pattern int
) 
	returns table (
		players_name varchar,
		players_runs int
	) 
	language plpgsql
as $$
begin
	return query 
		select player_name, runs
		from indivisual_score
		inner join player
		on player.player_id = indivisual_score.player_id
		where runs >= p_pattern;
end;$$


/* recursive query to find player based on team ID*/

WITH RECURSIVE subordinates AS (
	SELECT
		player_id,
		team_id,
		player_name
	FROM
		player
	WHERE
		team_id = 8
	UNION
		SELECT
			e.player_id,
			e.team_id,
			e.player_name
		FROM
			player e
		INNER JOIN subordinates s ON s.player_id = e.team_id
) SELECT
	*
FROM
	subordinates;