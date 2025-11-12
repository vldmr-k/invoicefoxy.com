import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../../../app/controllers/dashboard/document_controller.dart';

class DocumentPreviewPage extends NyStatefulWidget<DocumentController> {
  static RouteView path = ("/document-preview/{invoiceID}", (_) => DocumentPreviewPage());

  DocumentPreviewPage({super.key}) : super(child: () => _DocumentPreviewPageState());
}

class _DocumentPreviewPageState extends NyPage<DocumentPreviewPage> {

  /// [DocumentController] controller
  DocumentController get controller => widget.controller;

  String? documentID;
  Document? document;

 @override
  get init => () {
    String? invoiceID = widget.queryParameters(key: 'documentID');
    if (invoiceID == null || invoiceID.isEmpty) {
      showToastSorry(description: "Invoice ID is empty or not found");
      pop();
      return;
    }

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
