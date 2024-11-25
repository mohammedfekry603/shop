import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/business_logic/Appcubit.dart';
import 'package:shop/business_logic/Appstates.dart';
import 'package:shop/constant/blocObsever.dart';
import 'package:shop/data/diohelper/DioHelper.dart';
import 'package:shop/presentation/screens/HomeScreen.dart';
import 'package:shop/presentation/widgets/widgets.dart';

import 'data/cachehelper/CacheHelper.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver(); 
  Diohelper.init(); 
  await CacheHelper.init();
  bool isDark=CacheHelper.getBool(key: 'isDark');
  runApp(MyApp( isDark: isDark)); 
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Appcubit()..changeAppMode(isDark: isDark)
        ..getBusiness()
        ..getEntertainment()
        ..getGeneral(),
  
      child: BlocConsumer<Appcubit, Appstates>(
        listener: (context, state) {
         
        },
        builder: (context, state) {
      
          var cubit = Appcubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme:darkTheme(), 
            themeMode:cubit.isDark? ThemeMode.dark:ThemeMode.light,
            home: HomeScreen(), 
          );
        },
      ),
    );
  }
}
