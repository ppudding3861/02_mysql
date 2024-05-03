-- join
-- 두 테이블을 연결할 때 사용하는 키워드이다.

-- 문제 메뉴의 카테고리를 알 수 없다.
SELECT
	menu_code,
	menu_name,
	category_code ,
	menu_price
  FROM tbl_menu 
 ORDER BY menu_price DESC;

SELECT
	*
  FROM tbl_category;
  
 -- inner join을 이용한다면
 
 SELECT
	m.menu_code,
	m.menu_name,
	m.category_code ,
	c.category_name,
	m.menu_price
  FROM tbl_menu AS m 
  JOIN tbl_category c ON (m.category_code = c.category_code);
 
 
 
 
 SELECT
	a.category_name,
	b.menu_name
  FROM tbl_category a
  LEFT JOIN tbl_menu b ON a.category_code  = b.category_code ;
  
 
 
 SELECT
	a.category_name,
	b.menu_name
  FROM tbl_menu b 
  LEFT JOIN tbl_category a ON a.category_code  = b.category_code ;
  
 
 -- RIGHT JOIN
 SELECT
 	a.menu_name,
 	b.category_name
 	FROM tbl_menu a
 	RIGHT JOIN tbl_category b ON a.category_code  = b.category_code ;
 
 
 -- cross join
 SELECT
	a.menu_name,
	b.category_name
	FROM tbl_menu a
	cross join tbl_category b;


SELECT 
	a.category_name,
	b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON a.ref_category_code = b.category_code ;
 
 /* JOIN 알고리즘 */
/* NESTED LOOP JOIN */
-- MySQL은 기본적으로 NESTED LOOP JOIN을 사용한다.

-- 두 개 이상의 테이블에서 하나의 집합을 기준으로 순차적으로 상대방 Row를 결합하여 조합하는 방식

-- 중첩 반복문처럼 첫번 째 테이블의 Row와 관련된 두번째 테이블에 대한 Row를 검색하고 이후 첫 번째
-- 테이블의 다음 Row에 대해 두번쨰 테이블에 대한 것을 검색하며 이후 이와 같은 방식을 반복한다.

-- MySQL은 기본적으로 NESTED LOOP JOIN을 사용하지만 이를 강제하려면 힌트절을 작성해 HASH JOIN을
-- 사용하지 않도록 강제할 수 있다.
 
 
SELECT 
	a.menu_name,
	b.category_code
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code ;
 
 
 