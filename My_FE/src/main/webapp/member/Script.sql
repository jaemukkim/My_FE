Create table mymember (
    id varchar2(50) not null primary key ,   
    password varchar2(60) not null,           
    name varchar2(20) not null, 
    address varchar2(100) not null,
    reg_date  date default sysdate not null,      
    phone varchar2 (20) not null 
   );
   
   commit;
   
   select * from mymember;
   
   
   insert into mymember values('admin', '1234', '관리자', '서울',default,'010-000-0000');