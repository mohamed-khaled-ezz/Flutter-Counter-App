import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ThemeEvent {}

final class ThemeTogglePressed extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    // Toggle the theme mode whenever the user requests a change.
    on<ThemeTogglePressed>((event, emit) {
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
