import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_createv_app/constant/theme_data.dart';
import 'package:news_createv_app/presentation/controllers/bloc/artical_bloc.dart';
import 'package:news_createv_app/presentation/pages/home/home_screen.dart';

import 'app/config/helper/sl.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependancies();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        /* GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: AppTheme().getThemeMode(),
      home: const HomeScreen(),
    );
    */
        BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticlesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(false, context),
        home: const HomeScreen(),
      ),
    );
  }
}
