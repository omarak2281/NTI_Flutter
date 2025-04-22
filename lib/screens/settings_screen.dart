import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'Lexend Deca'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text(
              'Language',
              style: TextStyle(fontFamily: 'Lexend Deca'),
            ),
            trailing: ToggleButtons(
              isSelected: isSelected,
              onPressed: (index) {
                setState(() {
                  isSelected = [index == 0, index == 1];
                });
              },
              borderRadius: BorderRadius.circular(8),
              selectedColor: Colors.white,
              fillColor: Colors.green,
              color: Colors.black,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('AR', style: TextStyle(fontFamily: 'Lexend Deca')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('EN', style: TextStyle(fontFamily: 'Lexend Deca')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}