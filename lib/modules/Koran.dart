import 'package:flutter/material.dart.';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';
import 'package:koran_karim/models/KoranModel.dart';
import 'package:koran_karim/modules/KoranView.dart';
import '../models/KoranModel.dart';
class KoranKarimScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KoranAppCubit,KoranAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=KoranAppCubit.get(context);
        return ListView.builder(
          physics:BouncingScrollPhysics() ,
          itemBuilder: (context,index)=>BuildItem(cubit.Koran[index],context),
          itemCount: cubit.Koran.length,
        );
      },
    );
  }
  Widget BuildItem(KoranModel model,context)=>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>KoranViewScreen(name: model.Name,koran: model.Surah,)));

    },
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        margin: EdgeInsets.only(
            top: 10
        ),
        width: double.infinity,
        height:100,
        decoration: BoxDecoration(
            gradient:LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.deepOrange,
                  Colors.redAccent


                ]
            )
        ),

        child: Center(



             child: Text(
                '${model.Name}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),



        ),

      ),
    ),
  );
  }

