import 'package:flutter/material.dart';
import 'package:trndy_stor/core/color.dart';
import 'package:trndy_stor/core/widgets/sizbox.dart';

class CustomDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String massage,
    required IconData icon,
    required Color iconcolor,
    required String buttontext,
    VoidCallback? onButtonpresse,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Appcolor.second,
            insetPadding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Appcolor.second,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                      // color: Appcolor.prim,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: iconcolor,
                  ),
                  Text(
                    title,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  AppSpaces.v13,
                  Text(
                    massage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  AppSpaces.v22,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onButtonpresse;
                        },
                        child: Text(buttontext)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
