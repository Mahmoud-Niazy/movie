import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/favourites/presentation/view/favourites_view.dart';
import 'package:movie/features/home/presentation/view/home_view.dart';
import 'package:movie/features/settings/presentation/view/settings_view.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit <LayoutStates>{
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);
  int currentIndex = 0;
  List<Widget> layoutScreens = [
    const HomeView(),
    const FavouritesView(),
    const SettingsView(),
  ];
  bottomNavigate(index){
    currentIndex = index ;
    emit(BottomNavigationState());
  }
}