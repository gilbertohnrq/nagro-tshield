// coverage:ignore-file
import 'package:flutter/material.dart';

class Keys {
  //login_page
  static const loginTaxIdFieldKey = Key('login_tax_id_field');
  static const loginPasswordFieldKey = Key('login_password_field');
  static const forgotPasswordButtonKey = Key('forgot_password_button');
  static const loginButtonKey = Key('login_button');

  //confirm_page
  static const confirmPasswordPasswordFieldKey = Key('confirm_password_password_field');

  //create_new_password
  static const newPasswordFieldKey = Key('new_password_field');

  //email_or_phone_send_otp
  static const phoneFieldKey = Key('phone_field');
  static const emailFieldKey = Key('email_field');

  //forgot_password_tax_id
  static const taxIdFieldKey = Key('tax_id_field');

  //otp_code_input
  static const inputOtpFieldKey = Key('input_otp_field');
  
  // Credit
  static const creditPhoneNumberKey = Key('credit_phone_number');
  static const creditEmailKey = Key('credit_email');
  static const creditAmountKey = Key('credit_amount');
}
