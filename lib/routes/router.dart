import 'package:invoicefoxy_all/app/models/customer.dart';

import '/resources/pages/dashboard/company_switcher_page.dart';
import 'package:invoicefoxy_all/routes/guards/check_company_selected_route_guard.dart';

import '../resources/pages/dashboard/company_switcher_page.dart';
import '../resources/pages/onboarding_company_navigation_hub.dart';
import '../resources/pages/dashboard/dashboard_navigation_hub.dart';
import '/resources/pages/dashboard_page.dart';
import '/resources/pages/forgot_password_page.dart';

import '/resources/pages/register_page.dart';
import '/resources/pages/login_page.dart';
import '/resources/pages/not_found_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/routes/guards/auth_route_guard.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
|
| * [Tip] Add authentication 🔑
| Run the below in the terminal to add authentication to your project.
| "dart run scaffold_ui:main auth"
|
| * [Tip] Add In-app Purchases 💳
| Run the below in the terminal to add In-app Purchases to your project.
| "dart run scaffold_ui:main iap"
|
| Learn more https://nylo.dev/docs/6.x/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
  router.add(HomePage.path).initialRoute();

      // Add your routes here ...
      // router.add(NewPage.path, transitionType: TransitionType.fade());

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      // });
  
  router.add(LoginPage.path);
  router.add(RegisterPage.path);
  router.add(ForgotPasswordPage.path);

  router.add(DashboardPage.path);

  router.add(CompanySwitcherPage.path)
    .addRouteGuards([AuthRouteGuard(), CheckCompanySelectedRouteGuard()])
    .authenticatedRoute();

  router.group(() => {
    "route_guards": [AuthRouteGuard()],
    "prefix": "/dashboard"
  }, (router) {
    //navigation
    router.add(DashboardNavigationHub.path);

    //onboarding
    router.add(OnboardingCompanyNavigationHub.path);

    //pages
    // router.add(CustomerPage.path);
    
  });

  router.add(NotFoundPage.path).unknownRoute();
});
