import 'package:flutter/material.dart';
import 'package:stylish/common/common_button.dart';
import '../../../../common/common_text.dart';
import '../../../../common/common_textField.dart';
import '../../../../const/const.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  void dispose() {
    _email.dispose();
    _focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CommonText(
                    text: 'Forget \nPassword?',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              CommonTextField(
                hintext: 'Enter your email adress',
                controller: _email,
                prefixIcon: Image.asset(ConstImage.mail),
                inputType: TextInputType.emailAddress,
                focusNode: _focusNodeEmail,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CommonText(
                    text:
                        'We will send you a message to set or reset\nyour new password',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CommonButton(
                    width: width * 0.9,
                    text: 'Submit',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 20,
                    onTap: () {},
                    background: const Color.fromARGB(255, 233, 12, 12)),
              )
            ]),
      )),
    );
  }
}
