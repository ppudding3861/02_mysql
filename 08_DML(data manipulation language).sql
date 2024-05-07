/* DML(data manipulation language)*/

-- INSERT, UPDATE, DELETE,SELECT(DQL)
-- : 데이터 조작언어,테이블에 값을 삽입하거나, 수정하거나
-- 삭제하거나, 조회하는 언어
-- INSERT
-- 새로운 행을 추가하는 구문이다.
-- 테이블 행의 수가 증가한다.
INSERT INTO tbl_menu VALUES(NULL,'바나나해장국', 8500,4,'Y');

INSERT INTO tbl_menu 
	(
		menu_name ,menu_price ,category_code , orderable_status 
	) VALUES(
		'초콜릿죽', 6000, 7, 'Y'
	);

-- 등록하는 컬럼의 순서는 상관없다.
-- 단 컬럼의 순서에 맞는 값을 매칭해야한다.
INSERT INTO tbl_menu 
	(
		menu_name , orderable_status , category_code , menu_price 
	) VALUES(
		'빽사이즈 아메리카노','Y',  7, 3000 
	);
SELECT * FROM tbl_menu tm ;

-- multi insert
INSERT INTO tbl_menu 
	VALUES(NULL,'해장국', 8500,4,'Y'),
		  (NULL,'뼈다귀 해장국', 8500,4,'Y'),
	      (NULL,'왕뚝배기 해장국', 8500,4,'Y');
	    
SELECT * FROM tbl_menu;
	    
-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.
SELECT
	menu_code,
	category_code
  FROM tbl_menu
 WHERE menu_name = "바나나해장국";


UPDATE  tbl_menu 
  SET menu_name  = "바나나 탕후루"
 WHERE menu_code = 22;

-- 가상의 view를 형성해서 조회
-- mysql은 oracle과 달리 
UPDATE  tbl_menu 
  SET category_code  = "6"
 WHERE menu_code = (SELECT 
 						menu_code 
 					   FROM (
 					   	SELECT
 					   		menu_code
						  FROM tbl_menu 					   		
 					  WHERE  menu_name = "바나나 탕후루"
 					 ); AS tmp
 					 );


SELECT  * FROM tbl_menu;


-- DELETE
DELETE FROM tbl_menu 
 ORDER BY menu_price DESC
 LIMIT 2;

SELECT  * FROM tbl_menu ORDER BY menu_price DESC
LIMIT 2;

DELETE  FROM  tbl_menu 
WHERE menu_price = 8500;


-- REPLACE
-- INSERT 시 primary key 또는 unique key가 충돌이 발생할 수 있다면
-- replace를 통해 중복된 데이터를 덮어 쓸 수 있다.
REPLACE INTO tbl_menu VALUES (12, '참기름라떼', 5000, 10, 'Y');
INSERT INTO tbl_menu VALUES (12, '참기름라떼', 5000, 10, 'Y');
SELECT * FROM tbl_menu;


-- 