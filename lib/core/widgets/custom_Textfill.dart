import 'package:flutter/material.dart';
import 'package:trndy_stor/core/color.dart';

// class Textformefilld {
//   static Widget customTextfilld(
//       {required String hint, required TextEditingController controller}) {
//     return TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//             hintText: hint,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(28.6),
//             ),
//             fillColor: Appcolor.prim));
//   }
// }

//
class CostomTexe extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool ispassowrd;

  const CostomTexe({
    super.key,
    required this.hint,
    required this.controller,
    this.ispassowrd = false,
  });

  @override
  State<CostomTexe> createState() => _CostomTexeState();
}

class _CostomTexeState extends State<CostomTexe> {
  late bool _obscurText;

  @override
  void initState() {
    super.initState();
    _obscurText = widget.ispassowrd;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurText,
      decoration: InputDecoration(
        suffixIcon: widget.ispassowrd
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscurText = !_obscurText;
                  });
                },
                icon: Icon(
                  _obscurText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              )
            : null,
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.8),
            borderRadius: BorderRadius.circular(28.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.6),
        ),
        fillColor: Appcolor.prim,
      ),
    );
  }
}

class sersh_teaxt extends StatelessWidget {
  const sersh_teaxt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Material(
          elevation: 20,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(28.6)),
          child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  icon: IconButton.filled(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      color: const Color.fromARGB(255, 6, 6, 6),
                      onPressed: () {
                        print("babi");
                      },
                      icon: Icon(Icons.search))))),
    );
  }
}
