-- Session #1
-- postgres=# BEGIN;
-- BEGIN
-- postgres=*# UPDATE pizzeria SET rating = 0 WHERE id = 1;
-- UPDATE 1
-- postgres=*# UPDATE pizzeria SET rating = 0 WHERE id = 2;
-- UPDATE 1
-- postgres=*# COMMIT;
-- COMMIT
-- postgres=#
-- ---------------------------------------------------------------------------------------
-- Session #2
-- postgres=# BEGIN;
-- BEGIN
-- postgres=*# UPDATE pizzeria SET rating = 5 WHERE id = 2;
-- UPDATE 1
-- postgres=*# UPDATE pizzeria SET rating = 5 WHERE id = 1;
-- ERROR:  deadlock detected
-- DETAIL:  Process 42984 waits for ShareLock on transaction 1187; blocked by process 42923.
-- Process 42923 waits for ShareLock on transaction 1188; blocked by process 42984.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,16) in relation "pizzeria"
-- postgres=!# COMMIT;
-- ROLLBACK
-- postgres=#
