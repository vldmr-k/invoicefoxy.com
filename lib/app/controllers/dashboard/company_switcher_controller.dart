import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/networking/company_api_service.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/dashboard_navigation_hub.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:invoicefoxy_all/config/keys.dart';

class CompanySwitcherController extends Controller {
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  all({int page = 1}) async {
    return await api<CompanyApiService>(
        (request) => request.all(page: page)
    ).then((value) {
      return value.items.map((e) => Company.fromRecord(e)).toList();
    });
  }

  onCompanySelected(Company company) async {
    printDebug('onCompanySelected: ${company.id}');
    await Keys.companySelected.save(company.id);
    routeTo(DashboardNavigationHub.path, navigationType:  NavigationType.pushReplace);
  }

} 
