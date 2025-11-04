import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class CustomerApiService extends NyApiService {
  CustomerApiService({BuildContext? buildContext}) : super(buildContext);

  Future<ResultList<RecordModel>> all(String companyId, {
    String filter = '', 
    int page = 1,
    int perPage = 30,
    String sort = "-created",
    }) async {
    String _companyFilter = 'company="${companyId}"';
    printDebug(_companyFilter);
    return await OwnPocketBase.instance.collection(Customer.key).getList(
      filter: filter.isNotEmpty ? "${filter} && ${_companyFilter}" : _companyFilter,
      sort: sort,
      page: page,
      perPage: perPage,
    );
  }

  Future<Customer> find(String companyId, String id) async {
    return await OwnPocketBase.instance.collection(Customer.key).getOne(id)
    .then((value) => Customer.fromRecord(value));
  }

  Future<Customer> create(String companyId, Customer customer) async {
    return await OwnPocketBase.instance.collection(Customer.key).create(
      body: {...customer.toJson(), "company": companyId},
    )
    .then((value) => Customer.fromRecord(value));
  }

  Future<Customer> update(String customerId, Customer customer) async {
    return await OwnPocketBase.instance.collection(Customer.key).update(
      customerId,
      body: customer.toJson(),
    )
    .then((value) => Customer.fromRecord(value));
  }
}
