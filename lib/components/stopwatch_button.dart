import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;
  const StopwatchButton({
    Key? key,
    required this.icon,
    required this.text,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .40,
      height: 70,
      child: ElevatedButton(
          onPressed: click,
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            textStyle: TextStyle(fontSize: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(icon, size: 25, color: Colors.white),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
