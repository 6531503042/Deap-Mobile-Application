import 'package:dentist_appointment/localization/Language/languages.dart'; // Adjust import path as needed
import 'package:dentist_appointment/localization/locale-constans.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/language_model.dart'; // Adjust import path as needed
import '../theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Setting',
          style: GoogleFonts.urbanist(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text('Dark Mode'),
                    value: Provider.of<ThemeStateProvider>(context).isDarkTheme,
                    onChanged: (value) {
                      Provider.of<ThemeStateProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                  LanguageDropDown(), // Integrate the language drop-down widget
                  SizedBox(height: 20), // Add space above the logout button
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20), // Add space below the logout button
            child: Center(
              child: SizedBox(
                height: 60,
                width: 200, // Set width of the button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(
                        40, 195, 176, 100), // Set background color
                  ),
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 1), // Set font color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageDropDown extends StatefulWidget {
  @override
  _LanguageDropDownState createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  late LanguageModel _selectedLanguage;

  @override
  void initState() {
    super.initState();
    // Initialize with the first language if it's not already initialized
    _selectedLanguage = LanguageModel.languageList().first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DropdownButton<LanguageModel>(
          iconSize: 30,
          underline: SizedBox(),
          hint: Text(Languages.of(context)?.labelSelectLanguage ??
              ''), // Handle potential null value
          onChanged: (LanguageModel? language) {
            // Adjust the parameter type to accept nullable LanguageModel
            if (language != null) {
              changeLanguage(context, language.languageCode);
              setState(() {
                _selectedLanguage = language;
              });
            }
          },
          value: _selectedLanguage,
          items: LanguageModel.languageList()
              .map<DropdownMenuItem<LanguageModel>>(
                (e) => DropdownMenuItem<LanguageModel>(
                  value: e, // Ensure e is unique for each item
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
