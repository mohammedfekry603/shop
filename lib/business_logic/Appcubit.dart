import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/Appstates.dart';
import 'package:shop/data/cachehelper/CacheHelper.dart';
import 'package:shop/data/diohelper/DioHelper.dart';
import 'package:shop/presentation/screens/BusinessScreen.dart';
import 'package:shop/presentation/screens/EntertainmentScreen.dart';
import 'package:shop/presentation/screens/GeneralScreen.dart';

class Appcubit  extends Cubit<Appstates>{
  Appcubit() : super(AppInitialState());
  static Appcubit get(context)=>BlocProvider.of(context);
   int currentIndex = 0;

  final List<Widget> screens = [
    BusinessScreen(),
    EntertainmentScreen(),
    GeneralScreen(),
  ];

  final List<String> titles = [
    "Business",
    "Entertainment",
    "General",
  ];
  void  changeindex(int index){
    currentIndex=index;
    emit(AppchangeBottonNavBar());
  }
  List <dynamic>business=[];
  void getBusiness() {
    emit(NewsLoadingState() );
  Diohelper.getData(
    url:'v2/top-headlines',
    query:{
      'country':'us',
      'category':'business',
      'apiKey':'16944b1088fc4058a8ecc7aaf0f903b7'
    },
  ).then((Response value) {
    business = value.data['articles'];
    emit(NewsGetBusinessSuccessState());
  }).catchError((error) {
    print('Error: $error');
    emit(NewsGetBusinessErrorState(error.toString()) );
  });
}
List<dynamic>entertainment=[];
void getEntertainment (){
  emit(NewsLoadingState());
  Diohelper.getData(url:'v2/top-headlines',
    query:{
      'country':'us',
      'category':'entertainment',
      'apiKey':'16944b1088fc4058a8ecc7aaf0f903b7'
    },
  ).then((Response value) {
    entertainment = value.data['articles'];
    emit(NewsGetEntertainmentSuccessState());
  }).catchError((error) {
    print('Error: $error');
    emit(NewsGetEntertainmentErrorState(error.toString()) );
  });
  
}
List<dynamic>general=[];
void getGeneral(){
  Diohelper.getData(url:'v2/top-headlines' ,
   query: {
    'country':'us',
      'category':'general',
      'apiKey':'16944b1088fc4058a8ecc7aaf0f903b7'

   }
   ).then((Response value) {
    general = value.data['articles'];
    emit(NewsGetGeneralSuccessState());
  }).catchError((error) {
    print('Error: $error');
    emit(NewsGetGeneralErrorState(error.toString()) );
  });
}
bool isDark = false;

void changeAppMode({bool? isDark}) {
  if (isDark != null) {
    this.isDark = isDark;
    emit(AppChangeModeState());
  } else {
    this.isDark = !this.isDark;
  }
  CacheHelper.putBool(key: 'isDark', value: this.isDark).then((value) {
    emit(AppChangeModeState());
  });
}


List<dynamic>search=[];
void getSearch(String value){
  emit(NewsLoadingState());
  Diohelper.getData(url:'v2/everything' ,
   query: {
    'q':'$value',
      'apiKey':'16944b1088fc4058a8ecc7aaf0f903b7'

   }
   ).then((value) {
    search = value.data['articles'];
    emit(NewsGetSearchSuccessState());
  }).catchError((error) {
    print('Error: $error');
    emit(NewsGetSearchErrorState(error.toString()) );
  });
}

}


