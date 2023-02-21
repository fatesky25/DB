create user orauser01 identified by user01;
show user;

-- 권한 부여
GRANT CREATE SESSION, create table TO orauser01;
-- 명령어 전체 권한 부여
GRANT connect, RESOURCE to orauser01;
-- 명렁어 지정하여 권한 부여
GRANT create session to orauser01;
-- 명령어를 지정하여 권한 회수
REVOKE create session from orauser01;
-- 명령어 전체 권한 회수
REVOKE RESOURCE from orauser01;