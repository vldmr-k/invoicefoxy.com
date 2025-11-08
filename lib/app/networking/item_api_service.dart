import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ItemApiService extends NyApiService {
  ItemApiService({BuildContext? buildContext}) : super(buildContext);

  Future all({int page = 1, SortOption order = const SortOption("created_at", false)}) async {
    final (from, to) = Pagination.range(page, 30);
    return await Supabase.instance.client.from(Item.key).select()
      .isFilter('deleted_at', null)
      .order(order.column, ascending: order.ascending)
      .range(from, to);
  }

  Future find(String id) async {
    return await Supabase.instance.client.from(Item.key)
      .select().eq("id", id)
      .isFilter('deleted_at', null)
      .maybeSingle();
  }

  Future create(String companyID, Item item) async {
    return await Supabase.instance.client.from(Item.key).insert(
      {...item.toJson()..remove("id"), "company_id": companyID},
    ).select().maybeSingle();
  }

  Future update(String id, Item item) async {
    dynamic data =  {...item.toJson()..remove("id")};
    return await Supabase.instance.client.from(Item.key).update(data)
      .eq("id", id)
      .select()
      .maybeSingle();
  }

  Future archive(String id) async {
    return await Supabase.instance.client.from(Item.key).update({
      "deleted_at": DateTime.now().toUtc(),
    }).eq("id", id);
  }
}
