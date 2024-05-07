/* 서브쿼리 */

SELECT 
   category_code
  FROM tbl_menu
 WHERE menu_name = '우럭스무디'; 
 

SELECT 
   menu_code,
   menu_name,
   menu_price,
   category_code,
   orderable_status
  FROM tbl_menu
 WHERE category_code in (SELECT 
                     category_code 
                    FROM tbl_menu);
                   WHERE menu_name = "홍어마카롱");
 
    -- FROM 절에 쓰인 서브 쿼              
SELECT 
max(COUNT)
  FROM (
  	SELECT
  		count(*) AS 'count'
  	  FROM tbl_menu
  	 GROUP BY category_code
  	) AS countmenu;
  	
  -- 카테고리별 평균 가격보다 높은 가격의 메뉴 조회
  SELECT
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu a
  WHERE menu_price > (SELECT 
  						avg(menu_price) 
  						FROM tbl_menu 
  						WHERE category_code = a.category_code);
  
/* EXISTS */
-- 조회 결과가 있을 때 true 아니면 false
SELECT 
	category_name
  FROM tbl_category a
 WHERE EXISTS (
 		SELECT 
 			1
 		FROM tbl_menu b
 		WHERE b.category_code = a.category_code);
 	

/* SET OPERATORS */
 
/* UNION */
SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = 10
UNION
SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000;

/* UNION ALL */
SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = 10
UNION ALL
SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000;
 
/* INTERSECT */
-- MySQL은 INTERSECT를 제공하지 않는다. 하지만 INNER JOIN 또는 IN을 활용해서 구현하는 것은 가능하다.

-- 1) INNER JOIN 활용
SELECT 
    a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
FROM
    tbl_menu a
INNER JOIN (SELECT 
      menu_code,
      menu_name,
      menu_price,
      category_code,
      orderable_status
   FROM
      tbl_menu 
   WHERE
      menu_price < 9000) b on (a.menu_code = b.menu_code)
WHERE
    a.category_code = 10;
    
-- 2) IN 연산자 활용
SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = 10 AND
    menu_code IN (SELECT 
      menu_code
   FROM
      tbl_menu 
   WHERE
      menu_price < 9000);

/* MINUS */
-- MySQL은 MINUS를 제공하지 않는다. 하지만 LEFT JOIN을 활용해서 구현하는 것은 가능하다.
SELECT 
    a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
FROM
    tbl_menu a
LEFT JOIN (SELECT 
      menu_code,
      menu_name,
      menu_price,
      category_code,
      orderable_status
   FROM
      tbl_menu 
   WHERE
      menu_price < 9000) b on (a.menu_code = b.menu_code)
WHERE
    a.category_code = 10 AND
    b.menu_code IS NULL; 		
 	
 	