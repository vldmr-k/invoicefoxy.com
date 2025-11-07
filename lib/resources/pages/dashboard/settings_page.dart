import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/events/logout_event.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/company_switcher_page.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/safearea_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SettingsPage extends NyStatefulWidget {

  static RouteView path = ("/settings", (_) => SettingsPage());
  
  SettingsPage({super.key}) : super(child: () => _SettingsPageState());
}

class _SettingsPageState extends NyPage<SettingsPage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Button.rounded(
            text: "Logout",
            onPressed: () async {
              event<LogoutEvent>();
            },
          ),
          Button.rounded(
            text: "Switch Company",
            onPressed: () async {
              routeTo(CompanySwitcherPage.path);
            },
          ),
        ],
      ),
    );
  }
}
