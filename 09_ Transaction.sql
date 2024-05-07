/* Transaction */
-- mysql은 기본적으로 commit이 자동으로 되므로 수동으로 조절하고 싶다면 autocommit 설정을 변경해야한다.
-- auto commit 활성화 
SET autocommit = 1;
-- 또는
SET autocommit = on ;


-- autocommit 비활성화 
SET autocommit = 0;
-- 또는
SET autocommit = OFF;


-- 트랜젝션의 시작을 알
START TRANSACTION;
SELECT * FROM tbl_menu;


INSERT INTO tbl_menu VALUES (null, '바나나해장국', 8500, 4, 'Y');
UPDATE tbl_menu SET menu_name = '수정된 메뉴' WHERE menu_code = 5;
DELETE FROM tbl_menu WHERE menu_code = 7;

ROLLBACK;










