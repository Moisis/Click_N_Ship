import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      childwiget: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Account' , style: TextStyle(
                fontSize: 28,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold, color: Color(0xFF355291)),),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    clearlist();
                    Navigator.pushNamedAndRemoveUntil(context,"/splash", (route) => false);

                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                       ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void clearlist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('Carts');
  }
}
