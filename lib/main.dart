import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknitr_round2/firebase_options.dart';
import 'package:hacknitr_round2/routes/app_route.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'ConnecTen',
              theme: ThemeData(
                textTheme:
                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute.generateRoute,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
    );
  }
}
