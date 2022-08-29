import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/KoranAScreen.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) =>KoranAppCubit()..LoadSection(context)..DataKoran(context),
     child: BlocConsumer<KoranAppCubit,KoranAppStates>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme:ThemeData(
               appBarTheme: AppBarTheme(
                   titleTextStyle:TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                   ) ,
                   centerTitle: true
               ),
             scaffoldBackgroundColor: Colors.green
           ) ,
           home:KoranScreen() ,
         );
       },
       
     ),
   );
  }

}


