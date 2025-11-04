import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/events/logout_event.dart';
import 'package:invoicefoxy_all/resources/pages/onboarding_company_navigation_hub.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard_controller.dart';
import '/resources/widgets/buttons/buttons.dart';

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
         child: Container(
          child: Column(
            children: [
              Text("Welcome to InvoiceFoxy"),
              Button.primary(text: "Logout", onPressed: () =>  event<LogoutEvent>()),
              Button.primary(text: "Onboarding Company", onPressed: ()  {
                routeTo(OnboardingCompanyNavigationHub.path);
              }),
            ],
          ),
         ),
      ),
    );
  }
}
