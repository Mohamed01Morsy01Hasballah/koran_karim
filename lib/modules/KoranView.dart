import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';
import 'package:koran_karim/models/KoranModel.dart';

class KoranViewScreen extends StatelessWidget{
  final String? name;
  final String? koran;

  KoranViewScreen({this.name,this.koran});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>KoranAppCubit()..DataKoran(context),
      child: BlocConsumer<KoranAppCubit,KoranAppStates>(
        listener: (context,index){},
        builder: (context,index){
          var cubit=KoranAppCubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.black54,
          appBar: AppBar(
            title: Text(
              '${name}'
            ),
          ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>BuildItem(cubit.Koran[index]),
                itemCount: 1,

              ),
            )
          );
        },


      ),
    );
  }
  Widget BuildItem(KoranModel model)=>
      Column(
        children: [
          Text(
            'بسم الله الرحمن الرحيم ' ,

            textAlign: TextAlign.center,

            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Text(
            '${koran}' ,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ],
      );

}