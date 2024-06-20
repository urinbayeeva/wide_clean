import 'package:flutter/material.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class MenuSaved extends StatelessWidget {
  const MenuSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        title: "Saqlanganlar",
        isSearch: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Hozircha Saqlanganlar yo'q"))],
      ),
    );
  }
}
