import 'package:invoicefoxy_all/resources/pages/dashboard/dashboard_navigation_hub.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/company_switcher_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/config/keys.dart';

/* CompanyCurrent Route Guard
|-------------------------------------------------------------------------- */

class CheckCompanySelectedRouteGuard extends NyRouteGuard {
  CheckCompanySelectedRouteGuard();

  @override
  onRequest(PageRequest pageRequest) async {
    // // Default
    String? companySelectedId = await Keys.companySelected.read();
    printDebug("Current Company id $companySelectedId");
    if (companySelectedId == null) {
      return redirect(CompanySwitcherPage.path, navigationType:  NavigationType.pushReplace);
    } else {
      return redirect(DashboardNavigationHub.path, navigationType:  NavigationType.pushReplace);
    }

    // example
    // if ((await Auth.isAuthenticated()) == false) {
    //    return redirect(HomePage.path);
    // }
    //
    // helpers
    // data = will give you access to the data passed to the route
    // context = will give you access to the BuildContext
    return pageRequest;
  }
}
