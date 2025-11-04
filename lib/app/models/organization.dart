import 'package:nylo_framework/nylo_framework.dart';

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