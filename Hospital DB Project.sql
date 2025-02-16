create table clinic (  
    clinic_ID number (10) , clinic_name varchar2 (20) , 
    manager number(10) ,  room number (10), 
    CONSTRAINT C_PK primary key (clinic_ID) 
    );

create table patient ( 
	patient_ID number (10) , insurance_policy varchar2 (10) , gender varchar2 (5) 
    , BOD date , phone number (10) , address varchar2 (25) , 
    CONSTRAINT P_PK primary key (patient_ID) 
);

create table staff ( 
    SSN number (10) , staff_name varchar2 (10) , job_title varchar2 (25) , phone_number number (10) 
    , gender varchar2 (5) , s_address varchar2 (25) , salary number (10) , supervisor number (10) 
    , s_clinic_id number (10) 
    , CONSTRAINT S_PK primary key (SSN)  
    , CONSTRAINT S_FK 
    foreign key (s_clinic_id) REFERENCES clinic (clinic_ID) , 
    foreign key (supervisor) REFERENCES staff (SSN)  
    );

create table invoice ( 
    invoice_ID number(10) , total_amount number (10) , VAT number (10) , I_clinic_ID number (10) 
    , CONSTRAINT I_PK primary key (invoice_ID)  
    , CONSTRAINT I_FK foreign key (I_clinic_ID) REFERENCES clinic (clinic_ID)  
     
);

create table medecine ( 
    code number (10) , price number (10) , expiration_date date , quantity number (10) ,m_clinic_id number (10) 
	, CONSTRAINT M_PK PRIMARY KEY (code)  
    , CONSTRAINT M_FK FOREIGN KEY (M_clinic_ID) REFERENCES clinic (clinic_ID)  
    );

create table provideing ( 
    pr_patient_ID number (10) , pr_clinic_ID number (10) 
    , CONSTRAINT Pr_PK PRIMARY KEY (pr_patient_ID,pr_clinic_ID)  
    , CONSTRAINT Pr_FK 
    FOREIGN KEY (pr_clinic_ID) REFERENCES clinic (clinic_ID) , 
    FOREIGN KEY (pr_patient_ID) REFERENCES patient (patient_ID)  
);

create table reserve_in ( 
	r_patient_ID number (10) , r_clinic_ID number (10) 
    , CONSTRAINT r_PK PRIMARY KEY (r_patient_ID,r_clinic_ID)  
    , CONSTRAINT r_FK 
    FOREIGN KEY (r_clinic_ID) REFERENCES clinic (clinic_ID) , 
    FOREIGN KEY (r_patient_ID) REFERENCES patient (patient_ID)  
    );

create table pay ( 
    pa_patient_ID number (10) , pa_invoice_ID number (10) 
    , CONSTRAINT Pa_PK PRIMARY KEY (pa_patient_ID,pa_invoice_ID)  
    , CONSTRAINT Pa_FK 
    FOREIGN KEY (pa_invoice_ID) REFERENCES invoice (invoice_ID) , 
    FOREIGN KEY (pa_patient_ID) REFERENCES patient (patient_ID)  
);

create table generate ( 
	g_clinic_ID number (10) , g_invoice_ID number (10) 
    , CONSTRAINT g_PK PRIMARY KEY (g_clinic_ID,g_invoice_ID)  
    , CONSTRAINT g_FK 
    FOREIGN KEY (g_invoice_ID) REFERENCES invoice (invoice_ID) , 
    FOREIGN KEY (g_clinic_ID) REFERENCES clinic (clinic_ID)  
);

alter table clinic 
	add CONSTRAINT C_FK FOREIGN KEY (manager) REFERENCES staff (SSN) ;

insert into clinic (clinic_ID , clinic_name , room)
values (1001 , 'Dental' , 5);

insert into clinic (clinic_ID , clinic_name , room)
values (1002 , 'Hearing' , 6);

insert into clinic (clinic_ID , clinic_name , room)
values (1003 , 'Rural' , 9);

insert into clinic (clinic_ID , clinic_name , room)
values (1004 , 'Health' , 3);


insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id )
values (8120 , 'Wassem' , 'Manger' , 0500000 , 'M' , 'Aljama' , 30000 , 1001);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id )
values (8911 , 'Fatima' , 'Manger' , 0511111 , 'F' , 'Alnassim' , 30000 , 1002);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id )
values (8820 , 'Abdullah' , 'Manger' , 0522222 , 'M' , 'Alrwabi' , 30000 , 1003);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id )
values (8254 , 'Khaled' , 'Manger' , 05647282 , 'M' , 'Aljama' , 30000 , 1004);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8649 , 'Ahmed' , 'Doctor' , 053333 , 'M' , 'Aljama' , 19000 , 1001 , 8120);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8409 , 'Salman' , 'Doctor' , 054444 , 'M' , 'Alazizia' , 25000 , 1002 , 8911);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8321 , 'Meshal' , 'Doctor' , 055555 , 'M' , 'Alrwabi' , 20000 , 1003 , 8820);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8456 , 'Manal' , 'Nurce' , 056666 , 'F' , 'Aljama' , 15000 , 1002 , 8409);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8954 , 'Laila' , 'Doctor' , 0592874 , 'F' , 'Alrwabi' , 20000 , 1004 , 8254);

insert into staff (SSN , staff_name , job_title , phone_number , gender , s_address , salary , s_clinic_id , supervisor)
values (8977 , 'Huda' , 'Nurse' , 0589372 , 'F' , 'Alrwabi' , 20000 , 1004 , 8954);
----------------------------------------------------------------------------------
update clinic set MANAGER = 8120 
where CLINIC_ID = 1001 ;

update clinic set MANAGER = 8911 
where CLINIC_ID = 1002 ;

update clinic set MANAGER = 8820 
where CLINIC_ID = 1003 ;

update clinic set MANAGER = 8254 
where CLINIC_ID = 1004 ;
------------------------------------------------------------------------------------
insert into medecine (code , price , expiration_date , quantity , m_clinic_id )
values (5832 , 1190 , '1-JAN-2027', 7 , 1003 ); 

insert into medecine (code , price , expiration_date , quantity , m_clinic_id )
values (5932 , 45 , '1-JAN-2028', 8 , 1001 );

insert into medecine (code , price , expiration_date , quantity , m_clinic_id )
values (5427 , 120 , '1-JAN-2026', 4 , 1002 ); 

insert into medecine (code , price , expiration_date , quantity , m_clinic_id )
values (5491 , 230 , '1-JAN-2026', 3 , 1003 ); 
-------------------------------------------------------------------------------------------
insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2001 , 6812 , 'M'  , '18-FEB-2004' , 055878743 , 'alfaiha' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2002 , 4321 , 'M'  , '4-SEP-2001' , 0565375838 , 'alsafa' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2003 , 4789 , 'F'  , '26-JUL-1985' , 0569568974 , 'alsalama' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2004 , 3216 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2005 , 3298 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2006 , 4378 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2007 , 6284 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2008 , 9824 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2009 , 1364 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

insert into patient (patient_ID , insurance_policy , gender , BOD , phone , address )
values (2010 , 4828 , 'M'  , '4-NOV-1977' , 05463753764 , 'alnaseem' ) ;

----------------------------------------------------------------------------------------

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (7245 , 1190 , 178.5 , 1003) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (7329 , 45 , 6.75 , 1001) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (7639 , 120 , 18 , 1002) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (7283 , 230 , 34.5 , 1003) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (8921 , 1183 , 230 , 1001) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (4379 , 1983 , 178 , 1004) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (9821 , 50 , 7 , 1002) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (8745 , 270 , 50 , 1003) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (9233 , 270 , 50 , 1004) ;

insert into invoice ( invoice_ID , total_amount , VAT , I_clinic_ID )
values (7825 , 270 , 50 , 1002) ;



----------------------------------------------------------------------

insert into provideing (pr_patient_ID , pr_clinic_ID ) 
values (2001,1001);

insert into provideing (pr_patient_ID , pr_clinic_ID ) 
values (2002,1002);

insert into provideing (pr_patient_ID , pr_clinic_ID ) 
values (2003,1003);

insert into provideing (pr_patient_ID , pr_clinic_ID ) 
values (2004,1003);
-------------------------------------------------------------------
insert into reserve_in (r_patient_ID , r_clinic_ID ) 
values (2001,1001);

insert into reserve_in (r_patient_ID , r_clinic_ID )
values (2002,1002);

insert into reserve_in (r_patient_ID , r_clinic_ID ) 
values (2003,1003);

insert into reserve_in (r_patient_ID , r_clinic_ID ) 
values (2004,1003);
-------------------------------------------------------------------
insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2001,7329);
insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2002,7639);
insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2003,7245);
insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2004,7283);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2005,8921);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2006,4379);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2007,9821);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2008,8745);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2009,9233);

insert into pay ( pa_patient_ID , pa_invoice_ID ) 
values (2010,7825);
-------------------------------------------------------------------
insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (7329,1001);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (7639,1002);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (7245,1003);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (7283,1003);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (8921,1001);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (4379,1004);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (9821,1002);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (8745,1003);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (9233,1004);

insert into generate ( g_invoice_ID , g_clinic_ID  ) 
values (7825,1002);

----------------------------------------------------------------------

SELECT patient.* 
FROM provideing, patient 
WHERE provideing.pr_patient_ID = patient.patient_ID 
and provideing.pr_clinic_ID = 1001;

SELECT clinic.clinic_ID, clinic.clinic_name, COUNT(staff.SSN) AS staff_count
FROM clinic, staff
WHERE clinic.clinic_ID = staff.s_clinic_id
GROUP BY clinic.clinic_ID, clinic.clinic_name;

SELECT invoice.* FROM pay
JOIN invoice ON pay.pa_invoice_ID = invoice.invoice_ID
WHERE pay.pa_patient_ID = 2001;

SELECT clinic.clinic_name, SUM(staff.salary) AS total_salary
FROM clinic
JOIN staff ON clinic.clinic_ID = staff.s_clinic_id
GROUP BY clinic.clinic_name;

SELECT r_patient_ID, COUNT(r_clinic_ID) AS clinic_count 
FROM reserve_in
GROUP BY r_patient_ID
HAVING COUNT(r_clinic_ID) > 0;

SELECT patient_ID, 
(SELECT SUM(total_amount) FROM invoice JOIN pay ON invoice.invoice_ID = pay.pa_invoice_ID WHERE pay.pa_patient_ID = patient.patient_ID) AS total_amount,
 (SELECT SUM(VAT) FROM invoice JOIN pay ON invoice.invoice_ID = pay.pa_invoice_ID WHERE pay.pa_patient_ID = patient.patient_ID) AS total_VAT
FROM patient
WHERE patient_ID = 2003;

SELECT clinic_name
FROM (
    SELECT clinic_name, COUNT(pr_patient_ID) AS total_patients
    FROM clinic
    JOIN provideing ON clinic.clinic_ID = provideing.pr_clinic_ID
    GROUP BY clinic_name
    ORDER BY total_patients DESC);

SELECT s_clinic_id, staff_name, salary FROM staff
WHERE (s_clinic_id, salary) IN (SELECT s_clinic_id, MAX(salary)
    FROM staff
    GROUP BY s_clinic_id);

SELECT supervisor, COUNT(SSN) AS num_staff
FROM staff
GROUP BY supervisor;

SELECT clinic_name, 
       (SELECT COUNT(*) FROM invoice WHERE invoice.I_clinic_ID = clinic.clinic_ID) AS total_invoices,
       (SELECT COUNT(*) FROM pay JOIN invoice ON pay.pa_invoice_ID = invoice.invoice_ID WHERE invoice.I_clinic_ID = clinic.clinic_ID) AS paid_invoices
FROM clinic;


