import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard_controller.dart';

class DashboardPage extends NyStatefulWidget<DashboardController> {
  static RouteView path = ("/dashboard", (_) => DashboardPage());

  DashboardPage({super.key}) : super(child: () => _DashboardPageState());
}

class _DashboardPageState extends NyPage<DashboardPage> {

  /// [DashboardController] controller
  DashboardController get controller => widget.controller;

 @override
  get init => () {
  };
  
 @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
