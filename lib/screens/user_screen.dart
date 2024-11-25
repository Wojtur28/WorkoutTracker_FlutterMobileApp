import 'package:flutter/material.dart';
import '../widgets/appBar/custom_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("This is the User Screen"),
      ),
    );
  }
}
