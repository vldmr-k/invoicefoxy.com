import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/settings_page.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

class ScaffoldWidget extends StatelessWidget {
  final AppBar? appBar;
  final Text? title;
  final FloatingActionButton? floatingActionButton;
  final Widget body;
  const ScaffoldWidget({super.key, this.appBar, this.title, this.floatingActionButton, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar( context),
      floatingActionButton: floatingActionButton,
      body: SafeAreaWidget(child: body),
    );
  }

  _appBar(BuildContext context) {
    if(title != null) {
      return AppBar(
        title: title, 
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              routeTo(SettingsPage.path);
            },
          ),
        ],
      );
    }
    return appBar;
  }
}
