import 'package:invoicefoxy_all/app/models/invoice.dart';
import 'package:invoicefoxy_all/app/networking/invoice_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import '/config/keys.dart';

class InvoiceController extends Controller {

  String companyID = Keys.companySelected.fromBackpack();

  String userId = "";
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
    
  }

  void init() async {
    this.userId = await Auth.data()['id'];
  }

  InvoiceController(): super() {}

  Future all({int page = 1}) async {
    return await api<InvoiceApiService>(
        (request) => request.all(page: page)
    ).then((value) => value.map((e) => Invoice.fromJson(e)).toList());
  }

  create(Invoice invoice) async {
    return await api<InvoiceApiService>(
        (request) => request.create(this.companyID, invoice)  
    );
  }

  update(String id, Invoice invoice) async {
    return await api<InvoiceApiService>(
        (request) => request.update(id, invoice)  
    );
  }

} 
