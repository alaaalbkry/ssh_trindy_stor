import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/authu/log_in.dart';
import 'package:trndy_stor/authu/sign_up.dart';
import 'package:trndy_stor/bloc/first_bloc.dart';
import 'package:trndy_stor/bloc/prodact.dart';
import 'package:trndy_stor/bloc/prodact_event.dart';
import 'package:trndy_stor/core/widgets/buttom_nt.dart';
import 'package:trndy_stor/data_respons/auth_respons.dart';
import 'package:trndy_stor/data_respons/home_respons.dart';
import 'package:trndy_stor/firebase_options.dart';
import 'package:trndy_stor/cart/cart.dart';
import 'package:trndy_stor/home/prsntation/home_scren.dart';
import 'package:trndy_stor/screns/get_start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BlocProvider(
    create: (context) => Auth2Bloc(AuthRespons2()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) {
        final bloc = ProdactBlock(ProdactRespons());
        bloc.add(LoadProdactsEvent());
        return bloc;
      }),
      BlocProvider(
        create: (_) => CartBloc(),
      )
    ], child: const MaterialApp(home: buttom_notfecayion()));
  }
}
