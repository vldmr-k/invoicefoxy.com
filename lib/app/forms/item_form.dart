import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '/resources/widgets/buttons/buttons.dart';

/* Item Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class ItemForm extends NyFormData {

  ItemForm({String? name}) : super(name ?? "item");

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
     Field.text("name",
        label: "Name",
        style: "default",
        validate: FormValidator.notEmpty(),
    ),
    Field.textArea("description",
        label: "Description",
        style: "default"
    ),
    [
      Field.currency("price",
        label: "Price",
        currency: "usd",
        dummyData: "100",
        footer: Text("Price per unit"),
        style: "default",
      ),
      Field.switchBox("taxable",
          label: "Taxable",
          style: "default",
      ),
    ],
    
    Field.picker("type", 
        label: "Type",
        options: ItemType.values.map((e) => e.name.capitalize()).toList(),
        dummyData: "",
    )
  ];
  
  // @override
  // Widget? get submitButton => Button.primary(text: "Submit", submitForm: (this, (data) {
  //   print(['data', data]);
  // }));
}
