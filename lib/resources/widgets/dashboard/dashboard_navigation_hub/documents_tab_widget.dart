import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/dashboard/invoice_controller.dart';
import 'package:invoicefoxy_all/app/forms/invoice_form.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/document/document_builder_page.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/safearea_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DocumentsTab extends StatefulWidget {
  
  const DocumentsTab({super.key});

  @override
  createState() => _InvoicesTabState();
}

class _InvoicesTabState extends NyState<DocumentsTab> {
  DocumentForm invoice = DocumentForm();
  DocumentController controller = new DocumentController();

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      title: Text("Invoices"),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            routeTo(DocumentBuilderPage.path);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          label: Text("Create Invoice"),
          icon: Icon(Icons.add),
        ),
      body: SafeAreaWidget(
          
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: _list(),
                ),
              ],
            ),
          )
      )
    );
  }

  _list() {
    return NyPullToRefresh.separated(
              child: (BuildContext context, dynamic data) {
                  return ListTile(
                      title: Text(data.number)
                  );
              },
              data: (int page) async {
                  return await controller.all(page: page);
              },
              separatorBuilder: (BuildContext context, int index) {
                  return Divider();
              },
          );
  }
}
