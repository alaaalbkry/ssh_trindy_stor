import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:trndy_stor/data_respons/auth_respons.dart';

part 'first_event.dart';
part 'first_state.dart';

class AuthBloc extends Bloc<FirstEvent, Auth_state> {
  final AuthRespons authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<Checked>((event, emit) {
      if (state is AuthInitial) {
        emit((state as AuthInitial).copyWith(isAgreed: event.checked));
        print("bloc");
      } else {
        emit(AuthInitial(isAgreed: event.checked));
      }
    });
    on<SignnupRequested>((event, emit) async {
      emit(AuthLoding());
      try {
        final user = await authRepository.signup(
            event.password, event.name, event.email);

        if (user != null) {
          emit(AuthSuccess(user.displayName ?? ""));
        } else {
          emit(AuthFailure("error"));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(e.message ?? "worong email"));
        emit(AuthFailure(e.toString()));
      }
    });
  }
}

class Auth2Bloc extends Bloc<FirstEvent, Auth_state2> {
  final AuthRespons2 authRep;
  Auth2Bloc(this.authRep) : super(AuthInitial2()) {
    on<ResentpasswordEvent>((event, emit) async {
      emit(Resetpaswordloding());
      try {
        await Authresentpassowrd().resetpassword(event.email);
        emit(Resetpaswordsucces());
      } catch (e) {
        emit(ResetpaswordError(e.toString()));
        print("mbksl;$e");
      }
    });

    on<LogIn>((event, emit) async {
      emit(AuthLoding2());
      try {
        final user = await authRep.LogIn(event.email, event.password);
        if (user != null) {
          emit(AuthSuccess2(user.displayName ?? ""));
        } else {
          emit(AuthFailure2("error"));
        }
      } catch (e) {
        if (e is FirebaseAuthException) {
          emit(AuthFailure2(e.message ?? "wrong Email"));
        } else
          emit(AuthFailure2(e.toString()));
      }
    });
  }
}
