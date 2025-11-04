import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/dashboard/customer_controller.dart';
import 'package:invoicefoxy_all/app/forms/customer_form.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/config/keys.dart';

class CustomersTab extends StatefulWidget {
  
  const CustomersTab({super.key});



  @override
  createState() => _CustomersTabState();
}

class _CustomersTabState extends NyState<CustomersTab> {

  CustomerForm form = new CustomerForm();
  CustomerController controller = new CustomerController();

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         openBox();
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
        shape: const StadiumBorder()
      ),
      body: SafeArea(
          child: NyPullToRefresh.separated(
              child: (BuildContext context, dynamic data) {
                  return ListTile(
                      title: Text(data.name)
                  );
              },
              data: (int page) async {
                  return await controller.all();
              },
              separatorBuilder: (BuildContext context, int index) {
                  return Divider();
              },
          )
      )
    );
  }

  void openBox(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  SafeArea(
          child: Container(
              padding: EdgeInsets.all(0) ,
              child: Dialog(
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                      padding:  EdgeInsets.all(20) ,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Spacing.vertical(20),
                            NyForm(
                              form: form,
                              header: Column(
                                children: [
                                  Button.iconOnly(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      print("Pressed!");
                                    },
                                  ),
                                  // Text("Add Client", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Spacer(),
                            Button.primary(text: "Submit", submitForm: (form, (data) {
                              
                            })),
                          ]
                      )
                  )
              )
          ),
        );
      },
    );
  }
}

