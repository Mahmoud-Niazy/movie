import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';

import '../manager/layout_cubit/layout_states.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        return Scaffold(
          // backgroundColor: AppConstance.primaryBackgroundColor,
          body: layoutCubit.layoutScreens[layoutCubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: layoutCubit.currentIndex,
            onTap: (index){
              layoutCubit.bottomNavigate(index);
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
