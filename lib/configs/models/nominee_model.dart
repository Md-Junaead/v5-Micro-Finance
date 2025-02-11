class Nominee {
  final int id;
  final String name;
  final String email;
  final String cellNo;
  final String dob; // Date stored in "YYYY-MM-DD" format
  final String relationship;

  Nominee({
    required this.id,
    required this.name,
    required this.email,
    required this.cellNo,
    required this.dob,
    required this.relationship,
  });

  // Factory method to create a Nominee object from JSON
  factory Nominee.fromJson(Map<String, dynamic> json) {
    return Nominee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cellNo: json['cellNo'],
      dob: json['dob'].split(' ')[0], // Extract only date
      relationship: json['relationship'],
    );
  }
}
