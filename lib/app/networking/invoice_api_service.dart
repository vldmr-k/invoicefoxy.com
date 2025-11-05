import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/invoice.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class InvoiceApiService extends NyApiService {
  InvoiceApiService({BuildContext? buildContext}) : super(buildContext);


  Future<ResultList<RecordModel>> all(String companyId, {
    String filter = '', 
    int page = 1,
    int perPage = 30,
    String sort = "-created",
    }) async {
    String _companyFilter = 'company="${companyId}"';
    printDebug(_companyFilter);
    return await OwnPocketBase.instance.collection(Invoice.key).getList(
      filter: filter.isNotEmpty ? "${filter} && ${_companyFilter}" : _companyFilter,
      sort: sort,
      page: page,
      perPage: perPage,
    );
  }

  Future<Invoice> find(String invoiceId) async {
    return await OwnPocketBase.instance.collection(Invoice.key).getOne(invoiceId)
      .then((record) => Invoice.fromJson(record.toJson()));
  }

  Future<Invoice> create(String companyId, String createdBy, Invoice invoice) async {
    dynamic data = {...invoice.toJson(), "createdby": createdBy, "company": companyId};
    return await OwnPocketBase.instance.collection(Invoice.key).create(
      body: data
    ).then((value) => Invoice.fromRecord(value));
  }

  Future<Invoice> update(String id, Invoice invoice) async {
    return await OwnPocketBase.instance.collection(Invoice.key).update(
      id,
      body: invoice.toJson()
    ).then((value) => Invoice.fromRecord(value));
  }
}
