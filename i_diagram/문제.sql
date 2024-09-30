# 학교 관리 시스템 #

/*
요구 사항
school_db 데이터베이스 생성

학생(Students) 테이블: 학생 ID, 이름, 전공, 입학년도를 포함
교수(Professors) 테이블: 교수 ID, 이름, 학과, 사무실 위치를 포함
강의(Courses) 테이블: 강의 ID, 강의명, 담당 교수 ID, 학점 수를 포함
수강(Enrollments) 테이블: 수강 ID, 학생 ID, 강의 ID, 수강년도, 학기를 포함
각 테이블의 ID는 기본 키로 설정
교수 ID는 강의 테이블에서 외래 키로 설정되어야 하며, 교수와 강의 사이의 관계 작성
학생 ID와 강의 ID는 수강 테이블에서 외래 키로 설정되어야 하며, 학생, 강의, 수강 사이의 다대다 관계 작성.

*/

create database if not exists school_db;
use school_db;

create table if not exists 학생 (
	학생ID int primary key,
    이름 varchar(100),
    전공 varchar(100),
    입학년도 year
);

create table if not exists 교수 (
	교수ID int primary key,
    이름 varchar(100),
    학과 varchar(100),
    사무실위치 varchar(100)
);

create table if not exists 강의 (
	강의ID int primary key,
    강의명 varchar(100),
    담당교수ID int,
    학점수 int,
    foreign key (담당교수ID) references 교수(교수ID)
);

create table if not exists 수강 (
	수강ID int primary key,
    학생ID int, 
    강의ID int,
    수강년도 year,
    학기 int,
    foreign key (학생ID) references 학생(학생ID),
    foreign key (강의ID) references 강의(강의ID)
);
