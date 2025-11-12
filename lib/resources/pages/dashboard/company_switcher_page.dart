import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/networking/company_api_service.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/dashboard/company_controller.dart';

class CompanySwitcherPage extends NyStatefulWidget<CompanyController> {
  static RouteView path = ("/company-switcher", (_) => CompanySwitcherPage());

  CompanySwitcherPage({super.key}) : super(child: () => _CompanySwitcherPageState());
}

class _CompanySwitcherPageState extends NyPage<CompanySwitcherPage> {

  /// [CompanyController] controller
  CompanyController get controller => widget.controller;

 @override
  get init => () {

  };
  
 @override
  Widget build(BuildContext context) {
  return ScaffoldWidget(
      title: Text('Select Company'),
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
