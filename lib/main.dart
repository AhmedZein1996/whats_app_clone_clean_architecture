import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/auth/auth_cuibt.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/auth/auth_state.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/phone_auth/phone_auth_cuibt.dart';
import 'package:whats_app_clone_clean_architecture/presentation/screens/home_screen.dart';
import 'package:whats_app_clone_clean_architecture/presentation/screens/welcome_screen.dart';
import 'package:whats_app_clone_clean_architecture/presentation/theme/style.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<PhoneAuthCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: primaryColor,
              ),
          primaryColor: primaryColor,
        ),
        routes: {
          '/' : (context){
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, state){
              if(state is Authenticated){
                return HomeScreen(uid: state.uid,);
              }
              if(state is UnAuthenticated){
                return WelcomeScreen();
              }
              return Container();
            });
          },
        },
    return MaterialApp(
      title: 'Flutter Whatsapp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
        primaryColor: primaryColor,
      ),
    );
  }
}
