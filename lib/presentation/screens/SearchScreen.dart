import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/Appcubit.dart';
import 'package:shop/business_logic/Appstates.dart';
import 'package:shop/presentation/widgets/widgets.dart';

class SearchScreen  extends StatelessWidget{

  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
return BlocConsumer<Appcubit,Appstates>
(
  listener: (context, state) {  
  },
  builder:(context, state) {
    var list = Appcubit.get(context).search;
   return
   Scaffold(
    appBar: AppBar(iconTheme:IconThemeData(color: Theme.of(context).textTheme.bodyMedium?.color) ,
    title: Text('Search'
    ,style: Theme.of(context).textTheme.bodyMedium,), 
    ),
    body:Column(
      children: [
        customTextFormField(
          controller: controller,
          hint:'Search' ,
          prefixIcon:Icons.search,
          keyboardType: TextInputType.text,
          context: context,
          onChanged: (value){
            Appcubit.get(context).getSearch(value);
          } ),
    Expanded(
      child: buildArticleList(list, context)
    )
        ],
    ),
  );
  });
  
  }
}