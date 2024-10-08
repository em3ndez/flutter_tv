import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/business/movies_bloc.dart';
import 'package:flutter_tv/framework/remote_controller.dart';
import 'package:flutter_tv/ui/focus/extensions.dart';
import 'package:flutter_tv/ui/focus/scale_widget.dart';
import 'package:flutter_tv/ui/movies_screen.dart';
import 'package:flutter_tv/ui/widgets/platform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (MyPlatform.isTVOS) {
    RemoteController().init();
  }
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  print(connectivityResult.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const screen = MoviesScreen();
    return MaterialApp(
      home: BlocProvider<MoviesBloc>(
          create: (_) => MoviesBloc()..init(),
          child: isScaled
              ? ScaleWidget(
                  child: screen,
                )
              : screen),
    );
  }
}
