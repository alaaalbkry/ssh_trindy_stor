import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trndy_stor/bloc/first_bloc.dart';
import 'package:trndy_stor/core/Text.dart';
import 'package:trndy_stor/core/widgets/button.dart';
import 'package:trndy_stor/core/widgets/chickbox.dart';
import 'package:trndy_stor/core/widgets/custom_Textfill.dart';
import 'package:trndy_stor/core/widgets/dialog.dart';
import 'package:trndy_stor/core/widgets/sizbox.dart';
import 'package:trndy_stor/screns/get_start.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => SignuppageState();
}

class SignuppageState extends State<Signuppage> {
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passowrdocontroler = TextEditingController();
  final TextEditingController confirmpassowrdcontroler =
      TextEditingController();
  @override
  void dispose() {
    namecontroler.dispose();
    emailcontroler.dispose();
    passowrdocontroler.dispose();
    confirmpassowrdcontroler.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SizedBox(
          width: 316,
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              AppSpaces.v4,
              const Padding(
                padding: EdgeInsets.only(left: 1.2),
                child: AppText.Createaccount,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 1.2),
                child: AppText.Pleasesignuptocontinue,
              ),
              AppSpaces.v34,
              CostomTexe(hint: "Name", controller: namecontroler),
              AppSpaces.v22,
              CostomTexe(
                hint: "Emal",
                controller: emailcontroler,
              ),
              AppSpaces.v22,
              CostomTexe(
                hint: "Password",
                controller: passowrdocontroler,
                ispassowrd: true,
              ),
              AppSpaces.v22,
              CostomTexe(
                hint: "confirm passowrd",
                controller: confirmpassowrdcontroler,
                ispassowrd: true,
              ),
              AppSpaces.v13,
              Row(
                children: [
                  BlocBuilder<AuthBloc, Auth_state>(
                    builder: (context, state) {
                      return Chickebox().customchecked(state, context);
                    },
                  ),
                  AppSpaces.v4,
                  AppText.IAgreewithprivacyandpolicy,
                ],
              ),
              AppSpaces.v16,
              BlocConsumer<AuthBloc, Auth_state>(listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => getstart_scren()));
                } else if (state is AuthFailure) {
                  CustomDialog.show(
                      context: context,
                      title: "Wrong!",
                      massage:
                          "An Error during Siginup! \n please check the Email or passowrd",
                      icon: Icons.warning,
                      iconcolor: Colors.red,
                      buttontext: "Exit");
                }
              }, builder: (context, state) {
                if (state is AuthLoding) {
                  return Container(
                      color: Colors.black,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ));
                }
                return SignupButton(
                  nameController: namecontroler,
                  emailController: emailcontroler,
                  passwordController: passowrdocontroler,
                  confirmPasswordController: confirmpassowrdcontroler,
                  state: AuthInitial(),
                );
              }),
              AppSpaces.v30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText.Alreadyhaveanaccount,
                  SigninText.signinText(AuthInitial2(), context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
