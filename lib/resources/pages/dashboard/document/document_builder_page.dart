import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/invoice_controller.dart';

class DocumentBuilderPage extends NyStatefulWidget<DocumentController> {
  static RouteView path = ("/document/{documentID}", (_) => DocumentBuilderPage());

  DocumentBuilderPage({super.key}) : super(child: () => _DocumentBuilderPageState());
}

class _DocumentBuilderPageState extends NyPage<DocumentBuilderPage> {

  /// [DocumentController] controller
  DocumentController get controller => widget.controller;

  String? invoideID;

  Document? document;

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
