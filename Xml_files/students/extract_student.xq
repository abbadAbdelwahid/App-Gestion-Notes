declare variable $cne := "21010261";

for $student in doc("Students_GINF2.xml")/Students/Student
where $student/CNE = $cne
return $student