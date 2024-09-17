ALTER TABLE users
ADD COLUMN isadmin INT CHECK (isadmin IN(0, 1))