import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_authentication/model_service/model_service.dart';
import 'package:mobile_authentication/models/user_location.dart';

class AppUser implements ModelService {
  String _collectionName = "AppUser";
  String? userUID;
  String? name;
  String? phone;
  String? email;
  UserLocation? location;
  bool? emailVerified;
  DateTime timestamp;

  AppUser({
    this.userUID,
    this.name,
    this.phone,
    this.email,
    this.location,
    this.emailVerified,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  ModelService fromDocumentSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    String? userUID = snapshot.data()?['userUID'];
    String? name = snapshot.data()?['name'];
    String? phone = snapshot.data()?['phone'];
    String? email = snapshot.data()?['email'];
    bool? emailVerified = snapshot.data()?['emailVerified'];
    UserLocation? location = snapshot.data()?['location'];
    DateTime timestamp = snapshot.data()?['timestamp'].toDate();

    return AppUser(
        userUID: userUID,
        name: name,
        phone: phone,
        email: email,
        location: location,
        emailVerified: emailVerified,
        timestamp: timestamp);
  }

  @override
  AppUser.fromMap(Map<String, dynamic> user)
      : userUID = user['userUID'],
        name = user["name"],
        phone = user["phone"],
        email = user["email"],
        emailVerified = user["emailVerified"],
        timestamp = user["timestamp"];

  @override
  Map<String, dynamic> toMap() => {
        "userUID": userUID,
        "name": name,
        "phone": phone,
        "email": email,
        "location": location != null ? location!.toJson() : null,
        "emailVerified": emailVerified,
        "timestamp": Timestamp.fromDate(timestamp).toDate(),
      };

  @override
  ModelService fromMap(Map<String, dynamic> mapData) {
    String? userUID = mapData["userUID"];
    String? name = mapData["name"];
    String? phone = mapData["phone"];
    String? email = mapData["email"];
    UserLocation? location = mapData["location"];
    bool? emailVerified = mapData["emailVerified"];
    DateTime? timestamp = mapData["timestamp"];

    return AppUser(
        userUID: userUID,
        name: name,
        phone: phone,
        email: email,
        location: location,
        emailVerified: emailVerified,
        timestamp: timestamp);
  }

  @override
  String collectionName() {
    return _collectionName;
    throw UnimplementedError();
  }

  @override
  String? uid() {
    return userUID;

    throw UnimplementedError();
  }
}
