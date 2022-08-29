import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/layout/cubit.dart';
import 'package:koran_karim/layout/states.dart';
import 'package:koran_karim/models/DetailsModel.dart';

class DetailsScreen extends StatelessWidget{
  late final int? id;
  final String? text;
  DetailsScreen({this.id,this.text});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>KoranAppCubit()..loadingDetails(context,id!),
      child: BlocConsumer<KoranAppCubit, KoranAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit=KoranAppCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.black54,
              appBar: AppBar(
                title: Text(
                  '${text}'
                ),
              ),
              body:  ListView.separated(
                  itemBuilder: (context,index)=>BuildItem(cubit.Details[index]),
                  separatorBuilder: (context,index)=>Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  itemCount: cubit.Details.length
              ),
            );
          }

      ),
    );
  }
  Widget BuildItem(DetailsModel model)=>Padding
    (
    padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model.content}',
            textDirection:TextDirection.rtl ,
            style: TextStyle(
              fontSize: 18,
              color:Colors.white
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.description}',
            textDirection:TextDirection.rtl ,

            style: TextStyle(
              fontSize: 14,
              color:Colors.grey
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${model.reference}',
                textDirection:TextDirection.rtl ,

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal
                ),
              ),
              SizedBox(
                width: 20,
              ),
              if(model.count !='')
              Text(
                'عدد المرات :${model.count}',
                textDirection:TextDirection.rtl ,

                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red
                ),
              ),
              if(model.count =='')
                Text(
                  'عدد المرات :1',
                  textDirection:TextDirection.rtl ,

                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red
                  ),
                ),





            ],
          )

        ],
      ),

  );
}