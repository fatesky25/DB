create user orauser01 identified by user01;
show user;

-- ���� �ο�
GRANT CREATE SESSION, create table TO orauser01;
-- ��ɾ� ��ü ���� �ο�
GRANT connect, RESOURCE to orauser01;
-- ���� �����Ͽ� ���� �ο�
GRANT create session to orauser01;
-- ��ɾ �����Ͽ� ���� ȸ��
REVOKE create session from orauser01;
-- ��ɾ� ��ü ���� ȸ��
REVOKE RESOURCE from orauser01;