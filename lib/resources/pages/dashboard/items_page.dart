import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/forms/item_form.dart';
import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:invoicefoxy_all/bootstrap/extensions.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:invoicefoxy_all/resources/widgets/modal/modal_page_builder_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '/app/controllers/dashboard/items_controller.dart';

class ItemsPage extends NyStatefulWidget<ItemsController> {
  static RouteView path = ("/items", (_) => ItemsPage());

  ItemsPage({super.key}) : super(child: () => _ItemsPageState());
}

class _ItemsPageState extends NyPage<ItemsPage> {

  String key = "${Item.key.toString()}_list";

  /// [ItemsController] controller
  ItemsController get controller => widget.controller;

  ItemForm form = ItemForm();

 @override
  get init => () {

  };
  
 Widget view(BuildContext context) {
    return ScaffoldWidget(
        appBar: AppBar(
          title: Text("Items"),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () { 
              _openBox();
             },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            label: Text("Add item"),
            icon: Icon(Icons.add),
          ),
        body: Container(
            child: Column(
              children: [
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
      stateName: this.key,
        child: (BuildContext context, dynamic data) {
          return ListTile(
          title: Text(data.name),
          trailing: Text("\$${data.price}", style: TextStyle(fontSize: 16.0),),
          onTap: () {
            _openBox(item: data);
            //showToastInfo(description: "Customer tapped: ${data.name}");
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

  void _openBox({Item? item = null}) {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          //page1(modalSheetContext, textTheme),
          WoltModalSheetBuilder.form(
            header: Text(item != null ? "Edit item" : "Add item"),
            form: NyForm(
              form: form,
              initialData: item?.toJson(),
            ),
            stickyActions: [
              Button.primary(
                text: "Save",
                height: 50,
                submitForm: (
                  form,
                  (data) async {

                    if(item != null && item.id != null) {
                      await controller.update(item.id!, data);
                    } else {
                      await controller.create(data);
                    }
                    StateAction.refreshPage(this.key);
                    form.clear();
                    Navigator.of(modalSheetContext).pop();
                  }
                ),
              ),
            ],
            modalSheetContext: modalSheetContext,
            textTheme: textTheme,
          ),
        ];
      },
      modalTypeBuilder: (context) {
        return context.isMobile
            ? WoltModalType.bottomSheet()
            : WoltModalType.dialog();
      },
      onModalDismissedWithBarrierTap: () {
        confirmAction(() {
          form.clear();
          Navigator.of(context).pop();
        }, title: "Discard changes?");
      },
    );
  }
}
