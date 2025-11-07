import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/app/providers/pocketbase_provider.dart';

class ItemApiService extends NyApiService {
  ItemApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders);

  Future all({int page = 1, SortOption order = const SortOption("created_at", false)}) async {
    final (from, to) = Pagination.range(page, 30);
    return await Supabase.instance.client.from(Item.key).select()
      .order(order.column, ascending: order.ascending)
      .range(from, to);
  }

  Future find(String id) async {
    return await Supabase.instance.client.from(Item.key).select().eq("id", id).maybeSingle();
  }

  Future create(String companyID, Item item) async {
    return await Supabase.instance.client.from(Item.key).insert(
      {...item.toJson()..remove("id"), "company_id": companyID},
    ).select().maybeSingle();
  }

  Future update(String id, Item item) async {
    return await Supabase.instance.client.from(Item.key).update(
      {...item.toJson()..remove("id")}
    ).eq("id", id).select().maybeSingle();
  }
}
