import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/invoice/invoice_builder_controller.dart';

class InvoiceBuilderPage extends NyStatefulWidget<InvoiceBuilderController> {
  static RouteView path = ("/invoice-builder", (_) => InvoiceBuilderPage());

  InvoiceBuilderPage({super.key}) : super(child: () => _InvoiceBuilderPageState());
}

class _InvoiceBuilderPageState extends NyPage<InvoiceBuilderPage> {

  /// [InvoiceBuilderController] controller
  InvoiceBuilderController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Builder")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
