import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/dashboard/invoice_controller.dart';
import 'package:invoicefoxy_all/app/forms/invoice_form.dart';
import 'package:invoicefoxy_all/app/models/invoice.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class InvoicesTab extends StatefulWidget {
  
  const InvoicesTab({super.key});

  @override
  createState() => _InvoicesTabState();
}

class _InvoicesTabState extends NyState<InvoicesTab> {
  InvoiceForm invoice = InvoiceForm();
  InvoiceController controller = new InvoiceController();

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoices", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
      body: SafeAreaWidget(
          
          child: Container(
            child: Column(
              children: [
                Button.gradientFoxy(
                    text: "Create Invoice",
                    onPressed: () {
                      showToastInfo(description: "Add a new invoice");
                    },
                  ),
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
