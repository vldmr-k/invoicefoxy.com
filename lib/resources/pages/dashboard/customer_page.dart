import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/customer_controller.dart';

class CustomerPage extends NyStatefulWidget<CustomerController> {
  static RouteView path = ("/customer", (_) => CustomerPage());

  CustomerPage({super.key}) : super(child: () => _CustomerPageState());
}

class _CustomerPageState extends NyPage<CustomerPage> {

  /// [CustomerController] controller
  CustomerController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
