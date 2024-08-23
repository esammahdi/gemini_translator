import 'package:fluent_ui/fluent_ui.dart';
import 'package:gemini_translator/home/presentation/home_screen.dart';
import 'package:gemini_translator/settings/presentation/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Gemini Translate',
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        visualDensity: VisualDensity.standard,
      ),
      home: const SettingsScreen(),
    );
  }
}
