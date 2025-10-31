import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';

class OrganizationServiceApiService extends NyApiService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  OrganizationServiceApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders) 

  
}
