import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';

class KarimScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>KoranAppCubit(),
      child: BlocConsumer<KoranAppCubit,KoranAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=KoranAppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    MaterialButton(
                        onPressed: () {
                          cubit.increaseX();
                        },
                        child:Text(
                            'استغفر الله'
                        )
                    ),
                    Spacer(),
                    Text('${cubit.x}',textDirection: TextDirection.rtl,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,height:5,decoration: BoxDecoration(color: Colors.grey)
                    ),
                ),
                Row(
                  children: [
                    MaterialButton(
                        onPressed: (){
                        cubit.increasey();
                        },
                        child:Text(
                            'الحمد الله',textDirection: TextDirection.rtl,

                        )
                    ),
                    Spacer(),
                    Text('${cubit.y}'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      width: double.infinity,height:5,decoration: BoxDecoration(color: Colors.grey)
                  ),
                ),


                Row(
                  children: [
                    MaterialButton(
                        onPressed: (){
                            cubit.increasez();
                        },
                        child:Text(
                            'سبحان الله'
                        )
                    ),
                    Spacer(),
                    Text('${cubit.z}'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      width: double.infinity,height:5,decoration: BoxDecoration(color: Colors.grey)
                  ),
                ),

                Row(
                  children: [
                    MaterialButton(
                        onPressed: (){
                     cubit.increasen();
                        },
                        child:Text(
                            'لا حول ولا فوة الا الله'
                        )
                    ),
                    Spacer(),
                    Text('${cubit.n}'),
                  ],
                ),

              ],
            ),
          );
        }
      ),
    );
  }

}