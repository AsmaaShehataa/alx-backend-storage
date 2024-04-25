-- SQL script that creates an index idx_name_first_score

CREATE INDEX idx_name_first ON names (name(1))
