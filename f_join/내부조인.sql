### 조인(join) ###

# join: 결합하다
# : 두 개 이상의 테이블을 서로 연결하여 데이터를 조회하는 기능 
# >> 여러 테이블에서 필요한 데이터를 얻기 위해 테이블을 묶어 출력

# 조인의 종류
# : 내부 조인(inner join), 외부 조인(outer join)
#	, 자기 조인(self join), 상호 조인(accros join)

### 1. 내부 조인 ###
# 두 테이블의 공통된 값을 기준으로 데이터를 결합하는 조인 방식
# : 테이블 간에 일치하는 행만 결과에 반환
# - 일치하지 않을 경우 출력되지 X

/*
	select
		테이블1.컬럼, 테이블2.컬럼 ...
	from
		테이블1(기준)
			(inner) join 테이블2(연결)
            on 테이블1.공통컬럼 = 테이블2.공통컬럼;
            
	# on 키워드: 두 테이블 간의 공통된 열을 기준으로 데이터를 결합하는 기준
*/

# cf) inner join의 경우 축약형으로 join 키워드만 사용 가능

create database if not exists `join`;
-- SQL의 예약어를 DB명 또는 table명으로 쓰는 경우 반드시 ``(백틱)으로 감싸야 한다
use `join`;

create table `member` (
	member_id int primary key,
    member_name varchar(50),
    member_age int
);

create table purchase (
	purchase_id int primary key,
    member_id int,
    item_name varchar(100),
    item_price int,
    foreign key(member_id) references `member`(member_id)
);


insert into `member`
values 
	(1, '홍동현', 28),
	(2, '홍길동', 30),
	(3, '유이진', 34);
    
insert into `purchase`
values
	(1, 1, '노트북', 200),
	(2, 2, '스마트폰', 130),
	(3, 1, '태블릿', 150),
	(4, 3, '이어폰', 30);
    
select * from purchase;


### 내부 조인 예제 ### 
# : 회원과 그들이 구매한 상품 정보를 함께 조회 
# > 구매 내역이 없는 회원의 정보는 출력하지 X
# > 기준이 되는 테이블의 모든 정보를 출력할 수 X 

select A.member_name, B.item_name, B.item_price
from `member` as A
	join purchase as B
    on A.member_id = B.member_id;
    
# 조건을 추가한 내부 조인
# item_price가 150 이상인 상품을 구매한 회원 정보를 조회
select
	A.member_name, B.item_name, B.item_price
from
	`member` as A
		inner join purchase as B
        on A.member_id = B.member_id
where
	B.item_price >= 150;
    
### 특정 나이대의 회원이 구매한 상품 개수와 총 구매 금액 조회 ###
select
	M.member_name,	-- 회원 이름
    count(P.purchase_id) as item_count,	-- 회원이 구매한 상품 개수
    sum(P.item_price) as total_price	-- 회원이 구매한 상품의 총 금액
from
	member M
		inner join purchase P
        on M.member_id = P.member_id	-- member_id를 기준으로 두 테이블 조인
where
	M.member_age between 25 and 30	-- 특정 나이대 설정
group by
	M.member_name	-- 회원별로 그룹화
having
	count(P.purchase_id) >= 2 
    and sum(P.item_price) >= 300;