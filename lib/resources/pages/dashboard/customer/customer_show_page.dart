import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/customer_controller.dart';

class CustomerShowPage extends NyStatefulWidget<CustomerController> {
  static RouteView path = ("/customer/{customerID}", (_) => CustomerShowPage());

  CustomerShowPage({super.key}) : super(child: () => _CustomerShowPageState());
}

class _CustomerShowPageState extends NyPage<CustomerShowPage> {
  /// [CustomerController] controller
  CustomerController get controller => widget.controller;

  Customer? customer;

  @override
  get init => () async {
        String? customerID = widget.queryParameters(key: 'customerID');
        if (customerID == null || customerID.isEmpty) {
          showToastSorry(description: "Customer ID is empty");
          pop();
          return;
        }

        try {
          customer = await controller.find(customerID);
        } catch (e) {
          showToastSorry(description: "Customer not found");
          pop();
          return;
        }
      };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      title: Text("Details"),
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              Text("${customer?.name}", 
                style: TextTheme.of(context).displayMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],),
            SizedBox(height: 15),
            Row(
              spacing: 5,
              children: [
              Text("Email:", style: TextTheme.of(context).titleMedium),
              Text("${customer?.email ?? ""}", style: TextTheme.of(context).titleMedium),
            ],),
            Row(
              spacing: 5,
              children: [
              Text("Phone:", style: TextTheme.of(context).titleMedium),
              Text("${customer?.phone ?? ""}", style: TextTheme.of(context).titleMedium),
            ],)
          ],
        )
      ),
    );
  }
}
