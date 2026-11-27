part of 'first_bloc.dart';

@immutable
sealed class FirstState {}

sealed class FirstInitial extends FirstState {}

class Auth_state {}

class AuthInitial extends Auth_state {
  final bool isAgreed;

  AuthInitial({this.isAgreed = false});
  AuthInitial copyWith({bool? isAgreed}) {
    return AuthInitial(isAgreed: isAgreed ?? this.isAgreed);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AuthInitial &&
            runtimeType == other.runtimeType &&
            isAgreed == other.isAgreed;
  }

  @override
  int get hashCode => isAgreed.hashCode;
}

class AuthLoding extends Auth_state {}

class AuthSuccess extends Auth_state {
  final String userName;
  AuthSuccess(this.userName);
}

class AuthFailure extends Auth_state {
  final String error;
  AuthFailure(this.error);
}

class Auth_state2 {}

class AuthInitial2 extends Auth_state2 {
  final bool isAgreed2;

  AuthInitial2({this.isAgreed2 = true});
  AuthInitial2 copyWith({bool? isAgreed}) {
    return AuthInitial2(isAgreed2: isAgreed ?? this.isAgreed2);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AuthInitial2 &&
            runtimeType == other.runtimeType &&
            isAgreed2 == other.isAgreed2;
  }

  @override
  int get hashCode => isAgreed2.hashCode;
}

class AuthLoding2 extends Auth_state2 {}

class AuthSuccess2 extends Auth_state2 {
  final String userName;
  AuthSuccess2(this.userName);
}

class AuthFailure2 extends Auth_state2 {
  final String error;
  AuthFailure2(this.error);
}

class Resetpaswordloding extends Auth_state2 {}

class Resetpaswordsucces extends Auth_state2 {}

class ResetpaswordError extends Auth_state2 {
  final String massag;
  ResetpaswordError(this.massag);
}
