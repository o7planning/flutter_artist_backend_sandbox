import '../../../database.dart';

class TeacherWithOtherProps {
  final TeacherData teacher;
  final UniversityData university;
  final GenderData gender;
  final TeacherPositionData teacherPosition;

  TeacherWithOtherProps(
    this.teacher,
    this.teacherPosition,
    this.gender,
    this.university,
  );
}
