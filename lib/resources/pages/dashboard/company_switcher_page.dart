import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/networking/company_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/company_switcher_controller.dart';

class CompanySwitcherPage extends NyStatefulWidget<CompanySwitcherController> {
  static RouteView path = ("/company-switcher", (_) => CompanySwitcherPage());

  CompanySwitcherPage({super.key}) : super(child: () => _CompanySwitcherPageState());
}

class _CompanySwitcherPageState extends NyPage<CompanySwitcherPage> {

  /// [CompanySwitcherController] controller
  CompanySwitcherController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Company Switcher', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: NyPullToRefresh.separated(
              child: (BuildContext context, dynamic data) {
                  return ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.email),
                      onTap: () => controller.onCompanySelected(data),
                  );
              },
              data: (int page) async {
                  return await widget.controller.all(page: page);
              },
              separatorBuilder: (BuildContext context, int index) {
                  return Divider();
              },
          )
      )
  );
  }
}
