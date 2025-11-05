import '/app/networking/invoice_api_service.dart';
import '../app/controllers/dashboard/customer_controller.dart';
import '/app/controllers/dashboard/company_switcher_controller.dart';
import '../app/networking/customer_api_service.dart';
import '../app/models/customer.dart';
import '/app/controllers/company_onboarding_controller.dart';
import '/app/networking/company_api_service.dart';
import '/app/models/company.dart';
import '/app/models/invoice.dart';
import '../app/networking/auth_service.dart';
import '/app/models/organization.dart';
import '/app/controllers/dashboard_controller.dart';
import '/app/controllers/forgot_password_controller.dart';
import '/app/controllers/register_controller.dart';
import '/app/controllers/login_controller.dart';
import '/app/controllers/home_controller.dart';
import '/app/models/user.dart';
import '/app/networking/api_service.dart';

/* Model Decoders
|--------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models.
|
| Learn more https://nylo.dev/docs/6.x/decoders#model-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> modelDecoders = {
  Map<String, dynamic>: (data) => Map<String, dynamic>.from(data),

  List<User>: (data) =>
      List.from(data).map((json) => User.fromJson(json)).toList(),
  //
  User: (data) => User.fromJson(data),

  // User: (data) => User.fromJson(data),

  List<Organization>: (data) => List.from(data).map((json) => Organization.fromJson(json)).toList(),

  Organization: (data) => Organization.fromJson(data),

  List<Invoice>: (data) => List.from(data).map((json) => Invoice.fromJson(json)).toList(),

  Invoice: (data) => Invoice.fromJson(data),

  List<Company>: (data) => List.from(data).map((json) => Company.fromJson(json)).toList(),

  Company: (data) => Company.fromJson(data),

  List<Customer>: (data) => List.from(data).map((json) => Customer.fromJson(json)).toList(),

  Customer: (data) => Customer.fromJson(data),
};

/* API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/6.x/decoders#api-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> apiDecoders = {
  ApiService: () => ApiService(),

  // ...

  AuthService: AuthService(),

  CompanyApiService: CompanyApiService(),

  CustomerApiService: CustomerApiService(),

  InvoiceApiService: InvoiceApiService(),
};

/* Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
|
| Learn more https://nylo.dev/docs/6.x/controllers
|-------------------------------------------------------------------------- */
final Map<Type, dynamic> controllers = {
  HomeController: () => HomeController(),

  // ...

  LoginController: () => LoginController(),

  RegisterController: () => RegisterController(),
  // InvoiceListController: () => InvoiceListController(),

  ForgotPasswordController: () => ForgotPasswordController(),

  DashboardController: () => DashboardController(),

  CompanyOnboardingController: () => CompanyOnboardingController(),

  CompanySwitcherController: () => CompanySwitcherController(),

  CustomerController: () => CustomerController(),
};
