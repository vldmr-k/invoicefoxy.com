import 'package:nylo_framework/nylo_framework.dart';

/* Login Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class CompanyNameForm extends NyFormData {
  CompanyNameForm({String? name}) : super(name ?? "company_name");

  @override
  fields() => [
        Field.text("name",
            label: "Company Name",
            autofocus: true,
            validate: FormValidator.minLength(2),
            style: "compact"),
      ];
}
