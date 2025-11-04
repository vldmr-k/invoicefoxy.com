import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/app/networking/customer_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import '/config/keys.dart';

class CustomerController extends Controller {

  String companyId = "";
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
    
  }

  CustomerController(): super() {
    this.companyId = Keys.companySelected.fromBackpack();
  }

  all({int page = 1}) async {
    printDebug("this.companyId ${this.companyId}");
    return await api<CustomerApiService>(
        (request) => request.all(this.companyId, page: page)
    ).then((value) {
      return value.items.map((e) => Customer.fromRecord(e)).toList();
    });
  }


  create(Customer customer) async {
    return await api<CustomerApiService>(
        (request) => request.create(this.companyId, customer)
    );
  }

} 
