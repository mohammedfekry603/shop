abstract class Appstates {}
class AppInitialState extends Appstates {}
class AppchangeBottonNavBar extends Appstates{}

class NewsinitialState extends Appstates{}
class NewsLoadingState extends Appstates {}
class NewsGetBusinessSuccessState extends Appstates{}
class NewsGetBusinessErrorState extends Appstates{
   String? error;
   NewsGetBusinessErrorState(this.error);
   

}
class NewsGetEntertainmentSuccessState extends Appstates{}
class NewsGetEntertainmentErrorState extends Appstates{
  String?error;
  NewsGetEntertainmentErrorState(this.error);
}
 
class NewsGetGeneralSuccessState extends Appstates {}
class NewsGetGeneralErrorState extends Appstates{
  String?error;
  NewsGetGeneralErrorState(this.error);
  

}
class AppChangeModeState extends Appstates{}

class NewsGetSearchSuccessState extends Appstates {}
class NewsGetSearchErrorState extends Appstates{
  String?error;
  NewsGetSearchErrorState(this.error);
  }

