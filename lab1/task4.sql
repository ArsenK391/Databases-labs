UPDATE users
SET isadmin_temp = CASE
    WHEN isadmin = 1 THEN true
    ELSE false
END

ALTER TABLE users DROP COLUMN isadmin

ALTER TABLE users RENAME COLUMN isadmin_temp TO isadmin