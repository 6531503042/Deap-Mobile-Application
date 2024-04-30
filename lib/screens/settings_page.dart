import 'package:flutter/material.dart';
import '../theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: Provider.of<ThemeStateProvider>(context).isDarkTheme,
            onChanged: (value) {
              Provider.of<ThemeStateProvider>(context, listen: false)
                  .toggleTheme();
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Other Settings...',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
