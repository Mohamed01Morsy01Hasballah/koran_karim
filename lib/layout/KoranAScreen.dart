import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';

class KoranScreen   extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>KoranAppCubit()..LoadSection(context)..DataKoran(context),
      child: BlocConsumer<KoranAppCubit,KoranAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=KoranAppCubit.get(context);
         return Scaffold(

            appBar: AppBar(
              title:Text(cubit.title[cubit.CurrentIndex])
            ),
            bottomNavigationBar: BottomNavigationBar(
              type:BottomNavigationBarType.fixed,
              currentIndex: cubit.CurrentIndex,
              onTap: (index){
               cubit.ChangeNav(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.home
                    ),
                    label: "القران"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    label: "اذكار"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.brightness_4_outlined),
                    label: "تسبيح"
                ),

              ],

            ),
           body: cubit.screen[cubit.CurrentIndex],
          );
        },

      ),
    );
  }
}
