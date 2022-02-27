## Pomodoro: A pomodoro app built in Flutter with mobX.

This project is inspired by the Cod3r project, and was built in order to learn more about mobX. [See the lesson here.](https://www.youtube.com/watch?v=LeRjIY4n2Vk)

<img src="https://raw.githubusercontent.com/vivianeor/pomodoro_app/master/assets/print_app/1.jpeg">

This app aims to time study/work and rest time. This time is user defined and can be paused and restarted.

<h3>Installing the project</h3>
You can install this app on your android phone downloading the apk file pomodoro_app.apk in this repository or cloning this repository which has the following requirements:
✅ Flutter 2.10.2 (channel stable) <br/>
✅ Dart 2.16.1 <br/>
✅ JDK 8+ <br/>
✅ Android Studio (com plugins Flutter e Dart) <br/>
✅ Android SDK <br/>

In this case, run the following commands:
```
$flutter pub get
$flutter pub run build_runner build --delete-conflicting-outputs
$flutter run
```

<h3>Packages used in this project</h3>
- [x] [mobx](https://pub.dev/packages/mobx)
- [x] [flutter_mobx](https://pub.dev/packages/flutter_mobx)
- [x] [provider](https://pub.dev/packages/provider)
- [x] [lottie](https://pub.dev/packages/lottie)
- [x] [build_runner](https://pub.dev/packages/build_runner)
- [x] [mobx_codegen](https://pub.dev/packages/mobx_codegen)