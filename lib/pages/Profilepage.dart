import 'package:flutter/material.dart';

import '../widgets/BackgroundTab.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundTab(
      childwiget: Container(
        color: Colors.cyan,
        height: 200,
      ),
    );
  }
}
