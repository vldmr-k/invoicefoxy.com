import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/dashboard/document_controller.dart';
import 'package:invoicefoxy_all/app/models/converter.dart';
import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DocumentBuilderPage extends NyStatefulWidget<DocumentController> {
  static RouteView path =
      ("/document/{documentID}", (_) => DocumentBuilderPage());

  DocumentBuilderPage({super.key})
      : super(child: () => _DocumentBuilderPageState());
}

class _DocumentBuilderPageState extends NyPage<DocumentBuilderPage> {
  /// [DocumentController] controller
  DocumentController get controller => widget.controller;

  late String documentID;
  late Document document;

  @override
  get init => () async {
        this.documentID = widget.queryParameters(key: "documentID");
        try {
          Document? doc = await controller.find(this.documentID);
          if (doc == null) {
            throw Error();
          }

          this.document = doc;
        } catch (e) {
          showToastSorry(description: "Invoice not found");
          pop();
          return;
        }
      };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(title: const Text("Invoice")),
      body: Column(
        spacing: 15,
        children: [
          DocumentHeaderWidget(
            document: this.document,
          ),
          DocumentClientWidget(document: this.document),
          DocumentItemsWidget(document: this.document)
        ],
      ),
    );
  }
}

class DocumentHeaderWidget extends StatelessWidget {
  Document document;

  DocumentHeaderWidget({required this.document});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("${document.number}"),
            Spacer(),
            Text("${document.dueType.toString()}"),
          ],
        ),
        Row(
          children: [
            Spacer(),
            Text("${document.issueDate.toFormat("d/M/y")}"),
          ],
        ),
      ],
    );
  }
}

class DocumentClientWidget extends StatelessWidget {
  Document document;

  DocumentClientWidget({required this.document});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Button.primary(
            text: "Add Client",
            width: double.infinity,
            height: 40,
            onPressed: () => {printDebug("On Pressed")},
          )
        ],
      ),
    );
  }
}

class DocumentItemsWidget extends StatelessWidget {
  Document document;

  DocumentItemsWidget({required this.document});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Button.primary(
            text: "Add Items",
            height: 40,
            onPressed: () => {printDebug("On Pressed")},
          )
        ],
      ),
    );
  }
}
