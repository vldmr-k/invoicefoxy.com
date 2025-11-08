import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:invoicefoxy_all/app/networking/item_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import '/config/keys.dart';

class ItemsController extends Controller {

  String companyID = Keys.companySelected.fromBackpack();
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  void init() async {
    this.companyID = Keys.companySelected.fromBackpack();
    printDebug("companyID $companyID");
  }

  Future<List> all({int page = 1, String sort = '-created'}) async {
    return await api<ItemApiService>(
        (request) => request.all(page: page)
    ).then((value) {
      return value.map((e) => Item.fromJson(e)).toList();
    });
  }

  Future<Item?> create(Map<String, dynamic> item) async {
    try {
      return await api<ItemApiService>(
            (request) => request.create(this.companyID, Item.fromJson(item))
        ).then((value) {
          return Item.fromJson(value);
        });
    } catch (e) {
      showToastOops(description: "Error creating item");
      rethrow;
    }
  }

  Future<Item?> update(String id, dynamic item) async {
    try {
      return await api<ItemApiService>(
          (request) => request.update(id, Item.fromJson(item))
      ).then((value) {
        return Item.fromJson(value);
      });
    } catch (e) {
      showToastOops(description: e.toString());
    }
  }

  Future<void> delete(String id) async {
    try {
      await api<ItemApiService>(
          (request) => request.archive(id)
      );
    } catch (e) {
      showToastOops(description: e.toString());
    }
  }
}