--재고 예약
drop table STOCK;
drop table INVOICE;
drop table SUPPLIER;
drop table RECEPTION;
drop table PAYMENT;
drop table NOTICE;
drop table BIZ_REPORT; 
drop table MINUTES;
drop SEQUENCE RECEPTION_SEQ;
drop SEQUENCE NOTICE_SEQ;
drop SEQUENCE BIZ_SEQ;
drop SEQUENCE MINUTES_SEQ;
drop SEQUENCE INVOICE_SEQ;
--환자 진료_처방
DROP TABLE MEDICAL;
DROP TABLE PATIENT;
DROP TABLE TREATMENT;
DROP TABLE PRESCRIPTION;
DROP TABLE PATIENT_TREATMENT;
DROP TABLE PATIENT_PRESCRIPTION;
drop SEQUENCE MEDICAL_SEQ;
drop sequence patient_prescription_no;
drop sequence prescription_seq;
drop sequence patient_treatment_no;
DROP SEQUENCE TREATMENT_SEQ;
--회계
drop table account;
drop table acc_type_code;
drop sequence account_seq;
drop sequence type_code_seq;
--인사
DROP TABLE basic_pay_table;
DROP TABLE PAY_MANAGEMENT;
DROP TABLE commute_management;
DROP TABLE human_resourse_management;
DROP TABLE department_table;
DROP TABLE duty_responsibility_table;
DROP TABLE bank;
DROP TABLE commute_absence;
drop table emp_absence_list;
drop SEQUENCE commute_seq;
drop SEQUENCE PAY_MANAGEMENT_seq;
drop SEQUENCE emp_absence_list_seq;
drop table emp_absence_wait_approval;
drop SEQUENCE emp_absence_wait_seq;
--계정관리
drop table role_comparison;
drop table security_role;
drop table hospital_information;
drop table user_member;
drop SEQUENCE  user_member_sequence;
--메일 
drop table center;
-------------------------------------------------------------------------------------
create table center(
   bid number,
   bname varchar2(20),
  bmail varchar2(20),
  bphone varchar2(15),
   btitle varchar2(100),
   bcontent varchar2(100),
bdate Date
);

-- STOCK : 재고
CREATE TABLE STOCK (
	ST_CODE VARCHAR2(20) NOT NULL,
	ST_NAME VARCHAR2(50) NOT NULL,
	ST_STD VARCHAR2(20) NOT NULL,
	ST_MODEL VARCHAR2(20) NOT NULL,
	ST_MAN VARCHAR2(50) NOT NULL,
	ST_VENDOR VARCHAR2(50) NOT NULL,
	ST_QTY NUMBER NOT NULL,
	ST_UNIT VARCHAR2(20) NOT NULL
);

-- INVOICE : 거래/구매내역
CREATE TABLE INVOICE (
   IN_SEQ NUMBER,
   ST_CODE VARCHAR2(20) NOT NULL,
   ST_NAME VARCHAR2(50) NOT NULL,
   ST_STD VARCHAR2(20) NOT NULL,
   ST_MODEL VARCHAR2(20) NOT NULL,
   ST_MAN VARCHAR2(50) NOT NULL,
   ST_VENDOR VARCHAR2(50) NOT NULL,
   ST_QTY NUMBER NOT NULL,
   ST_UNIT VARCHAR2(20) NOT NULL,
   IN_PRICE NUMBER NOT NULL,
   IN_DATE VARCHAR2(20) NOT NULL
);
CREATE SEQUENCE INVOICE_SEQ;
-- SUPPLIER : 거래처
CREATE TABLE SUPPLIER (
	SU_TAXID VARCHAR2(50) NOT NULL,
	SU_NAME VARCHAR2(50) NOT NULL,
	SU_CEO VARCHAR2(20) NOT NULL,
	SU_FNDT VARCHAR2(20) NOT NULL,
	SU_ADDR VARCHAR2(150) NOT NULL,
	SU_PHONE VARCHAR2(50) NOT NULL,
	SU_ITEM VARCHAR2(150) NOT NULL,
	SU_MGR VARCHAR2(50) NULL
);

-- RECEPTION : 예약 및 접수
CREATE TABLE RECEPTION (
	R_NO NUMBER,
	C_NO VARCHAR2(20) NOT NULL,
	C_NAME VARCHAR2(50) NOT NULL,
	RES_DATE VARCHAR2(20) NULL,
	RES_TIME VARCHAR2(20) NULL,
	REC_DATE DATE NULL,
	CK NUMBER DEFAULT 0
);
CREATE SEQUENCE RECEPTION_SEQ;

-- PAYMENT : 결제 대기
-- [ 환자 검색 -> 접수 -> 진료(환자 상세보기에서 진료내역 저장 시) -> 접수 목록에서 삭제, 해당 테이블에 진료비 추가 ] 
CREATE TABLE PAYMENT(
	C_NO VARCHAR2(20) NOT NULL,
	C_NAME VARCHAR2(20) NOT NULL,
	T_PAY NUMBER NOT NULL
);

-- NOTICE : 공지사항(게시판)
CREATE TABLE NOTICE (
	N_ID NUMBER,
	N_NAME VARCHAR2(20) NOT NULL,
	N_TITLE VARCHAR2(200) NOT NULL,
	N_CONTENT VARCHAR2(2000) NOT NULL,
	N_DATE DATE DEFAULT SYSDATE,
	N_HIT NUMBER DEFAULT 0,
	N_FILESRC VARCHAR2(800) NULL
);
CREATE SEQUENCE NOTICE_SEQ;

-- BIZ_REPORT : 업무보고서(게시판)
CREATE TABLE BIZ_REPORT ( -- 1
	B_ID NUMBER,
	B_NAME VARCHAR2(20) NOT NULL,
	B_TITLE VARCHAR2(200) NOT NULL,
	B_CONTENT VARCHAR2(2000) NOT NULL,
	B_DATE DATE DEFAULT SYSDATE,
	B_HIT NUMBER DEFAULT 0,
	B_GROUP NUMBER DEFAULT 0,
	B_STEP NUMBER DEFAULT 0,
	B_INDENT NUMBER DEFAULT 0,
	B_FILESRC VARCHAR2(800) NULL
);
CREATE SEQUENCE BIZ_SEQ;

-- MINUTES : 회의록(게시판)
CREATE TABLE MINUTES (
	M_ID NUMBER,
	M_NAME VARCHAR2(20) NOT NULL,
	M_TITLE VARCHAR2(200) NOT NULL,
	M_CONTENT VARCHAR2(2000) NOT NULL,
	M_DATE DATE DEFAULT SYSDATE,
	M_HIT NUMBER DEFAULT 0,
	M_FILESRC VARCHAR2(800) NULL
);
CREATE SEQUENCE MINUTES_SEQ;

CREATE TABLE MEDICAL(
	M_NO NUMBER,
	M_NAME VARCHAR2(20),
	M_GENDER VARCHAR2(10),
	M_JUMIN1 VARCHAR2(20),
	M_JUMIN2 VARCHAR2(20),
	M_ADDRESS VARCHAR2(200),
	M_PHONE VARCHAR2(50)
);

CREATE SEQUENCE MEDICAL_SEQ
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCACHE  
    NOORDER  
    NOCYCLE ;

-- PATIENT : 환자
CREATE TABLE PATIENT (
	C_NO NUMBER,
	C_NAME VARCHAR2(20),
	C_GENDER VARCHAR2(10),
	C_JUMIN1 VARCHAR2(30),
	C_JUMIN2 VARCHAR2(30),       
	C_ADDRESS VARCHAR2(200),
	C_PHONE VARCHAR2(50),
	C_DOCTOR VARCHAR2(20),	
	C_MDATE VARCHAR2(20),
	constraint pk_PATIENT_c_no primary key(C_NO)
);

-- TREATMENT : 진료 목록
CREATE TABLE TREATMENT(
	T_CODE NUMBER (20),
	T_NAME VARCHAR(20),
	T_PAY NUMBER(20)
);

--PRESCRIPTION : 처방 목록
CREATE TABLE PRESCRIPTION(
   pre_code varchar2(10),
  pre_name varchar2(50),
  pre_way varchar2(50)
);

--patient_treatment : 해당환자 진료기록
create table patient_treatment (
patient_treatment_no number(10),
c_no varchar2(10),
t_code varchar2(20),
t_content varchar2(500),
t_date VARCHAR2(30)
);

--patient_prescription : 해당환자 처방기록
create table patient_prescription (
patient_prescription_no number(10),
c_no varchar2(10),
pre_code varchar2(50),
pre_name varchar(50),
t_date VARCHAR2(20)
);

create sequence patient_prescription_no;
create sequence patient_treatment_no;
CREATE SEQUENCE TREATMENT_SEQ;
CREATE SEQUENCE PRESCRIPTION_SEQ;
-- ACCOUNT : 회계
CREATE TABLE ACCOUNT (
	AC_SEQ NUMBER,
	AC_DATE VARCHAR2(50) NOT NULL,    			
	AC_TYPENAME VARCHAR2(50) NOT NULL,	
	AC_CONT VARCHAR2(300) NOT NULL,
	AC_IMP NUMBER DEFAULT 0,
	AC_EXP NUMBER DEFAULT 0
);


CREATE SEQUENCE ACCOUNT_SEQ    
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCACHE  
    NOORDER  
    NOCYCLE ;  
  

--type code    
--ACOUNT TYPE CODE TABLE
CREATE TABLE ACC_TYPE_CODE (
	TYPE_CODE VARCHAR2(10),
	TYPE_NAME VARCHAR2(50)
);
create sequence type_code_seq;

--직책 등록
create table duty_responsibility_table (
duty_responsibility_code varchar2(15),
duty_responsibility varchar2(30),
 constraint pk_duty_responsibility_table primary key(duty_responsibility_code),
 unique(duty_responsibility)
);

--부서등록
 create table department_table (
department_code varchar2(15),
department varchar2(30),
 constraint pk_department_table primary key(department_code)
);

--인사관리(인적정보)
create table human_resourse_management(
emp_num varchar2(15), emp_name varchar2(15) not null,
telephone varchar2(30) not null, telephone2 varchar2(30),
address_number varchar2(20),address varchar2(200),
department_code varchar2(20),
jumin_number varchar2(25),gender varchar2(10),
join_date date, retire_date date,
email varchar2(30), rank_position varchar2(20),
duty_responsibility varchar2(20), 
continuous_service_date varchar2(20),
marital_status varchar2(10),bank_name varchar2(50),
account_holder varchar2(20),
account_number varchar2(30),
picture varchar2(2000), attach_file varchar2(4000),
join_company_division varchar2(10),
 constraint pk_human_resourse_management primary key(emp_num),
 CONSTRAINT fk_human_resourse_management FOREIGN KEY(duty_responsibility)
 REFERENCES duty_responsibility_table(duty_responsibility),
 CONSTRAINT fk2_human_resourse_management FOREIGN KEY(department_code)
 REFERENCES department_table (department_code)
);

--출퇴근 관리 
create table commute_management(
   commute_num number(10),
   emp_num varchar2(10) ,
   status varchar2(100) not null,
   year varchar2(10),
   month varchar2(10),
   day varchar2(10),
   hour varchar2(10),
   minute varchar2(10),
   second varchar2(10),
   constraint pk_commute_management primary key(commute_num),
   CONSTRAINT fk_commute_management FOREIGN KEY(emp_num)
   REFERENCES human_resourse_management(emp_num),
   unique (emp_num,status,year,month,day)
); 

CREATE SEQUENCE commute_seq
   MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCACHE  
    NOORDER  
    NOCYCLE;


--급여관리
CREATE TABLE PAY_MANAGEMENT 
  (PAY_NUM NUMBER(10), 
   EMP_NUM VARCHAR2(10),  
   PAY_DIVISION VARCHAR2(20),
  TOTAL_PAY NUMBER(20,0), 
  REAL_PAY NUMBER(20,0), 
  INCOME_TAX NUMBER(20,0), 
  RESIDENCE_TAX NUMBER(20,0), 
  HEALTH_INSURANCE NUMBER(20,0), 
  UNEMPLOYMENT_INSURANCE NUMBER(20,0), 
  NATION_PENSION NUMBER(20,0), 
  ETX_PAY NUMBER(20,0), 
  BASIC_PAY NUMBER(20,0), 
  BONUS NUMBER(20,0), 
  INCENTIVE_PAY NUMBER(20,0), 
  FOOD_PAY NUMBER(20,0), 
  TRANSPORTATION_PAY NUMBER(20,0), 
   CONSTRAINT PK_PAY_MANAGEMENT PRIMARY KEY (EMP_NUM),
   CONSTRAINT fk_PAY_MANAGEMENT FOREIGN KEY(emp_num)
   REFERENCES human_resourse_management(emp_num)
   ); 

CREATE SEQUENCE PAY_MANAGEMENT_seq
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCACHE  
    NOORDER  
    NOCYCLE;

--급여관리(기본급 테이블)
create table basic_pay_table (
duty_responsibility_code varchar(15),
basic_pay number(20),
   CONSTRAINT fk_basic_pay_table FOREIGN KEY(duty_responsibility_code)
   REFERENCES duty_responsibility_table(duty_responsibility_code)
);

--은행 코드 테이블
create table bank(
bank_code varchar(40),
bank_name varchar(40),
constraint pk_bank_code primary key(bank_code)
);

--결근 사유 테이블
create table commute_absence (    
    absence_code varchar2 (10),
    absence_name varchar2 (40),
    constraint commute_absence_absence_code primary key(absence_code)
    );

--결근자 리스트 모음
create table emp_absence_list( 
  emp_absence_list_code varchar2(50), 
  emp_num varchar2(20),
  status varchar2(100),  
  start_date varchar2(50),
  end_date varchar2(50),  
   constraint pk_emp_absence_list_code primary key(emp_absence_list_code)
  );

create SEQUENCE emp_absence_list_seq;


--결근 및 휴가 신청 승인 기다리는 테이블
create table emp_absence_wait_approval( 
  emp_absence_list_code varchar2(50), 
  emp_num varchar2(20),
  status varchar2(100),  
  start_date varchar2(50),
  end_date varchar2(50),  
   constraint pk_emp_absence_wait_approval primary key(emp_absence_list_code)
  );
create SEQUENCE emp_absence_wait_seq;




create table role_comparison( -- 권한 비교 테이블
  c_reference VARCHAR2(100), -- 기준값
  c_authority_name VARCHAR2(30), -- 권한코드
  c_id VARCHAR2(30), -- 사원id
  c_authority VARCHAR2(100) -- 사원권한
);

-- 시큐리티 룰 테이블

create table security_role(
r_id VARCHAR2(20) , -- id, 사번
r_authority VARCHAR2(50) default ' ' -- 권한
);

--병원정보 테이블

create table hospital_information(
  h_name VARCHAR2(30) not null, --병원명
  h_master VARCHAR2(15), --병원장 이름
  h_master_tel VARCHAR2(20), --병원장 연락처
  h_tel VARCHAR2(20), --병원 연락처
  h_map VARCHAR2(300), --병원 주소
  h_lnum VARCHAR2(30), --병원 사업자등록증
  h_logo  VARCHAR2(200) --병원 로고
);

--계정관련 테이블

create table user_member(
  u_num number, -- 숫자 정렬기준
  u_id VARCHAR2(20) primary key, -- id, 사번
  u_pwd VARCHAR2(30) not null, -- 패스워드
  u_position VARCHAR2(200) , -- 직책
  u_name VARCHAR2(20), -- 이름
  u_phone VARCHAR2(20), -- 연락처
  u_email VARCHAR2(50), -- 이메일
  u_team VARCHAR2(20), -- 부서
  u_joindate DATE, -- 가입일 
  u_modifydate DATE -- 마지막 수정일
);


CREATE SEQUENCE  user_member_sequence  
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCACHE  
    NOORDER  
    NOCYCLE ;

create table role_korea(
  num NUMBER,
 C_AUTHORITY_NAME VARCHAR2(30),
 c_korea_name VARCHAR2(30)
);













-------------------------------------------------------------------------------------
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'신정은','111111','1111111','경기도1','01011111111','여');
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'정선환','222222','2222222','경기도2','01022222222','남');
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'윤이나','333333','3333333','경기도3','01033333333','여');
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'정지훈','444444','4444444','경기도4','01044444444','남');
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'공승민','555555','5555555','경기도5','01055555555','남');
insert into medical(M_NO,M_NAME,M_JUMIN1,M_JUMIN2,M_ADDRESS,M_PHONE,M_GENDER ) values
(medical_seq.nextval,'박종훈','666666','6666666','경기도6','01066666666','남');


insert into role_korea values(1,'view','사용가능');
insert into role_korea values(2,'nothing','권한없음');
insert into role_korea values(3,'readOnly','읽기');
insert into role_korea values(4,'readWrite','읽기/쓰기');
insert into role_korea values(5,'anything','모든권한');
insert into role_korea values(6,'master','관리자');

insert into treatment values(treatment_seq.nextval,'진료',3000);
insert into treatment values(treatment_seq.nextval,'검사',5000);
insert into treatment values(treatment_seq.nextval,'X-Ray',10000);
insert into treatment values(treatment_seq.nextval,'CT',20000);
insert into treatment values(treatment_seq.nextval,'MRI',100000);
insert into treatment values(treatment_seq.nextval,'물리치료',5000);


INSERT INTO PRESCRIPTION VALUES (0,'처방없음','처방없음');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'오그멕스듀오500mg','식후30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'푸라콩3mg','식후30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'코슈(코오롱)','식후30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'맥시부펜이알정','식후30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'가브스메트정50/1000MG','식전30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'게리드엠정','식전30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'구루메포민정250','식후30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'그리코민정','식전30분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'그린페지정','식전10분');
INSERT INTO PRESCRIPTION VALUES (prescription_seq.nextval,'우루사(정)200mg','식후30분');

insert into account values(account_seq.nextval,to_char(sysdate, 'yyyy-mm-dd'), 'TEST' ,'반갑습니다. 추후 삭제하시고 사용하세요', 0, 
0);
-- 월급/진료/치료(검사,주사 등)/의약품/관리비/장비/기타

INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '월급'); 
INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '진료/검사');
INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '의약품');
INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '관리비');
INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '유지비');
INSERT INTO ACC_TYPE_CODE (TYPE_CODE, TYPE_NAME) VALUES(type_code_seq.nextval, '기타');

Insert into DUTY_RESPONSIBILITY_TABLE (DUTY_RESPONSIBILITY_CODE,DUTY_RESPONSIBILITY) values ('00001','병원장');
Insert into DUTY_RESPONSIBILITY_TABLE (DUTY_RESPONSIBILITY_CODE,DUTY_RESPONSIBILITY) values ('00002','간호사');
Insert into DUTY_RESPONSIBILITY_TABLE (DUTY_RESPONSIBILITY_CODE,DUTY_RESPONSIBILITY) values ('00003','코디네이터');
Insert into DUTY_RESPONSIBILITY_TABLE (DUTY_RESPONSIBILITY_CODE,DUTY_RESPONSIBILITY) values ('00004','의사');

Insert into DEPARTMENT_TABLE (DEPARTMENT_CODE,DEPARTMENT) values ('00001','경영지원부');
Insert into DEPARTMENT_TABLE (DEPARTMENT_CODE,DEPARTMENT) values ('00002','진료부서');
Insert into DEPARTMENT_TABLE (DEPARTMENT_CODE,DEPARTMENT) values ('00003','원무부서');

Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00001','정다운','010-4214-1244','02-2312-2412','62404','광주 광산구 가마길 2-22','00001','890913-1234124','남자',to_date
('16/05/04','RR/MM/DD'),null,'wjdekdns@naver.com',null,'간호사',null,'미혼','한국은행','정다운','308214208',null,null,'신입');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00002','최준호','010-2431-2342','051-2342-1231','12715','경기 광주시 퇴촌면 가새골길 6','00002','890123-1234111','남자',to_date
('15/02/11','RR/MM/DD'),null,'chlwnsgh@naver.com',null,'코디네이터',null,'미혼','수협중앙회','최준호','111823-231311',null,null,'신입');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00003','정지훈','010-4563-2363','02-3451-2354','16979','경기 용인시 기흥구 갈곡로 2','00003','890403-1312123','남자',to_date('16/01/06','RR/MM/DD'),null,'wjdwlgns@naver.com',null,'병원장',null,'미혼','한국은행','정지훈','5151131231',null,null,'
신입');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00004','정선환','010-2342-1155','02-1241-1241','16979','경기 용인시 기흥구 갈곡로 2','00002','921011-1231233','남자',to_date('15/12/01','RR/MM/DD'),null,'wjdtjsghks@naver.com',null,'의사','194일','미혼','국민은행','정선환','53901421341',null,null,'경력');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00005','박종훈','010-1341-1241','02-1241-1231','14901','경기 시흥시 가마길 40-5','00002','841213-1234111','남자',to_date('15/12/30','RR/MM/DD'),null,'qkrwhdgns@naver.com',null,'의사','165일','미혼','한국스탠다드차타드은행','박종훈','621323123212',null,null,'경력');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00006','신정은','010-3453-1231','02-4356-1134','13485','경기 성남시 분당구 판교로 20','00002','920123-2312312','여자',to_date('13/01/01','RR/MM/DD'),to_date('15/12/01','RR/MM/DD'),'tlswjddms@gmail.com',null,'간호사','1258일','미혼','한국씨티은행','신정은','42341212312123',null,null,'경력');
Insert into HUMAN_RESOURSE_MANAGEMENT 
(EMP_NUM,EMP_NAME,TELEPHONE,TELEPHONE2,ADDRESS_NUMBER,ADDRESS,DEPARTMENT_CODE,JUMIN_NUMBER,GENDER,JOIN_DATE,RETIRE_DATE,EMAIL,RANK_POSITION,DUTY_RESPONSIBILITY,CONTINUOUS_SERVICE_DATE,MARITAL_STATUS,BANK_NAME,ACCOUNT_HOLDER,ACCOUNT_NUMBER,PICTURE,ATTACH_FILE,JOIN_COMPANY_DIVISION) values ('00007','윤이나','010-4354-4645','02-3525-8852','13536','경기 성남시 분당구 판교역로 12','00002','911231-2234235','여자',to_date('12/01/31','RR/MM/DD'),to_date('16/06/08','RR/MM/DD'),'dbsdlsk@gmail.com',null,'간호사','1594일','미혼','외환은행','윤이나','41797234223',null,null,'경력');

Insert into BASIC_PAY_TABLE (DUTY_RESPONSIBILITY_CODE,BASIC_PAY) values ('00001',50000000);
Insert into BASIC_PAY_TABLE (DUTY_RESPONSIBILITY_CODE,BASIC_PAY) values ('00002',3000000);
Insert into BASIC_PAY_TABLE (DUTY_RESPONSIBILITY_CODE,BASIC_PAY) values ('00003',2500000);
Insert into BASIC_PAY_TABLE (DUTY_RESPONSIBILITY_CODE,BASIC_PAY) values ('00004',40000000);





Insert into BANK (BANK_CODE,BANK_NAME) values ('1','한국은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('2','산업은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('3','기업은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('4','국민은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('5','외환은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('7','수협중앙회');
Insert into BANK (BANK_CODE,BANK_NAME) values ('8','수출입은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('11','농협중앙회');
Insert into BANK (BANK_CODE,BANK_NAME) values ('12','단위농협(축협)');
Insert into BANK (BANK_CODE,BANK_NAME) values ('20','우리은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('23','한국스탠다드차타드은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('27','한국씨티은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('31','대구은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('32','부산은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('34','광주은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('35','제주은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('37','전북은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('39','경남은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('45','새마을금고중앙회');
Insert into BANK (BANK_CODE,BANK_NAME) values ('48','신협중앙회');
Insert into BANK (BANK_CODE,BANK_NAME) values ('50','상호저축은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('52','모건스탠리은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('54','HSBC은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('55','도이치은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('56','알비에스은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('57','제이피모간체이스은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('58','미즈호코퍼레이트은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('59','미쓰비시도쿄UFJ은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('60','BOA은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('61','비엔피파리바은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('64','산립조합중앙회');
Insert into BANK (BANK_CODE,BANK_NAME) values ('71','지식경제부');
Insert into BANK (BANK_CODE,BANK_NAME) values ('76','신용보증기금');
Insert into BANK (BANK_CODE,BANK_NAME) values ('77','기술보증기금');
Insert into BANK (BANK_CODE,BANK_NAME) values ('81','하나은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('88','신한은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('92','한국정책금융공사');
Insert into BANK (BANK_CODE,BANK_NAME) values ('93','한국주택금융공사');
Insert into BANK (BANK_CODE,BANK_NAME) values ('94','서울보증보험');
Insert into BANK (BANK_CODE,BANK_NAME) values ('95','경찰청');
Insert into BANK (BANK_CODE,BANK_NAME) values ('96','한국전자금융(주)');
Insert into BANK (BANK_CODE,BANK_NAME) values ('99','금융결제원');
Insert into BANK (BANK_CODE,BANK_NAME) values ('209','유안타증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('218','현대증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('230','미래에셋증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('238','대우증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('240','삼성증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('243','한국투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('247','우리투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('261','교보증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('262','하이투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('263','HMC투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('264','키움증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('265','이베스트투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('266','SK증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('267','대신증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('268','아이엠투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('269','한화투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('270','하나대투증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('278','신한금융투자');
Insert into BANK (BANK_CODE,BANK_NAME) values ('279','동부증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('280','유진투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('287','메리츠종합금융증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('289','NH투자증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('290','부국증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('291','신영증권');
Insert into BANK (BANK_CODE,BANK_NAME) values ('292','엘아이지투자증권');


Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00001','휴가');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00002','병가');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00003','파견(출장)');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00004','경조사');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00005','병원 지정 휴일');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00020','임시 공휴일');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00021','신정');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00022','설날');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00023','삼일절');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00024','어린이날');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00025','석가탄신일');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00026','현충일');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00027','광복절');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00028','추석');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00029','개천절');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00030','한글날');
Insert into COMMUTE_ABSENCE (ABSENCE_CODE,ABSENCE_NAME) values ('00031','크리스마스');


Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','master','00007','ROLE_human_resources_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00007','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','master','00007','ROLE_inventory_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','master','00007','ROLE_inventory_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','master','00007','ROLE_inventory_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00007','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','master','00007','ROLE_accounting_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','master','00007','ROLE_accounting_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00007','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','master','00007','ROLE_admin_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','master','00007','ROLE_admin_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00007','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','master','00007','ROLE_reservation_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','master','00007','ROLE_reservation_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00007','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','master','00007','ROLE_board_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','master','00007','ROLE_board_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','master','00007','ROLE_board_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','master','00007','ROLE_reservation_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','master','00007','ROLE_patient_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','master','00007','ROLE_human_resources_page4_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00010','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','readOnly','00010','ROLE_patient_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','nothing','00005','ROLE_patient_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','nothing','00005','ROLE_human_resources_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','nothing','00005','ROLE_human_resources_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','nothing','00005','ROLE_human_resources_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','nothing','00005','ROLE_human_resources_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','nothing','00005','ROLE_inventory_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','nothing','00005','ROLE_inventory_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','nothing','00005','ROLE_inventory_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','nothing','00005','ROLE_inventory_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','nothing','00009','ROLE_patient_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00009','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00009','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00009','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00009','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','nothing','00009','ROLE_inventory_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','nothing','00009','ROLE_inventory_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','nothing','00009','ROLE_inventory_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','nothing','00009','ROLE_inventory_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','nothing','00009','ROLE_accounting_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','nothing','00009','ROLE_accounting_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','nothing','00009','ROLE_accounting_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','nothing','00009','ROLE_admin_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','nothing','00009','ROLE_admin_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','nothing','00009','ROLE_admin_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','nothing','00009','ROLE_reservation_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','nothing','00009','ROLE_reservation_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','nothing','00009','ROLE_reservation_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00009','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','anything','00009','ROLE_board_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','anything','00009','ROLE_board_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','anything','00009','ROLE_board_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','nothing','00009','ROLE_reservation_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','nothing','00009','ROLE_patient_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','anything','00009','ROLE_human_resources_page4_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','nothing','00005','ROLE_accounting_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','nothing','00005','ROLE_accounting_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00008','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','nothing','00008','ROLE_patient_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','nothing','00008','ROLE_patient_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00008','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','nothing','00008','ROLE_human_resources_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','nothing','00008','ROLE_human_resources_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','nothing','00008','ROLE_human_resources_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00008','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','nothing','00008','ROLE_inventory_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','nothing','00008','ROLE_inventory_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','nothing','00008','ROLE_inventory_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00008','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','nothing','00008','ROLE_accounting_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','nothing','00008','ROLE_accounting_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00008','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','nothing','00008','ROLE_admin_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','nothing','00008','ROLE_admin_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00008','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','nothing','00008','ROLE_reservation_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','nothing','00008','ROLE_reservation_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00008','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','nothing','00008','ROLE_board_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','nothing','00008','ROLE_board_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','nothing','00008','ROLE_board_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','nothing','00008','ROLE_reservation_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','nothing','00008','ROLE_patient_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','nothing','00008','ROLE_human_resources_page4_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','nothing','00005','ROLE_patient_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','nothing','00005','ROLE_patient_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','nothing','00005','ROLE_accounting_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','nothing','00005','ROLE_admin_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','nothing','00005','ROLE_admin_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','nothing','00005','ROLE_admin_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','nothing','00005','ROLE_reservation_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','nothing','00005','ROLE_reservation_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','nothing','00005','ROLE_reservation_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','nothing','00005','ROLE_board_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','nothing','00005','ROLE_board_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','nothing','00005','ROLE_board_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','nothing','00005','ROLE_board_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','nothing','00005','ROLE_reservation_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','nothing','00005','ROLE_patient_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','nothing','00005','ROLE_human_resources_page4_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00006','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','anything','00006','ROLE_patient_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','nothing','00009','ROLE_patient_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','nothing','00009','ROLE_patient_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','anything','00006','ROLE_patient_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00006','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00006','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00006','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00006','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00006','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','anything','00006','ROLE_inventory_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','anything','00006','ROLE_inventory_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','anything','00006','ROLE_inventory_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00006','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','anything','00006','ROLE_accounting_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','anything','00006','ROLE_accounting_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00006','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','anything','00006','ROLE_admin_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','anything','00006','ROLE_admin_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00006','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','anything','00006','ROLE_reservation_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','anything','00006','ROLE_reservation_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00006','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','anything','00006','ROLE_board_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','anything','00006','ROLE_board_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','anything','00006','ROLE_board_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','anything','00006','ROLE_reservation_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','anything','00006','ROLE_patient_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','anything','00006','ROLE_human_resources_page4_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00007','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','master','00007','ROLE_patient_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','master','00007','ROLE_patient_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00007','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','master','00007','ROLE_human_resources_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','master','00007','ROLE_human_resources_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','readOnly','00010','ROLE_patient_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00010','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','readOnly','00010','ROLE_human_resources_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','readOnly','00010','ROLE_human_resources_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','readOnly','00010','ROLE_human_resources_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00010','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','readOnly','00010','ROLE_inventory_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','readOnly','00010','ROLE_inventory_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','readOnly','00010','ROLE_inventory_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00010','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','readOnly','00010','ROLE_accounting_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00010','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','readOnly','00010','ROLE_admin_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','readOnly','00010','ROLE_admin_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00010','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','readOnly','00010','ROLE_reservation_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','readOnly','00010','ROLE_reservation_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00010','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','readOnly','00010','ROLE_board_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','readOnly','00010','ROLE_board_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','readOnly','00010','ROLE_board_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00011','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','readWrite','00011','ROLE_patient_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','readWrite','00011','ROLE_patient_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00011','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','readWrite','00011','ROLE_human_resources_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','readWrite','00011','ROLE_human_resources_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','readWrite','00011','ROLE_human_resources_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00011','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','readWrite','00011','ROLE_inventory_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','readWrite','00011','ROLE_inventory_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','readWrite','00011','ROLE_inventory_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00011','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','readWrite','00011','ROLE_accounting_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00011','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','readWrite','00011','ROLE_admin_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','readWrite','00011','ROLE_admin_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00011','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','readWrite','00011','ROLE_reservation_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','readWrite','00011','ROLE_reservation_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00011','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','readWrite','00011','ROLE_board_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','readWrite','00011','ROLE_board_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','readWrite','00011','ROLE_board_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00012','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','anything','00012','ROLE_patient_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','anything','00012','ROLE_patient_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00012','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00012','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00012','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00012','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00012','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','anything','00012','ROLE_inventory_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','anything','00012','ROLE_inventory_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','anything','00012','ROLE_inventory_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00012','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','anything','00012','ROLE_accounting_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00012','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','anything','00012','ROLE_admin_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','anything','00012','ROLE_admin_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00012','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','anything','00012','ROLE_reservation_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','anything','00012','ROLE_reservation_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00012','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','anything','00012','ROLE_board_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','anything','00012','ROLE_board_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','anything','00012','ROLE_board_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00013','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','anything','00013','ROLE_patient_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','anything','00013','ROLE_patient_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00013','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00013','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00013','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00013','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00013','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','anything','00013','ROLE_inventory_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','anything','00013','ROLE_inventory_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','anything','00013','ROLE_inventory_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','nothing','00013','ROLE_accounting_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','nothing','00013','ROLE_accounting_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','nothing','00013','ROLE_admin_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','nothing','00013','ROLE_admin_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','nothing','00013','ROLE_admin_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','nothing','00013','ROLE_reservation_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','nothing','00013','ROLE_reservation_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','nothing','00013','ROLE_reservation_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','nothing','00013','ROLE_board_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','nothing','00013','ROLE_board_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','nothing','00013','ROLE_board_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','nothing','00013','ROLE_board_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','nothing','00014','ROLE_patient_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','anything','00014','ROLE_patient_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','anything','00014','ROLE_patient_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','nothing','00014','ROLE_human_resources_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00014','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00014','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00014','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','nothing','00014','ROLE_inventory_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','anything','00014','ROLE_inventory_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','anything','00014','ROLE_inventory_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','anything','00014','ROLE_inventory_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00014','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','anything','00014','ROLE_accounting_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00014','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','anything','00014','ROLE_admin_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','anything','00014','ROLE_admin_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00014','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','anything','00014','ROLE_reservation_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','anything','00014','ROLE_reservation_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00014','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','anything','00014','ROLE_board_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','anything','00014','ROLE_board_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','anything','00014','ROLE_board_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','nothing','00015','ROLE_patient_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','nothing','00015','ROLE_human_resources_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','nothing','00015','ROLE_human_resources_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','nothing','00015','ROLE_human_resources_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','nothing','00015','ROLE_human_resources_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','nothing','00015','ROLE_inventory_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','nothing','00015','ROLE_inventory_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','nothing','00015','ROLE_inventory_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','nothing','00015','ROLE_inventory_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','nothing','00015','ROLE_accounting_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','nothing','00015','ROLE_accounting_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','nothing','00015','ROLE_accounting_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','nothing','00015','ROLE_admin_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','nothing','00015','ROLE_admin_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','nothing','00015','ROLE_admin_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','nothing','00015','ROLE_reservation_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','nothing','00015','ROLE_reservation_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','nothing','00015','ROLE_reservation_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','nothing','00015','ROLE_board_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','nothing','00015','ROLE_board_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','nothing','00015','ROLE_board_page2_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','nothing','00015','ROLE_board_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','master','admin','ROLE_patient_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','admin','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','master','admin','ROLE_human_resources_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','master','admin','ROLE_human_resources_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','master','admin','ROLE_human_resources_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','admin','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','master','admin','ROLE_inventory_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','master','admin','ROLE_inventory_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','master','admin','ROLE_inventory_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','admin','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','master','admin','ROLE_accounting_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','master','admin','ROLE_accounting_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','admin','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','master','admin','ROLE_admin_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','master','admin','ROLE_admin_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','admin','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','master','admin','ROLE_reservation_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','master','admin','ROLE_reservation_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','admin','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','master','admin','ROLE_board_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','master','admin','ROLE_board_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','master','admin','ROLE_board_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','master','admin','ROLE_reservation_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','master','admin','ROLE_patient_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','master','admin','ROLE_human_resources_page4_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','nothing','00015','ROLE_patient_page_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','nothing','00015','ROLE_patient_page1_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','master','a','ROLE_patient_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','a','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','master','a','ROLE_human_resources_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','master','a','ROLE_human_resources_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','master','a','ROLE_human_resources_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','a','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','master','a','ROLE_inventory_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','master','a','ROLE_inventory_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','master','a','ROLE_inventory_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','a','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','master','a','ROLE_accounting_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','master','a','ROLE_accounting_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values ('admin_page','view','a','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','master','a','ROLE_admin_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','master','a','ROLE_admin_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','a','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','master','a','ROLE_reservation_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','master','a','ROLE_reservation_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values ('board_page','view','a','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','master','a','ROLE_board_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','master','a','ROLE_board_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','master','a','ROLE_board_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','master','a','ROLE_reservation_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','master','a','ROLE_patient_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','master','a','ROLE_human_resources_page4_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','a','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','master','a','ROLE_patient_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','nothing','00015','ROLE_reservation_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','nothing','00015','ROLE_patient_page3_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','nothing','00015','ROLE_human_resources_page4_nothing');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','admin','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','master','admin','ROLE_patient_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00001','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','anything','00001','ROLE_patient_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','anything','00001','ROLE_patient_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00001','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','anything','00001','ROLE_human_resources_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','anything','00001','ROLE_human_resources_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','anything','00001','ROLE_human_resources_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00001','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','anything','00001','ROLE_inventory_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','anything','00001','ROLE_inventory_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','anything','00001','ROLE_inventory_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00001','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','anything','00001','ROLE_accounting_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','anything','00001','ROLE_accounting_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00001','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','anything','00001','ROLE_admin_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','anything','00001','ROLE_admin_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00001','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','anything','00001','ROLE_reservation_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','anything','00001','ROLE_reservation_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00001','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','anything','00001','ROLE_board_page1_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','anything','00001','ROLE_board_page2_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','anything','00001','ROLE_board_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','anything','00001','ROLE_reservation_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','anything','00001','ROLE_patient_page3_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','anything','00001','ROLE_human_resources_page4_anything');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00002','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','readWrite','00002','ROLE_patient_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','readWrite','00002','ROLE_patient_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00002','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','readWrite','00002','ROLE_human_resources_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','readWrite','00002','ROLE_human_resources_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','readWrite','00002','ROLE_human_resources_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00002','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','readWrite','00002','ROLE_inventory_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','readWrite','00002','ROLE_inventory_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','readWrite','00002','ROLE_inventory_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00002','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','readWrite','00002','ROLE_accounting_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','readWrite','00002','ROLE_accounting_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00002','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','readWrite','00002','ROLE_admin_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','readWrite','00002','ROLE_admin_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00002','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','readWrite','00002','ROLE_reservation_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','readWrite','00002','ROLE_reservation_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00002','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','readWrite','00002','ROLE_board_page1_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','readWrite','00002','ROLE_board_page2_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','readWrite','00002','ROLE_board_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','readWrite','00002','ROLE_reservation_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','readWrite','00002','ROLE_patient_page3_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','readWrite','00002','ROLE_human_resources_page4_readWrite');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00003','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','master','00003','ROLE_patient_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','master','00003','ROLE_patient_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00003','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','master','00003','ROLE_human_resources_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','master','00003','ROLE_human_resources_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','master','00003','ROLE_human_resources_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00003','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','master','00003','ROLE_inventory_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','master','00003','ROLE_inventory_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','master','00003','ROLE_inventory_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00003','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','master','00003','ROLE_accounting_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','master','00003','ROLE_accounting_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00003','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','master','00003','ROLE_admin_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','master','00003','ROLE_admin_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00003','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','master','00003','ROLE_reservation_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','master','00003','ROLE_reservation_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00003','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','master','00003','ROLE_board_page1_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','master','00003','ROLE_board_page2_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','master','00003','ROLE_board_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','master','00003','ROLE_reservation_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','master','00003','ROLE_patient_page3_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','master','00003','ROLE_human_resources_page4_master');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page','view','00004','ROLE_patient_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page1','readOnly','00004','ROLE_patient_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page2','readOnly','00004','ROLE_patient_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page','view','00004','ROLE_human_resources_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page1','readOnly','00004','ROLE_human_resources_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page2','readOnly','00004','ROLE_human_resources_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page3','readOnly','00004','ROLE_human_resources_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page','view','00004','ROLE_inventory_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page1','readOnly','00004','ROLE_inventory_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page2','readOnly','00004','ROLE_inventory_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('inventory_page3','readOnly','00004','ROLE_inventory_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page','view','00004','ROLE_accounting_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page1','readOnly','00004','ROLE_accounting_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('accounting_page2','readOnly','00004','ROLE_accounting_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page','view','00004','ROLE_admin_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page1','readOnly','00004','ROLE_admin_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('admin_page2','readOnly','00004','ROLE_admin_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page','view','00004','ROLE_reservation_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page1','readOnly','00004','ROLE_reservation_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page2','readOnly','00004','ROLE_reservation_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page','view','00004','ROLE_board_page_view');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page1','readOnly','00004','ROLE_board_page1_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page2','readOnly','00004','ROLE_board_page2_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('board_page3','readOnly','00004','ROLE_board_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('reservation_page3','readOnly','00004','ROLE_reservation_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('patient_page3','readOnly','00004','ROLE_patient_page3_readOnly');
Insert into ROLE_COMPARISON (C_REFERENCE,C_AUTHORITY_NAME,C_ID,C_AUTHORITY) values 
('human_resources_page4','readOnly','00004','ROLE_human_resources_page4_readOnly');

delete ROLE_COMPARISON where C_ID = '00006';
delete ROLE_COMPARISON where C_ID = '00007';






Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'a','a','a','a','a','a',to_date('16/06/11','RR/MM/DD'),to_date('16/06/11','RR/MM/DD'),null);
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'admin','admin','admin','admin','admin','admin',to_date('16/06/11','RR/MM/DD'),to_date
('16/06/11','RR/MM/DD'),null);
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00001','00001','코디네이터','정다운','010-4214-1244','경영지원부',to_date
('16/06/12','RR/MM/DD'),to_date('16/06/12','RR/MM/DD'),'wjdekdns@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00002','00002','코디네이터','최준호','010-2431-2342','진료부서',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'chlwnsgh@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00003','00003','병원장','정지훈','010-4563-2363','원무부서',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'wjdwlgns@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00004','00004','의사','정선환','010-1243-3242','경영지원부',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'wjdtjsghks@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00005','00005','의사','박종훈','010-1341-1241','진료부서',to_date('16/06/14','RR/MM/DD'),to_date
('16/06/14','RR/MM/DD'),null);
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00006','00006','간호사','신정은','010-3453-1231','진료부서',to_date('16/06/14','RR/MM/DD'),to_date
('16/06/14','RR/MM/DD'),null);
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00007','00007','간호사','윤이나','010-4354-4645','진료부서',to_date('16/06/14','RR/MM/DD'),to_date
('16/06/14','RR/MM/DD'),null);
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00008','00008','간호사','송중기','010-4343-2222','진료부서',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'song@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00009','00009','인사담당','문정혁','010-1615-4123','경영지원부',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'eric@google.co.kr');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00010','00010','회계담당','서현진','010-5143-1234','경영지원부',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'ohhe@hanmail.net');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00011','00011','게스트','전혜빈','032-5345-5214','게스트',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'ohhe2@hanmail.net');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00012','00012','경영지원','강소라','032-327-9999','경영지원부',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'skyg@hanmail.net');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00013','00013','코디네이터','박보검','010-7384-4852','원무부서',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'bbk@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00014','00014','게스트','박보영','010-1111-4321','게스트',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'boyoung2@naver.com');
Insert into USER_MEMBER (U_NUM,U_ID,U_PWD,U_POSITION,U_NAME,U_PHONE,U_TEAM,U_JOINDATE,U_MODIFYDATE,U_EMAIL) values 
(user_member_sequence.nextval,'00015','00015','의사','성시경','010-4321-5125','진료부서',to_date('16/06/12','RR/MM/DD'),to_date
('16/06/12','RR/MM/DD'),'goodnight@google.co.kr');

Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('admin','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('a','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00003','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00001','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00002','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00004','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00006','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00005','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00008','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00009','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00010','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00011','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00012','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00013','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00014','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00015','ROLE_general');
Insert into SECURITY_ROLE (R_ID,R_AUTHORITY) values ('00007','ROLE_general');

Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','06','16','11','38','51');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','06','16','11','38','54');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','06','16','11','39','23');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','06','16','11','39','26');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','01',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','02',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','03',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','04',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','05',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','06',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','09',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','10',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','10',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','11',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','12',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','13',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','14',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','15',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','09',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','06',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','16',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','17',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','18',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','19',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','20',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','21',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','22',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','23',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','24',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','25',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','26',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','27',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','28',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','29',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','30',null,null,null);



Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00001','휴가','2016-06-01','2016-06-10');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00002','병가','2016-06-10','2016-06-15');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00003','경조사','2016-06-07','2016-06-09');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values (emp_absence_list_seq.nextval,'00004','파견(출
장)','2016-06-06','2016-06-08');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00005','휴가','2016-06-16','2016-06-30');

commit;





Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','02','09','25','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','02','15','10','22');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','03','09','47','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','03','16','46','39');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','04','10','56','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','04','18','32','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','05','08','37','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','05','17','35','20');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','06','08','04','24');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','06','16','54','35');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','09','09','40','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','09','18','52','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','10','11','10','49');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','10','19','25','38');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','11','09','47','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','11','17','55','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','12','09','27','53');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','12','16','32','37');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','13','09','12','04');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','13','16','55','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','16','11','12','52');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','16','17','15','59');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','17','11','05','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','17','18','33','43');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','18','11','07','41');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','18','20','35','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','19','09','09','28');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','19','20','33','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','20','11','03','01');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','20','17','16','47');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','23','10','57','06');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','23','16','51','11');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','24','08','15','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','24','18','53','34');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','25','10','22','55');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','25','17','16','45');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','26','08','10','03');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','26','19','02','17');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','27','09','52','27');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','27','16','34','57');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','30','11','53','25');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','30','15','59','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','출
근','2016','05','31','09','44','15');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','퇴
근','2016','05','31','19','33','18');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','출
근','2016','06','16','11','38','51');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','퇴
근','2016','06','16','11','38','54');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','출
근','2016','06','16','11','39','23');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','퇴
근','2016','06','16','11','39','26');
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','01',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','02',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','03',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','04',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','05',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','06',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','09',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00001','휴
가','2016','06','10',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','10',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','11',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','12',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','13',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','14',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00002','병
가','2016','06','15',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00003','경
조사','2016','06','09',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','06',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','07',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00004','파
견(출장)','2016','06','08',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','16',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','17',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','18',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','19',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','20',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','21',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','22',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','23',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','24',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','25',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','26',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','27',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','28',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','29',null,null,null);
Insert into COMMUTE_MANAGEMENT (COMMUTE_NUM,EMP_NUM,STATUS,YEAR,MONTH,DAY,HOUR,MINUTE,SECOND) values (commute_seq.nextval,'00005','휴
가','2016','06','30',null,null,null);



Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00001','휴가','2016-06-01','2016-06-10');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00002','병가','2016-06-10','2016-06-15');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00003','경조사','2016-06-07','2016-06-09');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values (emp_absence_list_seq.nextval,'00004','파견(출
장)','2016-06-06','2016-06-08');
Insert into EMP_ABSENCE_LIST (EMP_ABSENCE_LIST_CODE,EMP_NUM,STATUS,START_DATE,END_DATE) values 
(emp_absence_list_seq.nextval,'00005','휴가','2016-06-16','2016-06-30');




