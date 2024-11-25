import 'package:flutter/material.dart';
import '../widgets/appBar/custom_app_bar.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("This is the Training Screen"),
      ),
    );
  }
}
