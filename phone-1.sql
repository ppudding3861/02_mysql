
-- ------------------- 회원 정보 ----------------------------

-- IF NOT EXISTS : 서브쿼리에 데이터가 존재하지 않을 경우 데이터를 조회한다.

-- AUTO INCREMENT : 자동으로 숫자를 입력해준다. 숫자의 시작은 1~N

-- COMMENT : 테이블 또는 컬럼의 뜻을 조회하는 "주석"의 기능이다.

-- NOT NULL : NULL의 값이 들어오면 안된다는 뜻이다.

-- CONSTRAINT : 제한된 조건을 만족해햐지만 삽입/수정하여 무결성을 지키는 것.

-- CONSTRAINT EX) : PK_USER_CODE PK조건에 만족하는가?

-- PRIMARY KEY : 테이블에서 유일하게 식별하기 위해 사용되는 필드

-- ENGINE=INNODB : 데이터 베이스 엔진에 한 종류 대용량 데이터를 처리할 때 쓰임

CREATE TABLE IF NOT EXISTS user_info
-- USER_INFO 테이블을 만들어서 서브쿼리에 데이터가 존재하지 않을 경우 데이터를 조회한다.
(
    user_code    INT AUTO_INCREMENT COMMENT '회원 코드',
	-- USER_CODE 컬럼을 만든다.

    user_name    VARCHAR(255) NOT NULL COMMENT '회원 이름',
    -- USER_NAME 컬럼을 만든다.
    
    user_email   VARCHAR(255) COMMENT '이메일',
    -- USER_EMAIL 컬럼을 만든다.
    
    user_memo	 VARCHAR(255) COMMENT '메모' ,
    -- USER_MEMO 컬럼을 만든다.
    
    user_group   VARCHAR(255) COMMENT '그룹'
    -- USER_GROUP 컬럼을 만든다.
    CONSTRAINT pk_user_code PRIMARY KEY (user_code)
    -- user_info 테이블에서 user_code 열을 주 키로 설정하여 각 회원을 고유하게 식별한다.

    ) ENGINE=INNODB COMMENT '회원 정보';
    -- USER_INFO테이블을 INNODB로 생성 후 테이블에 대한 주석을 회원 정보로 설정 

-- ---------------------전화번호 코드 ------------------
CREATE TABLE IF NOT EXISTS phone_info
-- PHONE_INFO 테이블을 만들어서 서브쿼리에 데이터가 존재하지 않을 경우 데이터를 조회

(
    phone_code    INT auto_increment PRIMARY KEY COMMENT '전화번호 코드',
    -- PHONE_CODE 컬럼을 만든다.

    user_code     INT NOT NULL COMMENT '회원 코드',
    -- USER_CODE 컬럼을 만든다.
    
    phone        VARCHAR(255) NOT NULL COMMENT '전화번호',
    -- PHONE 컬럼을 만든다.
    
    phone_name	 VARCHAR(255) NOT NULL COMMENT '전화번호 이름',
    -- PHONE_NAME 컬럼을 만든다.
   
    CONSTRAINT fk_user_code FOREIGN KEY (user_code) REFERENCES user_info (user_code)
   -- USER_INFO 테이블에 기본키를 참조하여 외래키 USER_CODE를 추가한다.
  

    )ENGINE=INNODB COMMENT '전화번호 코드';
    -- 데이터베이스의 엔진을 INNODB로 만들어 테이블에 대한 주석을 전화번호 코드로 설정 

select * from user_info;

-- DESCRIBE phone_info;
