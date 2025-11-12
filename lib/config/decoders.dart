import '../app/controllers/dashboard/company_controller.dart';
import '../app/controllers/dashboard/document_controller.dart';
import '/app/networking/item_api_service.dart';
import '/app/controllers/dashboard/items_controller.dart';
import '../app/controllers/dashboard/customer_controller.dart';
import '../app/networking/customer_api_service.dart';
import '../app/networking/document_api_service.dart';

import '../app/models/customer.dart';
import '/app/controllers/company_onboarding_controller.dart';
import '/app/networking/company_api_service.dart';
import '/app/models/company.dart';
import '../app/networking/auth_service.dart';
import '/app/models/organization.dart';
import '/app/controllers/dashboard_controller.dart';
import '/app/controllers/forgot_password_controller.dart';
import '/app/controllers/register_controller.dart';
import '/app/controllers/login_controller.dart';
import '/app/controllers/home_controller.dart';
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

  // User: (data) => User.fromJson(data),

  List<Organization>: (data) => List.from(data).map((json) => Organization.fromJson(json)).toList(),

  Organization: (data) => Organization.fromJson(data),

  // List<Document>: (data) => List.from(data).map((json) => Document.fromJson(json)).toList(),

  // Document: (data) => Document.fromJson(data),

  List<Company>: (data) => List.from(data).map((json) => Company.fromJson(json)).toList(),

  Company: (data) => Company.fromJson(data),

  List<Customer>: (data) => List.from(data).map((json) => Customer.fromJson(json)).toList(),

  Customer: (data) => Customer.fromJson(data),

  //List<Item>: (data) => List.from(data).map((json) => Item.fromJson(json)).toList(),

  //Item: (data) => Item.fromJson(data),
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

  AuthService: () => AuthService(),
  CompanyApiService: () => CompanyApiService(),
  CustomerApiService: () => CustomerApiService(),
  ItemApiService: () => ItemApiService(),
  DocuemntApiService: () => DocuemntApiService()
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

  CustomerController: () => CustomerController(),

  ItemsController: () => ItemsController(),

  CompanyController: () => CompanyController(),
  
  DocumentController: () => DocumentController(),
};
