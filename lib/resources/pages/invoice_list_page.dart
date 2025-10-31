import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/invoice_list_controller.dart';

class InvoiceListPage extends NyStatefulWidget<InvoiceListController> {
  static RouteView path = ("/invoice-list", (_) => InvoiceListPage());

  InvoiceListPage({super.key}) : super(child: () => _InvoiceListPageState());
}

class _InvoiceListPageState extends NyPage<InvoiceListPage> {

  /// [InvoiceListController] controller
  InvoiceListController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice List")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
