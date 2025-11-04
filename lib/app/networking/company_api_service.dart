import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/models/user.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class CompanyApiService extends NyApiService {
  CompanyApiService({BuildContext? buildContext}) : super(buildContext);

  Future<ResultList<RecordModel>> all({int page = 1}) async {
    return await OwnPocketBase.instance.collection('companies').getList(
      page: page
    );
  }

  Future<Company> find(String id) async {
    return await OwnPocketBase.instance.collection('companies').getOne(id)
    .then((value) => Company.fromRecord(value));
  }

  Future<Company> create(Company company) async {
    final user = await Auth.data();
    dynamic data = {...company.toJson(), "createdby": user['id']};
    return await OwnPocketBase.instance.collection('companies').create(
      body: data
    ).then((value) => Company.fromRecord(value));
  }

  Future<Company> update(Company company) async {
    return await OwnPocketBase.instance.collection('companies').update(
      company.id,
      body: company.toJson()
    ).then((value) => Company.fromRecord(value));
  }
}
