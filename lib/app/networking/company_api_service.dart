import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CompanyApiService extends NyApiService {
  CompanyApiService({BuildContext? buildContext}) : super(buildContext);

  Future all({int page = 1}) async {
    return await Supabase.instance.client.from(Company.key).select("*, company_members(role)");
  }

  Future find(String id) async {
    return await  Supabase.instance.client.from(Company.key)
      .select()
      .eq('id', id)
      .maybeSingle();
  }

  Future create(dynamic company) async {
    return await Supabase.instance.client.from(Company.key).insert(company).select().maybeSingle();
  }

  Future update(String companyID, dynamic company) async {
    return await Supabase.instance.client.from(Company.key)
    .update(company)
    .eq('id', companyID)
    .select().maybeSingle();
  }
}
