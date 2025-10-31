import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_converter/firestore_converter.dart';
import 'package:nylo_framework/nylo_framework.dart';

@FirestoreConverter(defaultPath: "organizations")
class Organization extends Model {
  static StorageKey key = "organizations";

  String? name;
  String? email;
  String? phone;
  String? address;


  Organization({
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  
  // factory Organization.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // ) {
  //   final data = snapshot.data();
  //   return Organization(
  //     name: data?['name'],
  //     email: data?['email'],
  //     phone: data?['phone'],
  //     address: data?['address'],
  //   );
  // }

  // Map<String, dynamic> toFirestore() {
  //   return {
  //     if (name != null) "name": name,
  //     if (email != null) "email": email,
  //     if (phone != null) "phone": phone,
  //     if (address != null) "address": address,
  //   };
  // }

  Organization.fromJson(dynamic data) {
    name = data?['name'];
    email = data?['email'];
    phone = data?['phone'];
    address = data?['address'];
  }

  @override
  toJson() => {"name": name, "email": email, "phone": phone, "address": address};

  
}



// https://firebase.google.com/docs/firestore/query-data/get-data
// state: data?['state'],
//       country: data?['country'],
//       capital: data?['capital'],
//       population: data?['population'],
//       regions:
//           data?['regions'] is Iterable ? List.from(data?['regions']) : null,