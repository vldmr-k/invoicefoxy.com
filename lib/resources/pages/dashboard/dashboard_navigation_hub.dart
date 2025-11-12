import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/resources/widgets/dashboard/dashboard_navigation_hub/customers_tab_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/dashboard/dashboard_navigation_hub/documents_tab_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/dashboard/dashboard_navigation_hub/tools_tab_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/dashboard/dashboard_navigation_hub/reports_tab_widget.dart';

import 'package:nylo_framework/nylo_framework.dart';

class DashboardNavigationHub extends NyStatefulWidget with BottomNavPageControls {
  static RouteView path = ("/main", (_) => DashboardNavigationHub());
  
  DashboardNavigationHub()
      : super(
            child: () => _DashboardNavigationHubState(),
            stateName: path.stateName());

  /// State actions
  static NavigationHubStateActions stateActions = NavigationHubStateActions(path.stateName());
}

class _DashboardNavigationHubState extends NavigationHub<DashboardNavigationHub> {

  /// Layouts: 
  /// - [NavigationHubLayout.bottomNav] Bottom navigation
  /// - [NavigationHubLayout.topNav] Top navigation
  /// - [NavigationHubLayout.journey] Journey navigation
  NavigationHubLayout? layout = NavigationHubLayout.bottomNav(
    //backgroundColor: Colors.white,
  );

  /// Should the state be maintained
  @override
  bool get maintainState => true;

  // /// Helper to build the bottom nav widget
  // Widget bottomNavBuilder(
  //     BuildContext context, Widget body, Widget? bottomNavigationBar) {
  //   return Scaffold(
  //     body: body,
  //     bottomNavigationBar: bottomNavigationBar,
  //   );
  // }

  /// Navigation pages
  _DashboardNavigationHubState() : super(() async {
    
    /// * Creating Navigation Tabs
    /// [Navigation Tabs] 'dart run nylo_framework:main make:stateful_widget home_tab,settings_tab'
    /// [Journey States] 'dart run nylo_framework:main make:journey_widget welcome_tab,users_dob,users_info --parent=Base'
    dynamic items = {
      10: NavigationTab(
        title: "Invoices",
        page: DocumentsTab(),
        icon: Icon(Icons.document_scanner),
        activeIcon: Icon(Icons.document_scanner),
      ),
      30: NavigationTab(
         title: "Tools",
         page: ToolsTab(),
         icon: Icon(Icons.build),
         activeIcon: Icon(Icons.build),
      ),
      40: NavigationTab(
         title: "Reports",
         page: ReportsTab(),
         icon: Icon(Icons.analytics),
         activeIcon: Icon(Icons.analytics),
      ),
      // 50: NavigationTab(
      //    title: "Settings",
      //    page: SettingsPage(),
      //    icon: Icon(Icons.settings),
      //    activeIcon: Icon(Icons.settings),
      // ),
    };


    return items;
  });

  /// Handle the tap event
  @override
  onTap(int index) {
    super.onTap(index);
  }
}
