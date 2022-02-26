import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroTime extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;
  const PomodoroTime({
    Key? key,
    required this.title,
    required this.value,
    this.dec,
    this.inc,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: this.dec,
              child: Icon(Icons.arrow_downward, color: Colors.white),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: store.isWorking() ? Color(0xfff08369) : Color(0xffa1db8c),
              ),
            ),
            Text('${this.value} min', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: this.inc,
              child: Icon(Icons.arrow_upward, color: Colors.white),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: store.isResting() ?  Color(0xffa1db8c) :Color(0xfff08369)
              ),
            ),
          ],
        ),
      ],
    );
  }
}
