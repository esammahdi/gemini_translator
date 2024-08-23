import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/presentation/widgets/coming_soon.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ComingSoon);
  }
}