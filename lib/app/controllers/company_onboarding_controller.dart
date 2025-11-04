import 'package:invoicefoxy_all/app/models/company.dart';
import 'package:invoicefoxy_all/app/networking/company_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pocketbase/pocketbase.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class CompanyOnboardingController extends Controller {
  
  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  Future<Company> create(Company company) async {
     
     try {
      return await api<CompanyApiService>(
          (request) => request.create(company)
      );
     } on ClientException catch (error)  {
        final message = error.response?['message'] ?? 'Something went wrong, please try again later.';
        printDebug(error);
        throw Exception(message); 
     } catch (error, stack) {
      throw Exception('Unexpected error: $error'); // ✅ fail hard
    }
  }

} 
