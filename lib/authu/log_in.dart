import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/bloc/first_bloc.dart';
import 'package:trndy_stor/core/Text.dart';
import 'package:trndy_stor/core/widgets/button.dart';

import 'package:trndy_stor/core/widgets/custom_Textfill.dart';
import 'package:trndy_stor/core/widgets/dialog.dart';
import 'package:trndy_stor/core/widgets/sizbox.dart';
import 'package:trndy_stor/screns/get_start.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passowrdocontroler = TextEditingController();

  @override
  void dispose() {
    emailcontroler.dispose();
    passowrdocontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 316,
          child: ListView(
            children: [
              AppSpaces.v30,
              const Padding(
                padding: EdgeInsets.only(left: 1.2),
                child: AppText.Welcomback,
              ),
              AppSpaces.v4,
              const Padding(
                padding: EdgeInsets.only(left: 1.2),
                child: AppText.Pleasesignuptocontinue,
              ),
              AppSpaces.v22,
              CostomTexe(
                hint: "Email",
                controller: emailcontroler,
              ),
              AppSpaces.v22,
              CostomTexe(
                hint: "Password",
                controller: passowrdocontroler,
                ispassowrd: true,
              ),
              AppSpaces.v22,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText.Rememberme,
                  ForgetpassowrdButton.forgetpassowrdButton(
                      AuthInitial2(), context, emailcontroler)
                ],
              ),
              AppSpaces.v30,

              /// BLOC
              BlocConsumer<Auth2Bloc, Auth_state2>(
                listener: (context, state2) {
                  if (state2 is AuthSuccess2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => getstart_scren(),
                      ),
                    );
                  } else if (state2 is AuthFailure2) {
                    CustomDialog.show(
                      context: context,
                      title: "wrong",
                      massage:
                          "An Error during Login! \n please check the Email or password",
                      icon: Icons.warning,
                      iconcolor: Colors.redAccent,
                      buttontext: "Exit",
                    );
                  }
                },
                builder: (context, state2) {
                  if (state2 is AuthLoding2) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SignInButton(
                    state2: state2,
                    emailController2: emailcontroler,
                    passwordController2: passowrdocontroler,
                  );
                },
              ),

              AppSpaces.v27,
              const Center(child: AppText.Orsigninwith),
              AppSpaces.v22,
              Googlebutton.googlebutton(AuthInitial2(), context),
              AppSpaces.v22,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText.donthaveaccont,
                  SignupTextbutton.signupTextbutton(AuthInitial2(), context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
