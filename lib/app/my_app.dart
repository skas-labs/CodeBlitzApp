import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/model/repo/auth_repository.dart';
import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:code_blitz/model/repo/user_repository.dart';
import 'package:code_blitz/presentation/screen/signup/bloc/bloc.dart';
import 'package:code_blitz/presentation/screen/splash/sc_splash.dart';
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
          cursorColor: MyColors.WHITE,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: MyColors.PRIMARY),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            Navigator.pushNamed(context, AppRouter.LOGIN);
          } else if (state is Authenticated) {
            Navigator.pushNamed(context, AppRouter.HOME);
          }
        },
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }

          return Center(child: Text('Unhandle State $state'));
        },
      ),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
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
