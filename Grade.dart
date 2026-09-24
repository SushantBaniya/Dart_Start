import 'dart:io'; 
import 'dart:math';

class Grade_Management{
  String? studentName;
  final List<String> subjects = ['Math', 'Science', 'English', 'History', 'Art'];
  final double passingGrade = 60.0;
  double averageGrade= 0.0;

  String getStudentName() {
    stdout.write('Enter student name: ');
    studentName = stdin.readLineSync()!;
    return studentName!;
  }
  
  void grade(){
    for(var subject in subjects){
      stdout.write('Enter grade for $subject: ');
      double grade = double.parse(stdin.readLineSync()!);
      if (grade < passingGrade) {
        print('$studentName has failed in $subject with a grade of $grade.');
      } else {
        print('$studentName has passed in $subject with a grade of $grade.');
      }
      averageGrade = (averageGrade + grade) / subjects.length;
    }
    print('$studentName has an average grade of $averageGrade.');
  }
}

void main() {
  Grade_Management gradeManagement = Grade_Management();
  gradeManagement.getStudentName();
  gradeManagement.grade();
}