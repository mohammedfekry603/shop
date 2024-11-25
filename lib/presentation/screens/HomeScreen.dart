import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/Appcubit.dart';
import 'package:shop/business_logic/Appstates.dart';
import 'package:shop/presentation/screens/SearchScreen.dart';
import 'package:shop/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, Appstates>(
      listener: ( context,state) {},
      builder: ( context, state) {
        var cubit = Appcubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [IconButton(onPressed:(){
              NavigatTO(context, SearchScreen());
            }, icon:Icon(Icons.search)),
            IconButton(onPressed: (){
              cubit.changeAppMode();
            }, icon:Icon(Icons.brightness_4_rounded))],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeindex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: "Business",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: "Entertainment",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: "General",
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
