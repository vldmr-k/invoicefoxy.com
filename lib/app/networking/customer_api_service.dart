import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerApiService extends NyApiService {
  CustomerApiService({BuildContext? buildContext}) : super(buildContext);

  Future all(String companyID, {
    String filter = '', 
    int page = 1,
    int limit = 30,
    SortOption order = const SortOption('created_at', false), // ascending = false means descending
    }) async {
    final (from, to) = Pagination.range(page, limit);
    var query =  await Supabase.instance.client.from(Customer.key)
      .select()
      .eq('company_id', companyID)
      .order(order.column, ascending: order.ascending)
      .range(from, to);

    return query;
  }

  Future find(String id) async {
    return await  Supabase.instance.client.from(Customer.key)
      .select()
      .eq('id', id)
      .maybeSingle();
  }

  Future create(String companyId, dynamic customer) async {
    return await Supabase.instance.client.from(Customer.key).insert(
      {...customer, "company_id": companyId},
    ).select().maybeSingle();
  }

  Future update(String customerId, Customer customer) async {
    return await Supabase.instance.client.from(Customer.key).update(  
       customer.toJson(),
    ).eq('id', customerId).select();
  }
}
