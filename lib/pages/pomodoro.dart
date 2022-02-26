import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:pomodoro/components/pomodoro_time.dart';
import 'package:pomodoro/components/stopwatch.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Observer(
          builder: (_){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .50,
                        child: Stopwatch()),
                      Container(
                        height: MediaQuery.of(context).size.height * .18,
                        color: store.isWorking() ? Color(0xfff08369) : Color(0xffa1db8c),
                        child: store.isWorking() ? Lottie.asset('assets/animation/busy.json'): Lottie.asset('assets/animation/rest.json'),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: PomodoroTime(title: 'Trabalho', value: store.workTime,
                          inc: store.initial && store.isWorking() ? null : store.incrementWorkTime,
                          dec: store.initial && store.isWorking() ? null :  store.decreaseWorkTime,
                        ),
                      ),
                      Expanded(
                        child: PomodoroTime(title: 'Descanso', value: store.restTime,
                            inc: store.initial && store.isResting() ? null : store.incrementRestTime,
                            dec: store.initial && store.isResting() ? null : store.decreaseRestTime
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
