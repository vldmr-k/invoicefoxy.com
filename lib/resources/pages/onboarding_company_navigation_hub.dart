import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/resources/widgets/company_onboarding/company_address_step_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/company_onboarding/company_name_step_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/company_onboarding/company_welcome_step_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class OnboardingCompanyNavigationHub extends NyStatefulWidget with BottomNavPageControls {
  static RouteView path = ("/onboarding_company", (_) => OnboardingCompanyNavigationHub());
  
  OnboardingCompanyNavigationHub()
      : super(
            child: () => _OnboardingCompanyNavigationHubState(),
            stateName: path.stateName());

  /// State actions
  static NavigationHubStateActions stateActions = NavigationHubStateActions(path.stateName());
}

class _OnboardingCompanyNavigationHubState extends NavigationHub<OnboardingCompanyNavigationHub> {

  /// Layouts: 
  /// - [NavigationHubLayout.bottomNav] Bottom navigation
  /// - [NavigationHubLayout.topNav] Top navigation
  /// - [NavigationHubLayout.journey] Journey navigation
  NavigationHubLayout? layout = NavigationHubLayout.journey(
    // backgroundColor: Colors.white,
  );

  /// Should the state be maintained
  @override
  bool get maintainState => true;

  /// Navigation pages
  _OnboardingCompanyNavigationHubState() : super(() async {
    /// * Creating Navigation Tabs
    /// [Navigation Tabs] 'dart run nylo_framework:main make:stateful_widget home_tab,settings_tab'
    /// [Journey States] 'dart run nylo_framework:main make:journey_widget welcome_tab,users_dob,users_info --parent=OnboardingCompany'
    return {
      0: NavigationTab.journey(
        page: CompanyWelcomeStep()
      ),
      1: NavigationTab.journey(
        page: CompanyNameStep()
      ),
      2: NavigationTab.journey(
        page: CompanyAddressStep()
      ),
    };
  });

  /// Handle the tap event
  @override
  onTap(int index) {
    super.onTap(index);
  }
}
