import 'package:flutter/material.dart';
import 'package:stylish/common/circle_image.dart';
import 'package:stylish/common/common_button.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/common/common_textField.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/authentication/signIn/screen/sign_in.dart';
import 'package:stylish/features/authentication/signup/service/service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Service _service = Service();
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  bool obsurePass = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _key = GlobalKey<FormState>();

  void iniState() {
    super.initState();
  }

  void dispose() {
    _email.dispose();
    _focusNodeEmail.dispose();
    _focusNodeName.dispose();
    _focusNodePassword.dispose();
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  void signup() {
    _service.signUp(
        context: context,
        name: _name.text,
        email: _email.text,
        password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CommonText(
                    text: 'Create an \naccount',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    size: 30),
              ),
              CommonTextField(
                hintext: 'name',
                prefixIcon: const Icon(Icons.person),
                controller: _name,
                inputType: TextInputType.name,
                focusNode: _focusNodeName,
              ),
              CommonTextField(
                hintext: 'Username or Email',
                prefixIcon: Image.asset(ConstImage.user),
                controller: _email,
                inputType: TextInputType.emailAddress,
                focusNode: _focusNodeEmail,
              ),
              CommonTextField(
                hintext: 'password',
                prefixIcon: Image.asset(ConstImage.group2),
                obscure: obsurePass,
                controller: _password,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obsurePass = !obsurePass;
                    });
                  },
                  child: Icon(obsurePass ? Icons.visibility : Icons.visibility_off),
                ),
                inputType: TextInputType.visiblePassword,
                focusNode: _focusNodePassword,
              ),
              Center(
                child: CommonButton(
                    width: width * 0.9,
                    text: 'Create Account',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 20,
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        signup();
                      }
                      FocusScope.of(context).unfocus();
                    },
                    background: const Color.fromARGB(255, 233, 12, 12)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                  child: CommonText(
                      text: '-OR Continue with-',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 13)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleImage(
                    image: ConstImage.frame4,
                    onTap: () {},
                  ),
                  CircleImage(
                    image: ConstImage.apple1,
                    onTap: () {},
                  ),
                  CircleImage(
                    image: ConstImage.fashion1,
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonText(
                      text: 'I Already Have an Account',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      size: 15),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const CommonText(
                        text: 'Login',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 31, 15),
                        size: 15,
                        textDecoration: TextDecoration.underline,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
