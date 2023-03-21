import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  int initTime = 60;

  TimerCubit() : super(60);

  void startTimer() {
    if (initTime > 0) {
      --initTime;

      emit(initTime);
    }
  }

  void cancelTimer() {
    initTime = 60;

    emit(initTime);
  }
}
