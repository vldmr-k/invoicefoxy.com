import 'package:invoicefoxy_all/app/controllers/dashboard/company_controller.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/bootstrap/extensions.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/dashboard_navigation_hub.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/company_switcher_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/config/keys.dart';

/* CompanyCurrent Route Guard
|-------------------------------------------------------------------------- */

class CompanySelectedRouteGuard extends NyRouteGuard {
  
  
  @override
  onRequest(PageRequest pageRequest) async {

    // // Default
    String companySelected = pageRequest.context!.currentCompanyID;
    if (companySelected.isEmpty) {
      return _handleFailback();
    }


    try {
      CompanyController controller = CompanyController();
      Company? company = await controller.find(companySelected);

      if(company == null) {
        _removeSelectedCompany(pageRequest);
        return _handleFailback();
      }
    
    } catch(e) {
      printDebug("Error $e");
      await _removeSelectedCompany(pageRequest);
      return _handleFailback();
    }

    return pageRequest;
  }

  _removeSelectedCompany(PageRequest pageRequest) {
    //await Keys.companySelected.deleteFromStorage(andFromBackpack: true);
    pageRequest.context!.removeCurrentCompanyId();
  }

  _handleFailback() {
    return redirect(CompanySwitcherPage.path, navigationType:  NavigationType.pushAndForgetAll);
  }
}
