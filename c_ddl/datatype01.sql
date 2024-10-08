# -- datatype --
### SQL의 데이터 형식 ###

# 정수형, 문자형, 실수형, 논리형, 날짜형 
/*
	1. 정수형
    : 숫자 데이터를 저장하는 데 사용 
    >> 데이터 타입에 따라 메모리 사용 공간이 다름 
    
    a) tinyint
		: 1byte(8bit)
        : -128 ~ 127
        EX) 나이, 성별코드 
        
	b) smallint
		: 2byte(16bit)
        : -32,768 ~ 32,767
        EX) 사원번호, 우편번호 
        
	c) int
		: 4byte(32bit)
        : 약 -21억 ~ 약 21억
        EX) 일반적인 용도로 가장 많이 사용되는 정수형 타입 
        EX) 고객 ID, 주문 번호 등
        
	d) bigint
		: 8byte(64bit)
        : 약 -900경 ~ 약 900경
        EX) 금융권, 천문학 등에서 주로 사용
*/

create database if not exists `example`;
use `example`;

create table `integer` (
	t_col tinyint,
    s_col smallint,
    i_col int,
    b_col bigint
);

# insert 키워드: 데이터 삽입 
# Out of range 오류: 해당 데이터 타입의 범위를 벗어나는 경우 발생 
insert into `integer` 
values(127, 32767, 2000000000, 9000000000000000000);

# unsigned: 부호가 없는 정수 
# > 정수의 시작을 0부터 시작 
# > 범위는 그대로 인식 (EX. tinyint 0 ~ 255까지)
# EX) 키, 나이, 가격 등을 설정할 때 사용 (음수값이 없는 경우)

create table person (
	age tinyint unsigned, -- 나이 (0 ~ 255 범위)
    height smallint unsigned -- 키 (0 ~ 65535 범위)
);

insert into person
values(130, 250);

/*
	2. 문자형
    : 텍스트 데이터 저장
    : char(개수), varchar(개수)
    
    a) char(개수): 1 ~ 255byte
    : 고정 길이 문자형 
    EX) char(10)의 10자리 중 3자리만 사용하는 경우, 나머지 7자리가 비워진 상태로 메모리 낭비
    >> 길이가 항상 일정하기 때문에 검색 속도가 빠름 
    >> 짧은 문자열 저장에 사용 
    EX) 성별, 국가코드(KR, CN, JP)
    
    b) varchar(개수): 1 ~ 1638byte
    : 가변 길이 문자형
    EX) varchar(10)의 10자리 중 3자리만 사용하는 경우, 나머지 7자리는 사라짐
    >> 길이가 일정하지 않아 검색 속도가 느림
    >> 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    EX) 주소, 상품명 등 
    
    cf) 문자 수와 바이트 수의 차이 
    # 영어: 1byte에 1개의 알파벳 
    # 한글: UTF-8 기준 한 글자 당 약 3byte를 사용 
    >> varchar(255): 255 / 3 = 약 85글자
    
    cf) 다량의 텍스트 데이터 형식
    a) text 형식: 1 ~ 약 65000byte
		longtext 형식: 1 ~ 42억byte
    
    c) blob (binary long object): 이미지, 동영상 등의 데이터
		blob 형식: 1 ~ 약 65000byte
        longblob 형식: 1 ~ 42억byte

*/

create table `character`(
	name varchar(100),	-- 제품명(가변길이)
    category char(10),	-- 카테고리(고정길이)
    description text,	-- 제품설명(대용량 텍스트)
    image blob
);

insert into `character`
values('Laptop', 'Electric', '삼성 갤럭시 북4 노트북 프로', 'example.com');

/*
	3. 실수형 
    : 소수점이 있는 숫자를 저장할 때 사용 
    > float, double, decimal
    > float과 double은 부동 소수점 방식 
    > decimal은 고정 소수점 방식
    
    a) float
    : 소수점 아래 7자리까지 표현 
    >> 시력, 가격 등 
    
    b) double
    : 소수점 아래 15자리까지 표현 
    >> 구체적인 값을 표현할 수 있음 
    
	c) decimal | numeric
    : 고정 소수점 데이터 타입, 정밀한 소수점 계산에 필요 
*/

create database if not exists `example`;

create table products(
	price float(7, 2),
    price2 double(10, 4),
    price3 decimal(15, 2)
    
    # 실수형 데이터 타입은 함수의 형태로 사용
    # 데이터타입(전체 자리수, 소수점 아래 자리수)
);

/*
	4. 논리형 
    : Boolean 값을 저장하기 위한 데이터 타입
    : 논리적으로 참(True)과 거짓(False)값을 나타냄
    cf) 비워 둘 경우 null(알 수 없음, 부재한 값)으로 인식
    
    cf) MySQL에서는 Boolean 타입이 존재하지만, 실제로는 tinyint(1)로 처리
		>> TRUE는 1로 FALSE는 0으로 저장
        
	cf) Boolean 값에 대소문자 구분 X
*/
use example;
create table employees (
	is_active Boolean
);

insert into employees
values (true);

select * from employees;
# true값이 1로 변환되어 저장됨