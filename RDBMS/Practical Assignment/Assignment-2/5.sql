create table book(
book_id varchar2(3) primary key,
book_name varchar2(20),
author varchar2(15),
publisher varchar2(15)
);

create table student(
student_id varchar2(3) primary key,
student_name varchar2(20),
);

create table book_issue(
book_issue_id varchar2(3),
book_id varchar2(3) references book(book_id),
issue_date date,
return_date date,
book_status varchar2(10)
);

/*
    1. Accept student name and display all books issued by student.
*/
DECLARE
    m_student_name student.student_name%type;
    CURSOR c_books(p_student_name student.student_name%type) IS
        select b.book_name from books b, student s, book_issue i 
        where s.student_id = i.student_id and i.book_id = b.book_id
        and s.student_name = 'p_student_name'
BEGIN
    m_student_name := &m_student_name;
    dbms_output.put_line('Books issued by '|| m_student_name)
    for book in c_books(m_student_name)
    loop
        dbms_output.put_line(book.book_name);
    end loop;
END;
/
    
/*
    2. Display all the students name who don't return books on return date.  
*/
    select student_name from student 
        where student_id in (
            select student_id from book_issue 
                where book_status = 'pending'
        );
/*
    3. Display all the students who don't issue book since last 3 months. 
*/
 
select student_id from book_issue 
    where issue_date <= 
        (select add_months(sysdate,-3) from dual) 
minus
select student_id from book_issue
    where issue_date between (select add_months(sysdate,-3) from dual ) 
    and (select sysdate from dual )
/*
    4. Display all the students who issue 3 books.
*/
select student_name from student
where student_id in 
    (select student_id, count(book_id) from book_issue
        group by student_id having count(student_id) = 3 );

/*
    Write a database trigger that not allow changing BookIssue table after
    the working hours ( from 8:00 am to 4:00 pm) from Monday to Saturday. 
    There is not restriction on Viewing data from a table. 
*/

create or replace trigger t_library
before insert or update on book_issue
for each row 
BEGIN
    if inserting or updating or deleting then 
        m_current_day = to_char(sysdate,'Day'); 
        if(  m_current_day = 'sunday') then 
            raise_application_error(-20111,'Book Issue is not allowed on Sunday');
        end if;
        m_current_time = to_char(sysdate,'HH');
        if (m_current_time < 8 and m_current_time > 16) then 
            raise_application_error(-20112,'Book Issue is allows only in Library Hours [8 A.M.- 4 P.M.]');
        end if;
    end if;
END;
/