SELECT
	ID,
	Name AS 'Competitor Name',
	Sex,
	Age,
	CASE WHEN Age < 18 THEN 'Under 18'
		 WHEN Age BETWEEN 18 AND 25 THEN '18-25'
		 WHEN Age BETWEEN 25 AND 30 THEN '25-30'
		 WHEN Age > 30 THEN 'Over 30' -- Age grouping --
	END AS 'Age Grouping',
	Height,
	Weight,
	NOC AS 'Nation Code',
	LEFT(Games, CHARINDEX(' ', Games) - 1) AS Year,  -- Split column to isolate year -- 
	Sport,
	Event,
	CASE WHEN Medal = 'NA' THEN 'Not Registered'
		 ELSE Medal
	END AS Medal -- Replace NA with Not Registered --
FROM olympic_games.dbo.athletes_event_results
WHERE Games LIKE '%summer' -- Where clause to isolate Summer Season --