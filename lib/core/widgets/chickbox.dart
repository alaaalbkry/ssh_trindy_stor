import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/bloc/first_bloc.dart';

class Chickebox {
  Widget customchecked(Auth_state state, BuildContext context) {
    return Checkbox(
        key: UniqueKey(),
        value: state is AuthInitial ? state.isAgreed : false,
        onChanged: (bool? val) {
          context.read<AuthBloc>().add(Checked(checked: val ?? false));
        });
  }
}
