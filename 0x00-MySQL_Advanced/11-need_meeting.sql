-- SQL script that creates a view need_meeting

DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
    SELECT name
    FROM students
    WHERE average_score < 80
        AND (last_meeting IS NULL OR last_meeting < ADDDATE(CURRENT_DATE(), INTERVAL -1 MONTH));
