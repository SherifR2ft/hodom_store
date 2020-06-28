class ValidateText {

  validateText({String textType, var value}) => (textType == 'phone')
      ? _Validator.phoneValidator(value)
      : _Validator.passwordValidator(value);
}

class _Validator {
  static String phoneValidator(var value) => (value.isEmpty)
      ? "رقم الهاتف لا يمكن ان يكون فارغ."
//      : (value.length < 2)
//          ? "رقم الهاتف يجب ان يكون اكثرمن ٦ ارقام."
//          : (value.length > 15)
//              ? "رقم الهاتف يجب ان يكون اقل من ۱٥ رقم."
//              : (value.runtimeType is! int)
//                  ? "رقم الهاتف يجب ان يحتوي علي ارقام فقط."
                  : null;

  static String passwordValidator(var value) =>
      (value.isEmpty) ? "كلمة المرور لا يمكن ان تكون فارغة." : null;
}
