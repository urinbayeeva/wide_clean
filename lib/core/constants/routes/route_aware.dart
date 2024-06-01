import 'package:flutter/services.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class RouteAwareWidget extends StatefulWidget {
  final Widget child;
  final String routeName;

  const RouteAwareWidget(
      {super.key, required this.child, required this.routeName});

  @override
  // ignore: library_private_types_in_public_api
  _RouteAwareWidgetState createState() => _RouteAwareWidgetState();
}

class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    _setOrientation();
  }

  @override
  void didPopNext() {
    _setOrientation();
  }

  void _setOrientation() {
    if (widget.routeName == '/auth') {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
