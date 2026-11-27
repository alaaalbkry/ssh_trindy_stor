import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/bloc/first_bloc.dart';
import 'package:trndy_stor/core/widgets/custom_Textfill.dart';
import 'package:trndy_stor/core/widgets/dialog.dart';
import 'package:trndy_stor/core/widgets/sizbox.dart';

class Forgetpasswordpage extends StatefulWidget {
  const Forgetpasswordpage({super.key});

  @override
  State<Forgetpasswordpage> createState() => _ForgetpasswordpageState();
}

class _ForgetpasswordpageState extends State<Forgetpasswordpage> {
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Auth2Bloc, Auth_state2>(
      listener: (context, state) {
        if (state is Resetpaswordsucces) {
          CustomDialog.show(
              context: context,
              title: "Email sent",
              massage: "check your email",
              icon: Icons.check,
              iconcolor: Colors.green,
              buttontext: "done");
          Navigator.pop(context);
        }
        if (state is ResetpaswordError) {
          CustomDialog.show(
              context: context,
              title: "faild",
              massage: "cant find this email",
              icon: Icons.error_outline,
              iconcolor: Colors.redAccent,
              buttontext: "Exit");
        }
      },
      builder: (context, state) {
        return Center(
          child: Container(
            width: 316,
            decoration: BoxDecoration(
              border: BoxBorder.all(width: 3, color: Colors.blueGrey),
            ),
            height: 316,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "inter your email",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                ),
                AppSpaces.v13,
                CostomTexe(hint: "Email", controller: emailcontroller),
                AppSpaces.v22,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<Auth2Bloc>().add(
                            ResentpasswordEvent(emailcontroller.text.trim()));
                      },
                      child: Text("send")),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
