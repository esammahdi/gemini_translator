import 'package:fluent_ui/fluent_ui.dart';
import 'package:gemini_translator/home/presentation/widgets/my_expander.dart' as custom;

class SidebarContainer extends StatefulWidget {
  const SidebarContainer({
    super.key,
    required this.mainContent,
    required this.sidebarContent,
  });

  final Widget mainContent;
  final Widget sidebarContent;

  @override
  State<SidebarContainer> createState() => _SidebarContainerState();
}

class _SidebarContainerState extends State<SidebarContainer> {
  bool _isSidebarExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Main Content
        Expanded(
          flex: _isSidebarExpanded ? 70 : 95, // 80% when expanded, 95% when collapsed
          child: widget.mainContent,
        ),

        // Sidebar
        Expanded(
          flex: _isSidebarExpanded ? 30 : 5, // 20% when expanded, 5% when collapsed
          child: custom.HorizontalExpander(
            direction: custom.ExpanderDirection.left,
            onStateChanged: (isExpanded) {
              setState(() {
                _isSidebarExpanded = isExpanded;
              });
            },
            content: widget.sidebarContent,
          ),
        ),
      ],
    );
  }
}