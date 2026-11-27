import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trndy_stor/Entity/home_entity.dart';
import 'package:trndy_stor/authu/forgetpassword.dart';
import 'package:trndy_stor/authu/log_in.dart';
import 'package:trndy_stor/authu/sign_up.dart';
import 'package:trndy_stor/bloc/first_bloc.dart';
import 'package:trndy_stor/bloc/prodact.dart';
import 'package:trndy_stor/bloc/prodact_event.dart';

import 'package:trndy_stor/core/Text.dart';
import 'package:trndy_stor/core/widgets/dialog.dart';
import 'package:trndy_stor/data_respons/auth_respons.dart';
import 'package:trndy_stor/cart/cart.dart';

class SignupButton extends StatelessWidget {
  final Auth_state state;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupButton({
    super.key,
    required this.state,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, Auth_state>(
      builder: (context, state) {
        return SizedBox(
          height: 54,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 50,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              if (state is AuthInitial && state.isAgreed) {
                if (passwordController.text == confirmPasswordController.text) {
                  context.read<AuthBloc>().add(SignnupRequested(
                      nameController.text,
                      passwordController.text,
                      emailController.text));
                } else {
                  CustomDialog.show(
                      context: context,
                      title: "wrong",
                      massage: "Agree with privacy and policy",
                      icon: Icons.warning,
                      iconcolor: Colors.redAccent,
                      buttontext: "Exit");
                }
              } else {
                CustomDialog.show(
                    context: context,
                    title: "wrong",
                    massage: "Agree with privacy and policy",
                    icon: Icons.warning,
                    iconcolor: Colors.redAccent,
                    buttontext: "Exit");
              }
            },
            child: AppText.sign_up_Botton,
          ),
        );
      },
    );
  }
}

class SigninText {
  static Widget signinText(Auth_state2 state, BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(elevation: 12.5),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => loginpage()));
        },
        child: const Text(
          "SignIn",
          style: TextStyle(color: Colors.grey),
        ));
  }
}

class SignInButton extends StatelessWidget {
  final Auth_state2 state2;
  final TextEditingController emailController2;
  final TextEditingController passwordController2;

  const SignInButton({
    super.key,
    required this.state2,
    required this.emailController2,
    required this.passwordController2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 50,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          context.read<Auth2Bloc>().add(
                LogIn(
                  emailController2.text.trim(),
                  passwordController2.text.trim(),
                ),
              );
        },
        child: AppText.sign_up_Botton,
      ),
    );
  }
}

class ForgetpassowrdButton {
  static Widget forgetpassowrdButton(
    Auth_state2 state2,
    BuildContext context,
    TextEditingController emailController,
  ) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Forgetpasswordpage()));
      },
      child: const Text(
        "Forget Password",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class SignupTextbutton {
  static Widget signupTextbutton(Auth_state2 state2, BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(elevation: 12.5),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Signuppage()));
        },
        child: const Text(
          "SignIn",
          style: TextStyle(color: Colors.grey),
        ));
  }
}

class Googlebutton {
  static Widget googlebutton(Auth_state2 state2, BuildContext context) {
    return Center(
      child: SizedBox(
        width: 32,
        child: IconButton(
            style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 40,
            onPressed: () async {
              final user = await GoogleAuthService().signInWithGoogle();

              if (user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signuppage()),
                );
              } else {
                CustomDialog.show(
                  context: context,
                  title: "Error",
                  massage: "sorry this serves isnt avilbl now",
                  icon: Icons.warning,
                  iconcolor: Colors.red,
                  buttontext: "Exit",
                );
              }
            },
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.black,
              size: 32,
            )),
      ),
    );
  }
}

class AddButton {
  static Widget Addbuttn(BuildContext pagcontext, ProdactsModel prodact) {
    return SizedBox(
      child: SizedBox(
        height: 20,
        width: 20,
        child: FloatingActionButton(
            child: const Center(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            onPressed: () {
              pagcontext.read<CartBloc>().add(
                    AddToCartEvent(prodact),
                  );
              ScaffoldMessenger.of(pagcontext).showSnackBar(SnackBar(
                content: Text("Moved to card"),
                duration: Duration(seconds: 4),
              ));

              // Navigator.push(
              //   pagcontext,
              //   MaterialPageRoute(builder: (_) => CartPage()),
              // );
            }),
      ),
    );
  }
}
