import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/controllers/dashboard/customer_controller.dart';
import 'package:invoicefoxy_all/app/forms/customer_form.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';
import 'package:invoicefoxy_all/bootstrap/extensions.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/config/keys.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CustomersTab extends StatefulWidget {
  
  const CustomersTab({super.key});

  @override
  createState() => _CustomersTabState();
}

class _CustomersTabState extends NyState<CustomersTab> {

  CustomerForm form = new CustomerForm();
  CustomerController controller = new CustomerController();
  String _todoListViewStateName = 'todo_list_view';

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      title: Text("Customers"),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () { _openBox(); },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            label: Text("Add customer"),
            icon: Icon(Icons.add),
          ),
          body: Container(
            child: Column(
              children: [
                // Button.gradient(
                //     text: "Add Customer",
                //     onPressed: () {
                //       _openBox();
                //     },
                //     gradientColors: [
                //         Color.fromRGBO(129, 31, 83, 1),
                //         Color.fromRGBO(129, 31, 83, 0.9),
                //       ],
                //   ),
                //  Spacing.vertical(30),
                Expanded(
                  child: _list(),
                ),
              ],
            ),
          )
      
    );
  }

  _list() {
    return NyPullToRefresh.separated(
      stateName: _todoListViewStateName,
        child: (BuildContext context, dynamic data) {
          return ListTile(
              title: Text(data.name),
              subtitle: Text("asdasd"),
              onTap: () {
                showToastInfo(description: "Customer tapped: ${data.name}");
              },
          );
        },
        data: (int page) async {
             return await controller.all(page: page);
        },
        separatorBuilder: (BuildContext context, int index) {
            return Divider();
        },
    );
  }

  SliverWoltModalSheetPage page1(BuildContext modalSheetContext, TextTheme textTheme) {
    const double _pagePadding = 10.0;
    const double _buttonHeight = 50.0;
    const double _bottomPaddingForButton = _buttonHeight + ( _pagePadding * 2) + 10;

    return WoltModalSheetPage(
      hasSabGradient: true,
      topBarTitle: Text('Add Customer', style: textTheme.titleMedium,),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      stickyActionBar: Padding(
        padding: const EdgeInsets.all(_pagePadding),
        child: Column(
          children: [
            Button.primary(
              text: "Save",
              height: _buttonHeight,
              submitForm: (form, (data) async {
                Customer customer = await controller.create(data);
                printDebug("data $customer");
                StateAction.refreshPage(_todoListViewStateName);
                Navigator.of(modalSheetContext).pop();
              }),
            ),
            // const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: WoltModalSheet.of(modalSheetContext).showNext,
            //   child: const SizedBox(
            //     height: _buttonHeight,
            //     width: double.infinity,
            //     child: Center(child: Text('Save')),
            //   ),
            // ),
          ],
        ),
      ),
      child:  Padding(
              padding: EdgeInsets.fromLTRB(
                _pagePadding,
                _pagePadding,
                _pagePadding,
                _bottomPaddingForButton,
              ),
              child: NyForm(form: form),
      ),
    );
  }

  void _openBox(){
    int _pageBreakpoint = 100;
    WoltModalSheet.show<void>(
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      final textTheme = Theme.of(context).textTheme;
                      return [
                        page1(modalSheetContext, textTheme),
                      ];
                    },
                    modalTypeBuilder: (context) {
                      return context.isMobile ? WoltModalType.bottomSheet() : WoltModalType.dialog();
                    },
                    onModalDismissedWithBarrierTap: () {
                      confirmAction(() {
                          debugPrint('Closed modal sheet with barrier tap');
                          Navigator.of(context).pop();
                      }, title: "Discard changes?");   
                      
                    },
                  );
  }
}

