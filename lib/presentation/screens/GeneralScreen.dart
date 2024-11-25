import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/Appcubit.dart';
import 'package:shop/business_logic/Appstates.dart';
import 'package:shop/presentation/widgets/widgets.dart';

class GeneralScreen extends StatelessWidget{
  @override
   Widget build(BuildContext context) { return BlocConsumer<Appcubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = Appcubit.get(context).general;
        if (list.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return buildArticleList(list, context);
      },
    );
  }
}

  