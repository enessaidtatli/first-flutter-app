class Students{
  String firstName;
  String lastName;
  int grade;
  String _status;

  Students(String firstName, String lastName, int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._status = "";
  }
  String get getfirstName{
    return "OGR - " + this.firstName;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }

}
