import 'package:flutter/material.dart';
import 'package:stylish/common/common_button.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/common/common_textField.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/authentication/forget_password/screen/forget_password.dart';
import 'package:stylish/features/authentication/signIn/service/sign_in_service.dart';
import 'package:stylish/features/authentication/signup/screen/sign_up.dart';
import '../../../../common/circle_image.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Service _service = Service();
  bool obScure = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _key = GlobalKey<FormState>();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  void signin() {
    _service.signin(
        context: context, email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
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
                        text: 'Welcome \nBack!',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        size: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonTextField(
                    hintext: 'Username or Email',
                    controller: _email,
                    prefixIcon: Image.asset(ConstImage.user),
                    inputType: TextInputType.emailAddress,
                    focusNode: _focusNodeEmail,
                  ),
                  CommonTextField(
                    hintext: 'Password',
                    prefixIcon: Image.asset(ConstImage.group2),
                    obscure: obScure,
                    controller: _password,
                    suffixIcon: InkWell(
                        onTap: () {
                         setState(() {
                            obScure = !obScure;
                         });
                        },
                        child: Icon(
                            obScure ? Icons.visibility : Icons.visibility_off)),
                    inputType: TextInputType.visiblePassword,
                    focusNode: _focusNodePassword,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassword()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonText(
                            margin: EdgeInsets.only(right: 20),
                            text: 'Forget Password?',
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 233, 12, 12),
                            size: 15),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CommonButton(
                        text: 'Login',
                        width: width * 0.9,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontsize: 20,
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            signin();
                          }
                          FocusScope.of(context).unfocus();
                        },
                        background: const Color.fromARGB(255, 233, 12, 12)),
                  ),
                  const SizedBox(
                    height: 20,
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
                          text: 'Create An Account ',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          size: 15),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const CommonText(
                            text: 'Sign up',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 245, 31, 15),
                            size: 15,
                            textDecoration: TextDecoration.underline,
                          ))
                    ],
                  )
                ],
              ))),
    ));
  }
}
