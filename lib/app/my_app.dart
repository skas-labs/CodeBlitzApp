import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/model/repo/auth_repository.dart';
import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:code_blitz/model/repo/user_repository.dart';
import 'package:code_blitz/presentation/screen/home/sc_home.dart';
import 'package:code_blitz/presentation/screen/login/sc_login.dart';
import 'package:code_blitz/presentation/screen/signup/bloc/bloc.dart';
import 'package:code_blitz/presentation/screen/splash/sc_splash.dart';
import 'package:code_blitz/utils/my_const/COLOR_CONST.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../presentation/router.dart';
import 'auth_bloc/bloc.dart';
import 'simple_bloc_delegate.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Gilroy',
          cursorColor: COLOR_CONST.WHITE,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: COLOR_CONST.PRIMARY),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          } else if (state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated) {
            return HomeScreen();
          }

          return Container(
            child: Center(child: Text('Unhandle State $state')),
          );
        },
      ),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 0, 0, 0),
      ),
    );
  }

  //Todo: Improve this

  static Widget runWidget() {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocDelegate();

    final UserRepository userRepository = UserRepository();
    final HomeRepository homeRepository = HomeRepository();
    final AuthRepository authRepository = AuthRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => userRepository),
        RepositoryProvider<HomeRepository>(create: (context) => homeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository)
                  ..add(AppStarted()),
          ),
          BlocProvider(
            create: (context) => SignUpBloc(authRepository: AuthRepository()),
          )
        ],
        child: MyApp(),
      ),
    );
  }
}
