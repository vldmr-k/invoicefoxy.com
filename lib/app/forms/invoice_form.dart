import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '/resources/widgets/buttons/buttons.dart';

/* Invoice Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class InvoiceForm extends NyFormData {

  InvoiceForm({String? name}) : super(name ?? "invoice");

  // @override
  // get init => () {
  //   /// Initial data for the form
  //   return {
  //     "name": "Anthony",
  //     "price": "100",
  //     "favourite_color": "Blue",
  //     "bio": "I am a Flutter Developer"
  //   };
  // };

  @override
  fields() => [
     Field.text("Name",
        style: "compact"
    ),
    [
      Field.currency("Price",
        currency: "usd",
        dummyData: "19.99",
        style: "compact",
      ),
      Field.picker("Favourite Color",
        options: [
          "Red",
          "Blue",
          "Green"
        ],
        validate: FormValidator.contains(["Red","Blue","Green"]),
        style: "compact",
      ),
    ],
    Field.textArea("Bio",
        style: "compact"
    ),
  ];
  
  // @override
  // Widget? get submitButton => Button.primary(text: "Submit", submitForm: (this, (data) {
  //   print(['data', data]);
  // }));
}
