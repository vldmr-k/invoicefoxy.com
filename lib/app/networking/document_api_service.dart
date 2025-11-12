import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DocuemntApiService extends NyApiService {

  DocuemntApiService({BuildContext? buildContext}) : super(buildContext);

  Future all({int page = 1, SortOption order = const SortOption("created_at", false)}) async {
    final (from, to) = Pagination.range(page, 30);
    return await Supabase.instance.client.from(Document.key).select()
      .isFilter('deleted_at', null)
      .order(order.column, ascending: order.ascending)
      .range(from, to);
  }

  Future find(String id) async {
    return await Supabase.instance.client.from(Document.key).select()
      .isFilter('deleted_at', null)
      .eq('id', id)
      .maybeSingle();
  }

  Future create(String companyId, Document document) async {
    dynamic data = {...document.toJson(), "company": companyId};
    return await Supabase.instance.client.from(Document.key).insert(
      data,
    ).select().maybeSingle();
  }

  Future update(String id, Document document) async {
    return await Supabase.instance.client.from(Document.key).update(
      document.toJson(),
    ).then((value) => Document.fromJson(value));
  }

  Future archive(String id, Document document) async {
    return await Supabase.instance.client.from(Document.key).delete()
      .eq("id", id);
  }
}
