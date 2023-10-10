
CREATE TABLE SYS_ADMIN(
ADMIN_ID VARCHAR(25) PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
password VARCHAR(255),
CNIC VARCHAR(13)
);

CREATE TABLE HR(
HR_ID VARCHAR(25) PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
password VARCHAR(255),
EMAIL VARCHAR(50),
PHONE_NUMBER INT,
DOB DATE,
HIRE_DATE DATE,
ADDRESS VARCHAR(50),
CNIC VARCHAR(13),
ADMIN_ID VARCHAR(25) ,
FOREIGN KEY (ADMIN_ID) REFERENCES SYS_ADMIN(ADMIN_ID)
);

CREATE TABLE DEPARTMENT (
DEPARTMENT_ID VARCHAR(25) PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(25),
ADMIN_ID VARCHAR(25) ,
FOREIGN KEY (ADMIN_ID) REFERENCES SYS_ADMIN(ADMIN_ID)
);

CREATE TABLE DESIGNATION (
DESIGNATION_ID VARCHAR(25) PRIMARY KEY,
DESIGNATION_NAME VARCHAR(25),
BASIC_SALARY FLOAT,
ALLOUNCE FLOAT,
ADMIN_ID VARCHAR(25) ,
FOREIGN KEY (ADMIN_ID) REFERENCES SYS_ADMIN(ADMIN_ID)
);

CREATE TABLE EMPLOYEE (
EMP_ID VARCHAR(25) PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
password VARCHAR(255),
EMAIL VARCHAR(50),
PHONE_NUMBER INT,
DOB DATE,
HIRE_DATE DATE,
ADDRESS VARCHAR(50),
CNIC VARCHAR(13),
HR_ID VARCHAR(25),
FOREIGN KEY (HR_ID) REFERENCES HR(HR_ID),
DEPARTMENT_ID VARCHAR(25) ,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID),
DESIGNATION_ID VARCHAR(25),
FOREIGN KEY (DESIGNATION_ID) REFERENCES DESIGNATION(DESIGNATION_ID)
);

-- insert into sys_admin(ADMIN_ID) values('a1');
-- insert into hr(HR_ID,admin_id) values("h1","a1")
-- -- insert into employee() values(


CREATE TABLE RESIGNATION(
REASON VARCHAR(1000),
APPLY_DATE DATE,
APPROVED_STATUS varchar(20),
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
CONSTRAINT RES_KEY PRIMARY KEY (EMP_ID,APPLY_DATE)
);


CREATE TABLE PROJECT (
PROJECT_ID VARCHAR(25) PRIMARY KEY,
PROJECT_NAME VARCHAR(25),
START_DATE DATE,
FNISH_STATUS BOOL,
END_DATE DATE
);

CREATE TABLE ATTENDENCE(
MARK VARCHAR (1),
MARK_DATE DATE,
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
CONSTRAINT ATT_KEY PRIMARY KEY (EMP_ID,MARK_DATE)
);


CREATE TABLE LEAVE_REQUEST(
START_DATE DATE,
END_DATE DATE,
REASON VARCHAR(100),
LEAVE_STATUS varchar(20),
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
HR_ID VARCHAR(25),
FOREIGN KEY (HR_ID) REFERENCES EMPLOYEE(HR_ID),
CONSTRAINT LEAVE_KEY PRIMARY KEY (EMP_ID,START_DATE)
);

CREATE TABLE PAYROLL (
SALARY FLOAT ,
SALARY_DATE DATE,
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
HR_ID VARCHAR(25),
CONSTRAINT LEAVE_KEY PRIMARY KEY (EMP_ID,HR_ID,SALARY_DATE),
FOREIGN KEY (HR_ID) REFERENCES EMPLOYEE(HR_ID)
);

CREATE TABLE WORK_ON (
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
PROJECT_ID VARCHAR(25) ,
FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT(PROJECT_ID),
CONSTRAINT WORK_KEY PRIMARY KEY(EMP_ID,PROJECT_ID),
WORKING_HOUR INT
);


CREATE TABLE DEPARTMENT_MANGER(
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
DEPARTMENT_ID VARCHAR(25) ,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID),
START_DATE DATE,
CONSTRAINT MNG_KEY PRIMARY KEY (EMP_ID,DEPARTMENT_ID) 
);

CREATE TABLE EMAIL_MSG (
EMP_ID VARCHAR(25) ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
EMP_EMAIL VARCHAR(25) ,
HR_EMAIL VARCHAR(25) ,
SEND_DATE DATE,
MESSAGE VARCHAR(300) 
);
