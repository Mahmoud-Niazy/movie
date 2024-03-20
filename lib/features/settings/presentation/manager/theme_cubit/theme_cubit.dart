import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_states.dart';


class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);

  ThemeMode themeMode = ThemeMode.dark;
  bool isLight = false;
  changeTheme ()async{
    if( themeMode != ThemeMode.dark ){
      isLight = false ;
      themeMode = ThemeMode.dark;

    }
    else{
      isLight = true ;
      themeMode = ThemeMode.light;
    }
    emit(ChangeThemeModeState());
  }
}