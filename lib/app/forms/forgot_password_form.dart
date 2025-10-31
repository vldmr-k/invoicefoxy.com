import 'package:nylo_framework/nylo_framework.dart';

/* Login Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class ForgotPasswordForm extends NyFormData {
  ForgotPasswordForm({String? name}) : super(name ?? "forgot_password");

  @override
  fields() => [
        Field.email("Email",
            autofocus: true,
            validate: FormValidator.rule("email"),
            style: "compact"),
      ];
}
