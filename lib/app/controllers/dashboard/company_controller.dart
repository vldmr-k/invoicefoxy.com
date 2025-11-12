import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/networking/company_api_service.dart';
import 'package:invoicefoxy_all/bootstrap/extensions.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/dashboard_navigation_hub.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class CompanyController extends Controller {
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  Future<List> all({int page = 1, String sort = '-created'}) async {
    return await api<CompanyApiService>(
        (request) => request.all(page: page)
    ).then((value) {
      return value.map((e) => Company.fromJson(e)).toList();
    });
  }

  Future<Company?> find(String id) async {
    return await api<CompanyApiService>(
        (request) => request.find(id)
        .then((value) => Company.fromJson(value))
    );
  }

  onCompanySelected(Company company) async {
    this.context!.currentCompanyID = company.id;
    routeTo(DashboardNavigationHub.path, navigationType:  NavigationType.pushReplace);
  }

} 
