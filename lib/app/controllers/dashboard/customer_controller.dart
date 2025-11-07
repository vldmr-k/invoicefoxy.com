import 'dart:math';

import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/app/networking/customer_api_service.dart';
import 'package:invoicefoxy_all/config/keys.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class CustomerController extends Controller {
  String companyID = Keys.companySelected.fromBackpack();

  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  void init() async {}

  Future all({int page = 1}) async {
    return await api<CustomerApiService>(
        (request) => request.all(this.companyID, page: page)).then((value) {
      return value.map((e) => Customer.fromJson(e)).toList();
    });
  }

  Future<Customer?> create(dynamic customer) async {
    try {
      final value = await api<CustomerApiService>(
        (request) => request.create(companyID, customer),
      );
      return Customer.fromJson(value);
    } catch (err) {

      if (err is PostgrestException) {
        showToastSorry(description: err.message);
      } else {
        showToastSorry(description: err.toString());
      }
      return null;
    }
  }
}