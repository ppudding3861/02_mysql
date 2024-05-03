-- TEST 1

SELECT 
	tc.category_name,
	tm.menu_name,
	tm.menu_price
  FROM tbl_category tc 
  join tbl_menu tm 
  ON tc.category_code  = tm.category_code 
  ORDER BY tc.category_name ASC ,
           tm.menu_name ASC ;
           
          
-- TEST 2
          
SELECT 
	tc.category_name,
	SUM(tm.menu_price) AS sum
  FROM tbl_category tc
  JOIN tbl_menu tm 
  ON tc.category_code = tm.category_code  
  GROUP BY tc.category_name
  
  
-- TEST 3
  
SELECT 
	tc.category_name,
	SUM(tm.menu_price) AS sum
  FROM tbl_category tc
  JOIN tbl_menu tm 
  ON tc.category_code = tm.category_code  
  GROUP BY tc.category_name
  HAVING sum > 10000;
  
 
 
 
 -- 서현님 문제
 
 /*
  * GROUP BY - 카테고리 네임별로 총 메뉴의 평균값을 구하시오.

JOIN-카테고리네임 중 '커피' 로 분류된 메뉴의 이름과 가격을 출력하시오.
) category_name, menu_name, price 가 출력되어야 함

HAVING- 가격이 12000원 이하인 음식들의 이름과 가격을 내림차순으로 출력하시오.
) menu_name, menu_price가 내림차순 출력되어야 함
  * 
  */*/
  
  
  
  -- GROUP BY
  SELECT
	tc.category_name,
	avg(tm.menu_price)	
  FROM tbl_category tc
  JOIN tbl_menu tm 
  ON tc.category_code = tm.category_code
  GROUP BY tc.category_name;
  
  -- join
  
  SELECT
	tc.category_name,
	tm.menu_name,
	tm.menu_price
	FROM tbl_category tc
    JOIN tbl_menu tm 
    ON tc.category_code  = tm.category_code
    WHERE tc.category_name = '커피';
    
-- HAVING
   
   SELECT
	menu_name,
	menu_price
   FROM tbl_menu
	HAVING menu_price < 12000  
	ORDER BY menu_price DESC; 
	

/*                                  화연
 * 1. join
메뉴 테이블의 
메뉴 이름과 카테고리 이름을 left join 하고
메뉴 테이블의 메뉴 가격을 오름차순으로 정렬하여
출력하라.
출력 순서는 메뉴이름, 메뉴가격, 카테고리이름 순서이다.
*/

SELECT 
	tm.menu_name,
	tm.menu_price,
	tc.category_name
FROM tbl_menu tm 
LEFT JOIN tbl_category tc
ON tm.category_code = tc.category_code
ORDER BY tm.menu_price ASC  


/*
2. group by
메뉴 이름과 카테고리코드를 그룹으로 묶고
메뉴 가격의 최댓값을 구한뒤 5개만 나오게 한다.
메뉴 이름을 내림차순으로 나오게하라.
*/

SELECT 
menu_name ,
MAX(menu_price)
FROM tbl_menu tm 
group by menu_name, category_code 
ORDER BY menu_name DESC 
LIMIT 5;



/*
3. having
메뉴 이름과 주문상태(orderable status)를 그룹으로
묶고 메뉴이름과 주문상태가 Y인 것만 나오게 하라.
 */
 
 SELECT 
 	menu_name,
 	orderable_status
   FROM tbl_menu tm
   GROUP BY menu_name , orderable_status 
   HAVING  orderable_status = 'Y'
   
   
   
   /*                                      승
    * -- 카테고리 코드와 메뉴 가격에 대한 합 카테고리 코드로 묶어주세요.
    */
   
SELECT
	category_code, 
	SUM(menu_price)
FROM tbl_menu
GROUP BY category_code , menu_price ;

	
   
    /* 
 -- JOIN 문제 : 메뉴 코드 와 카테고리 코드 를 연결시켜 출력
 */
   

SELECT
	*
FROM tbl_menu tm
JOIN tbl_category tc 
ON tm.category_code = tc.category_code ;


/*
-- HAVING 문제 : 카테고리 코드와 메뉴 가격의 평균을 가져와 카테고리 코드에 4~6까지 출력
   */

SELECT 
	category_code ,
	avg(menu_price) 
FROM tbl_menu tm 
GROUP BY category_code 
HAVING category_code BETWEEN 4 AND 6;




/*                                   진희
 * 카테고리중 한식 가격의 총합을 내주세요. 
 */
SELECT 
	tc.category_name,
	SUM(tm.menu_price) as '총합'
FROM tbl_category tc 
JOIN tbl_menu tm 
ON tc.category_code = tm.category_code
WHERE category_name = '한식';



/*
메뉴중 가격이 같은 메뉴로 묶어주세요. 
*/

SELECT 
	menu_name,
	menu_price 
FROM tbl_menu tm
GROUP BY menu_price , menu_name
ORDER BY menu_price ASC;


/*
메뉴들 중 가격이 10000~15000사이인 메뉴들의 평균을 구해주세요. 
*/

SELECT 
	avg(menu_price) 
FROM tbl_menu tm 
WHERE menu_price BETWEEN 10000 AND 15000;


/*                         --      은석 
 * -- join(right) 을 이용하여 메뉴 이름 및 코드를 출력하시오 
 */ 

SELECT
	tm.menu_name,
	tc.category_code
  FROM tbl_category tc 
  JOIN tbl_menu tm 
  ON tc.category_code = tm.category_code; 



/* 
-- group by를 이용하여 카데고리 코드 및 메뉴 코드를 출력하시오
*/

SELECT 
	category_code,
	menu_code
  FROM tbl_menu tm 
  group by category_code , menu_code; 


/*
-- having을 이용하여 메뉴 이름 및 카운트를 하세요
 */ 

 SELECT 
 	menu_name,
 	count(menu_name) as cnt
   FROM tbl_menu tm
   group by menu_name
   having count(menu_name);


