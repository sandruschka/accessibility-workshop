import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:accessibility_workshop/presentation/home_page.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';
import 'theme/util.dart';

void main() {
  runApp(const MyApp(
    enableAccessibilityTool: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.enableAccessibilityTool});
  final bool enableAccessibilityTool;

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "AR One Sans", "ABeeZee");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      builder: (context, child) {
        if (enableAccessibilityTool) child = AccessibilityTools(child: child);

        child = MediaQuery(
          data: MediaQuery.of(context) /* .copyWith(textScaler: MediaQuery.of(context).textScaler) */,
          child: child!,
        );
        return child;
      },
      home: const HomePage(),
    );
  }
}
