import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/resources/widgets/buttons/buttons.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';


class WoltModalSheetBuilder {

  static SliverWoltModalSheetPage form({
    required Widget header,
    required NyForm form,
    List<Widget>? stickyActions,
    required BuildContext modalSheetContext,
    required TextTheme textTheme,
  }) {
    const double _pagePadding = 10.0;
    const double _buttonHeight = 50.0;
    const double _bottomPaddingForButton = _buttonHeight + (_pagePadding * 2) + 10;
    
    return WoltModalSheetPage(
      hasSabGradient: true,
      topBarTitle: header,
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          _pagePadding,
          _pagePadding,
          _pagePadding,
          _bottomPaddingForButton,
        ),
        child: form,
      ),
      stickyActionBar: stickyActions != null ? Padding(
        padding: const EdgeInsets.all(_pagePadding),
        child: Column(
          children: stickyActions,
          // children: [
          //   // Button.primary(
          //   //   text: "Save",
          //   //   height: _buttonHeight,
          //   //   submitForm: (
          //   //     form,
          //   //     (data) async {
          //   //       Customer customer = await controller.create(data);
          //   //       printDebug("data $customer");
          //   //       StateAction.refreshPage(_todoListViewStateName);
          //   //       Navigator.of(modalSheetContext).pop();
          //   //     }
          //   //   ),
          //   // ),
          // ],
        ),
      ) : null,
    );
  }
}