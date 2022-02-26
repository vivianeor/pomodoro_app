import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/stopwatch_button.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (_){
      return Container(
        color: store.isWorking() ? Color(0xfff08369) : Color(0xffa1db8c),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'hora de trabalhar' : 'hora de descansar',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.initial)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopwatchButton(icon: Icons.play_arrow, text: 'Iniciar',
                        click: store.initialStopwatch),
                  ),
                if (store.initial)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopwatchButton(icon: Icons.stop, text: 'Parar',
                        click: store.stopStopwatch),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: StopwatchButton(icon: Icons.refresh, text: 'Reiniciar',
                      click: store.restartStopwatch),
                )
              ],
            ),
          ],
        )
      );
    });
  }
}
