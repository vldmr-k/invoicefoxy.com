import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:invoicefoxy_all/app/networking/document_api_service.dart';
import 'package:invoicefoxy_all/bootstrap/extensions.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';
import '/config/keys.dart';

class DocumentController extends Controller {


  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  Future all({int page = 1}) async {
    return await api<DocuemntApiService>(
        (request) => request.all(page: page)
    ).then((value) => value.map((e) => Document.fromJson(e)).toList());
  }

  Future<Document?> find(String documentID) async {
    return await api<DocuemntApiService>(
        (request) => request.find(documentID)
    ).then((value) => Document.fromJson(value));
  }

  Future create(Document document) async {
    return await api<DocuemntApiService>(
        (request) => request.create(this.context!.currentCompanyID, document)  
    );
  }

  Future update(String id, Document document) async {
    return await api<DocuemntApiService>(
        (request) => request.update(id, document)  
    );
  }
} 
