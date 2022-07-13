You are the administrator of the database at the town hall of your city and you want to create a database
containing all the AfterSchools in the city. For starters though, it starts with a pilot project through
which is entered in the database only one institution, its teachers and students.
The database consists of the following tables:
 -AFTERSCHOOL(ID, Denumire, NrClase)
 - GRUPA(ID, AnScolar, DenumireGrupa)
 - ELEV(ID, IdAterS, IdGrupa, Nume, DataNastere, Varsta, DataInmatriculare, NumeParinte, NrTelefon, Activ)
 - PROFESOR(ID, IdAterS, Nume, Materie, Salariu, Vechime, Activ)
 - PROFESORGRUPA(ID, IdGrupa, IdProfesor)
<br><br>
1. Write the SQL statements to perform:
a. Create the AfterSchool database
b. Creating tables in the description. Use Primary Key, Foreign Key, NULL, NOT NULL and others
constraints.
c. Inserting at least 5 lines in the TEACHER, GROUP, TEACHERGROUP tables and 50 lines in
STUDENT. You need as much information as possible so the following exercises have results.
<br><br>
2. One of the parents wants to know if there are other children born in the group in which he has his child enrolled.
in the same month with his child. He needs his parents' names and contact details because he wants to
he proposed to them to have a big birthday party together. To meet the requirement
use subquery to find out the answer. (It is assumed that you have the GDPR consent of his parents to
share this information).
<br><br>
3. The director asks you to make a report showing the following information:
a. Name of Teacher
b. Number of students
c. Group Name
D. Year (Zero - VIII)
Make the above report in a view using joins between the required tables and name
columns exactly as above.
<br><br>
4. From her own funds, the kindergarten principal decides that she can offer bonuses to the incumbent teachers
of the number of students in the class and seniority. She needs the following information:
a. Name of Teacher
b. Age
c. Number of students
d. Class
e. Bonus
The bonus is calculated as a percentage of the salary.
The percentage is calculated as follows:
- 2% for seniority under 5 years
- 5% for seniority between 6 and 15 years
- 10% for seniority between 15 and 25 years
- 12% for seniority between 26 years
Cumulated with
- 0% for less than 20 students
- 3% for more than 21 students
Perform a stored procedure that generates the above report using join between tables.
<br><br>
5. One of the parents moves his child to another institution. Performs a stored procedure that
update the student in the Student table (set them to idle) and then remove him from his class.
