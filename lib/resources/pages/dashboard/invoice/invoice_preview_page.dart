import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/invoice/invoice_preview_controller.dart';

class InvoicePreviewPage extends NyStatefulWidget<InvoicePreviewController> {
  static RouteView path = ("/invoice-preview", (_) => InvoicePreviewPage());

  InvoicePreviewPage({super.key}) : super(child: () => _InvoicePreviewPageState());
}

class _InvoicePreviewPageState extends NyPage<InvoicePreviewPage> {

  /// [InvoicePreviewController] controller
  InvoicePreviewController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Preview")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
