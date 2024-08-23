import 'package:fluent_ui/fluent_ui.dart';

import 'pages/about_page.dart';
import 'pages/dictionaries_page.dart';
import 'pages/language_page.dart';
import 'pages/models_page.dart';
import 'pages/theme_page.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Index of the currently selected item
  int _currentIndex = 0;

  // Display mode of the navigation pane
  PaneDisplayMode displayMode = PaneDisplayMode.open;

  // List of items to display in the navigation pane
  List<NavigationPaneItem> items = [
    // Appearance
    PaneItemHeader(header: const Text('Appearance')),

    PaneItem(
      icon: const Icon(FluentIcons.color),
      title: const Text('Theme'),
      body: const ThemePage(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.locale_language),
      title: const Text('Language'),
      body: const LanguagePage(),
    ),

    // Models
    PaneItemHeader(header: const Text('Models')),

    PaneItem(
      icon: const Icon(FluentIcons.machine_learning),
      title: const Text('Models'),
      body: const ModelsPage(),
    ),


    PaneItemHeader(header: const Text('Translation')),

    PaneItem(
      icon: const Icon(FluentIcons.book_answers),
      title: const Text('Dictionaries'),
      body: const DictionariesPage(),
    ),
  ];

  List<NavigationPaneItem> footerItems = [
    PaneItemSeparator(),

    PaneItem(
      icon: const Icon(FluentIcons.info),
      title: const Text('About'),
      body: const AboutPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: const NavigationAppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      pane: NavigationPane(
        size: const NavigationPaneSize(
          openMaxWidth: 250,
        ),
        selected: _currentIndex,
        onChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        displayMode: displayMode, 
        items: items,
        footerItems: footerItems,
      ),
    );
  }
}
