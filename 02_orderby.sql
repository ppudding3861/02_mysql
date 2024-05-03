select 
   menu_code,
   menu_name,
   menu_price
  from tbl_menu
  
-- order by menu_price asc; -- ASC : 오름 차순 정렬 ,DESC : 내림차순 정렬
ORDER BY menu_price desc;

SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu
order by
	menu_price DESC,
	menu_name asc;
	

-- 메뉴의 코드,이름,메뉴 코드 곱하기 가격을 조회한다.
-- 정렬의 기준은 코드의 오름 차순으로 정렬해주세요.

SELECT 
	menu_code,
	menu_name,
	menu_code * menu_price
  FROM tbl_menu
 Order by menu_code asc;


-- 
SELECT 
	FIELD('C','A','B','C');
SELECT 
	FIELD(orderable_status,'N','Y')
 FROM tbl_menu;


SELECT 
	*
  FROM tbl_menu
ORDER BY FIELD(orderable_status,'N','Y'); 


SELECT 
	category_code,
	category_name ,
	ref_category_code
	FROM tbl_category
 order by ref_category_code IS NULL desc;






