import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_karim/models/DetailsModel.dart';
import 'package:koran_karim/models/KoranModel.dart';
import 'package:koran_karim/models/SectionModel.dart';
import 'package:koran_karim/modules/Askar.dart';
import 'package:koran_karim/modules/Koran.dart';
import '../modules/Tasbah.dart';
import 'states.dart';

class KoranAppCubit extends Cubit<KoranAppStates>{
  KoranAppCubit():super(initialState());
  static KoranAppCubit get(context)=>BlocProvider.of(context);
  List<String> title=
  [
    'القران الكريم ',
    'اذكار',
    'تسبيح'
  ];
  List<Widget> screen=
  [
    KoranKarimScreen(),
    AskarScreen(),
    KarimScreen()
  ];
  int x=0;
  void increaseX(){
    x+=1;
    if(x==34){
      x=0;
    }
    emit(increase());
  }
  int y=0;
  void increasey(){
    y+=1;
    if(y==34){
      y=0;
    }
    emit(increase());

  }
  int z=0;
  void increasez(){
    z+=1;
    if(z==34){
      z=0;
    }
    emit(increase());

  }
  int n=0;
  void increasen(){
    n+=1;
    if(n==34){
      n=0;
    }
    emit(increase());

  }
  int CurrentIndex=0;
  void ChangeNav(index){
    CurrentIndex=index;
    emit(ChangeBottomNav());
  }
  SectionModel? model;
  List<SectionModel> section=[];
  void LoadSection(context){
    emit(LoadingSactionLoadingState());
    DefaultAssetBundle.of(context)
        .loadString('assets/database/Section_db.json')
        .then((value) {
          var response=json.decode(value);
          response.forEach((element){
            model=SectionModel.fromJson(element);
            section.add(model!);
          });
          emit(LoadingSactionSuccessState());

    }).catchError((error){
      print("error ${error.toString()}");
      emit(LoadingSactionErrorState());

    });

  }
  DetailsModel? detail;
  List<DetailsModel> Details=[];
  void loadingDetails(context,int id){
    emit(LoadingDetailsLoadingState());

    DefaultAssetBundle.of(context)
        .loadString("assets/database/Section_details.json")
        .then((value) {
          var b=json.decode(value);
          b.forEach((element){
            detail=DetailsModel.fromJson(element);
            if(detail!.section_id==id){
              Details.add(detail!);

            }
          });
          emit(LoadingDetailsSucessState());
    }).catchError((error){
      print('error${error.toString()}');
      emit(LoadingDetailsErrorState());

    });
  }
  KoranModel? koran;
  List<KoranModel> Koran=[];
  void DataKoran(context){
    emit(LoadingKoranLoadingState());
    DefaultAssetBundle.of(context)
        .loadString('assets/database/Koran_db.json')
        .then((value) {
          var k=json.decode(value);
          k.forEach((element){
            koran=KoranModel.fromJson(element);
            Koran.add(koran!);
          });
          emit(LoadingKoranSucessState());

    }).catchError((error){
      print('error ${error.toString()} ');
      emit(LoadingKoranErrorState());

    });
  }

}