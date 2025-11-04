import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '/resources/widgets/buttons/buttons.dart';

/* Client Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class CustomerForm extends NyFormData {

  CustomerForm({String? name}) : super(name ?? "customer");

  @override
  fields() => [
     Field.text("Name",
        label: "Name",
        style: "compact",
        validate: FormValidator.notEmpty(),
    ),
    Field.phoneNumber("company_name",
        label: "Company Name",
        style: "compact"
      ),
      Field.email("email",
        label: "Email",
        style: "compact"
      ),
      Field.phoneNumber("phone",
        label: "Phone",
        style: "compact"
      ),
    Field.phoneNumber("fax",
        label: "Fax",
        style: "compact"
      ),
    Field.textArea("address",
        label: "address",
        style: "compact"
      ),
    Field.textArea("notes",
        label: "Notes",
        style: "compact"
    ),
  ];
  
  // @override
  // Widget? get submitButton => Button.primary(text: "Submit", submitForm: (this, (data) {
  //   print(['data', data]);
  // }));
}
