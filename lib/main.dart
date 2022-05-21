import 'package:Habo/auth/login.dart';
import 'package:Habo/auth/register.dart';
import 'package:Habo/provider.dart';
import 'package:Habo/screens/home_screen.dart';
import 'package:Habo/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(HabManager());

class HabManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Bloc()),
      ],
      child: Consumer<Bloc>(
        builder: (context, counter, _) {
          final bloc = Provider.of<Bloc>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: true,
            scaffoldMessengerKey: Provider.of<Bloc>(context).getScaffoldKey,
            theme: Provider.of<Bloc>(context).getSettings.getLight,
            darkTheme: Provider.of<Bloc>(context).getSettings.getDark,
            //home: !bloc.getDataLoaded ? LoadingScreen() : HomeScreen(),
            routes: {
              '/': (context) =>
                  !bloc.getDataLoaded ? LoadingScreen() : HomeScreen(),
              '/login': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
            },
          );
        },
      ),
    );
  }
}
