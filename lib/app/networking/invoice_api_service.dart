import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/invoice.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class InvoiceApiService extends NyApiService {

  InvoiceApiService({BuildContext? buildContext}) : super(buildContext);

  Future all({int page = 1, SortOption order = const SortOption("created_at", false)}) async {
    final (from, to) = Pagination.range(page, 30);
    return await Supabase.instance.client.from(Invoice.key).select()
      .isFilter('deleted_at', null)
      .order(order.column, ascending: order.ascending)
      .range(from, to);
  }

  Future find(String id) async {
    return await Supabase.instance.client.from(Invoice.key).select()
      .isFilter('deleted_at', null)
      .eq('id', id)
      .maybeSingle();
  }

  Future create(String companyId, Invoice invoice) async {
    dynamic data = {...invoice.toJson(), "company": companyId};
    return await Supabase.instance.client.from(Invoice.key).insert(
      data,
    ).select().maybeSingle();
  }

  Future update(String id, Invoice invoice) async {
    return await Supabase.instance.client.from(Invoice.key).update(
      invoice.toJson(),
    ).then((value) => Invoice.fromJson(value));
  }

  Future archive(String id, Invoice invoice) async {
    return await Supabase.instance.client.from(Invoice.key).delete()
      .eq("id", id);
  }
}
