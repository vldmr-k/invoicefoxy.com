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
        validate: FormValidator.notEmpty(),
        style: "default"
    ),
    Field.text("company_name",
        label: "Company Name",
        style: "default"
      ),
      Field.email("email",
        label: "Email",
        style: "default"
      ),
      Field.phoneNumber("phone",
        label: "Phone",
        style: "default"
      ),
    Field.phoneNumber("fax",
        label: "Fax",
        style: "default"
      ),
    Field.textArea("address",
        label: "address",
        style: "default"
      ),
    Field.textArea("notes",
        label: "Additional info",
        style: "default"
    ),
  ];
  
  // @override
  // Widget? get submitButton => Button.primary(text: "Submit", submitForm: (this, (data) {
  //   print(['data', data]);
  // }));
}
