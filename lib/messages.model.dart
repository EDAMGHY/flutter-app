class Message {
  int id;
  int contactID;
  DateTime dateTime;
  String type;
  String message;
  bool selected = false;
  Message({this.id, this.contactID, this.dateTime, this.type, this.message});
  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        contactID = json['contactID'],
        dateTime = DateTime.parse(json['date']),
        type = json['type'],
        message = json['message'];
  Map toJson() => {
        'id': id,
        'contactID': contactID,
        'message': message,
        'type': type,
        'date': dateTime.toString()
      };
}
