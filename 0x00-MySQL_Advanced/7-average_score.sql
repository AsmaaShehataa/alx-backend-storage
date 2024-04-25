-- SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score

drop procedure IF EXISTS ComputeAverageScoreForUser
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN userId INT)
BEGIN
  UPDATE users
  SET average_score = (
    SELECT AVG(score)
    FROM corrections
    WHERE corrections.userId = userId
  )
  WHERE id = userId;
END$$
DELIMITER ;
