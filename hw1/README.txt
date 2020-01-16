1. For every student(STUDENT_ID), he has a zero to six ENROLLMENT which shows the student enrolls in which classes and projects. So the cardinality between STUDENT and ENROLLMENT is (0, 6). Each student also has a SCHEDULE(SCHEDULE_ID) which shows the ROOM he needs to go to according to his enrollment.

2. Each STUDENT can borrow 0 ~ 4 books from library. There is a bridge BORROW(BORROW_ID), connects each student and books(BOOK_ID) he borrows. So the cardinality between STUDENT and BORROW is (0, 4). All the books belong to LIBRARY, and library can get books' information through its BOOK_ID.
 
3. Each ENROLLMENT(ENROLLMENT_ID) has a FLATFEE which get get through the PAYMENT_ID. Each class and project can be assigned to multiple students which means each class and project can have multiple enrollments. Enrollment get class information through CALSSARRANGEMENT entity.

4. The entity CLASSARRANGEMENT(CLASSARRANGEMENT_ID) assigns textbooks and instructors for every class. For every class, there may be multiple instructors and multiple books. The entity SALARY(SALARY_ID) shows how much money it needs to pay to each instructor according to the instructor's class hours, project hours and specific rate.

5. The entity PROJECTARRANGEMENT(PROJECTARRANGEMENT_ID) shows the relation between enrollments, instructors and projects. Each project can have multiple instructors and can have multiple students.

6. The entity PROJECT has a foreign key MICROCONTROLLER_ID which can show the MICROCONTROLLER assigns to the project. And the cardinality between PROJECT and MICROCONTROLLER is (1, 1). Each project can have multiple groups.

7. There are at most 4 students in a group, so the cardinality between GROUP and STUDENT is (1, 4). Each GROUP assigns a TABLE(TABLE_ID). And each TABLE has a BOX(BOX_ID), each BOX has multiple PARTs(PART_ID).

8. There is a bridge ORDER(ORDER_ID) connects the SUPPLIER(SUPPLIER_ID) and PART(PART_ID). Parts can get from multiple orders and suppliers can have multiple orders.

9. Each STUDENT can has multiple RATEs(RATE_ID) to rate his CLASS, INSTRUCTOR and PROJECT. For each RATE, it can either rates a class, a project, an instructor or not. 