import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/cubit/timer_cubit.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerCubit, int>(
              builder: (context, state) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(state.toDouble() * 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Text(
                      state.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      BlocProvider.of<TimerCubit>(context).startTimer();
                    });
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    timer.cancel();
                  },
                  child: Text(
                    'Pause',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    timer.cancel();
                    BlocProvider.of<TimerCubit>(context).cancelTimer();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
