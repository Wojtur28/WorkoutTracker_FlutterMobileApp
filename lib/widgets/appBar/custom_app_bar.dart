import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("WorkoutTracker"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String result) {
            switch (result) {
              case 'Training':
                Navigator.pushNamed(context, '/training');
                break;
              case 'User':
                Navigator.pushNamed(context, '/user');
                break;
              case 'Profile':
                Navigator.pushNamed(context, '/profile');
                break;
              default:
              // Handle unknown cases if necessary
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'User',
              child: Text('User'),
            ),
            const PopupMenuItem<String>(
              value: 'Training',
              child: Text('Training'),
            ),
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
