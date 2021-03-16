
class Appointment {
  int id;
  String lastName;
  String firstName;
  String dob;
  String mrn;
  String date;
  String time;
  String clinician;
  String lastSaved;
  List<Medication> medications;

  Appointment({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.dob,
    required this.mrn,
    required this.date,
    required this.time,
    required this.clinician,
    required this.lastSaved,
    required this.medications,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {

    var meds = json['medications'] as List;
    List<Medication> medications = meds.map((i) => Medication.fromJson(i)).toList();

    return Appointment(
      id: json['id'] as int,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      dob: json['dob'] as String,
      mrn: json['mrn'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      clinician: json['clinician'] as String,
      lastSaved: json['lastSaved'] as String,
      medications: medications,
    );
  }
}

class Medication {
  String name;
  String firstFill;
  String copay;
  String days;

  Medication({
    required this.name,
    required this.firstFill,
    required this.copay,
    required this.days,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      name: json['name'] as String,
      firstFill: json['firstFill'] as String,
      copay: json['copay'] as String,
      days: json['days'] as String,
    );
  }
}
