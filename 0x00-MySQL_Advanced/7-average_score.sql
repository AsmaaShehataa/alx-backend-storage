-- SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score

drop procedure IF EXISTS ComputeAverageScoreForUser
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN userId INT)
BEGIN
  DECLARE average_score DECIMAL(5,2);
  SELECT AVG(score) INTO average_score FROM corrections WHERE user_id = userId;
  INSERT INTO average_scores (user_id, average_score) VALUES (userId, average_score);
END$$
DELIMITER ;
