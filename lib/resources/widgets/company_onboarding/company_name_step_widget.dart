import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/company_onboarding_controller.dart';
import 'package:invoicefoxy_all/app/forms/company/company_name_form.dart';
import '../../pages/onboarding_company_navigation_hub.dart';
import '/resources/widgets/buttons/buttons.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/company.dart';

class CompanyNameStep extends StatefulWidget {
  const CompanyNameStep({super.key});

  @override
  createState() => _CompanyNameStepState();
}

class _CompanyNameStepState extends JourneyState<CompanyNameStep> {
  _CompanyNameStepState() : super(
      navigationHubState: OnboardingCompanyNavigationHub.path.stateName());

  Company? comapny;

  CompanyOnboardingController controller = CompanyOnboardingController();

  CompanyNameForm form = CompanyNameForm();

  @override
  get init => () {
    // Your initialization logic here
  };

  @override
  Widget view(BuildContext context) {
    return buildJourneyContent(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NyForm(
             form: form,
          ),
          const SizedBox(height: 20),
          Text('This onboarding journey will help you get started.'),
        ],
      ),
      nextButton: Button.primary(
        text: isLastStep ? "Get Started" : "Continue",
        submitForm: (form, (data) async {
          printDebug("Company Name: ${data}");
          await _createComany(data['name']);
          onNextPressed();
        }),
      ),
      backButton: isFirstStep ? null : Button.textOnly(
        text: "Back",
        textColor: Colors.black87,
        onPressed: onBackPressed,
      ),
    );
  }

  Future _createComany(String name) async {
    Company company = Company(name: name);

    try {
      Company c = await controller.create(company);
      setState(() {
          comapny = c;
        });
    } catch (e) {
      printDebug(e);
      showToastSorry(description: e.toString());
    }
  }

   /// Check if the journey can continue to the next step
  /// Override this method to add validation logic
  @override
  Future<bool> canContinue() async {
      return comapny?.id.isNotEmpty ?? false;
  }

  /// Called when unable to continue (canContinue returns false)
  /// Override this method to handle validation failures
  @override
  Future<void> onCannotContinue() async {
    showToastSorry(description: "You cannot continue");
  }

  /// Called before navigating to the next step
  /// Override this method to perform actions before continuing
  @override
  Future<void> onBeforeNext() async {
    
    if(comapny?.id.isNotEmpty ?? false) {
      session('onboarding_company', {
        "id": comapny?.id
      });
    }
    
   
    // E.g. save data to session
    // session('onboarding', {
    //   'name': 'Anthony Gordon',
    //   'occupation': 'Software Engineer',
    // });
    //
    // final sessionData = session('onboarding').data(); // {'name': 'Anthony Gordon', 'occupation': 'Software Engineer'}
    // printInfo(sessionData);

    // access the session data from other NavigationTabs
  }

  /// Called after navigating to the next step
  /// Override this method to perform actions after continuing
  @override
  Future<void> onAfterNext() async {
    print('Navigated to the next step');
  }

  /// Called when the journey is complete (at the last step)
  /// Override this method to perform completion actions
  @override
  Future<void> onComplete() async {}
}
