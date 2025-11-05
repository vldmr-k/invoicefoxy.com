import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class CustomerApiService extends NyApiService {
  CustomerApiService({BuildContext? buildContext}) : super(buildContext);

  Future all(String companyID, {
    String filter = '', 
    int page = 1,
    int perPage = 30,
    String sort = "-created",
    }) async {
    String _companyFilter = 'company="${companyID}"';
    printDebug(_companyFilter);
    return await OwnPocketBase.instance.collection(Customer.key).getList(
      filter: filter.isNotEmpty ? "${filter} && ${_companyFilter}" : _companyFilter,
      sort: sort,
      page: page,
      perPage: perPage,
    );
  }

  Future find(String companyId, String id) async {
    return await OwnPocketBase.instance.collection(Customer.key).getOne(id)
    .then((value) => Customer.fromRecord(value));
  }

  Future<RecordModel> create(String companyId, dynamic customer) async {
    return await OwnPocketBase.instance.collection(Customer.key).create(
      body: {...customer, "company": companyId},
    );
  }

  Future<RecordModel> update(String customerId, Customer customer) async {
    return await OwnPocketBase.instance.collection(Customer.key).update(
      customerId,
      body: customer.toJson(),
    );
  }
}
