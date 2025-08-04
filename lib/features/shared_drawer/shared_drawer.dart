import 'package:flutter/material.dart';

class SharedDrawer extends StatelessWidget {
  final Map<String, void Function()> _navigationButtons = {
    'Лист Персонажів': () {},
    'Створення Персонажів': () {},
    'Вибір Теми': () {},
  };

  SharedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _navigationButtons.length,
            itemBuilder: (context, index) => TextButton(
              onPressed: _navigationButtons.entries.elementAt(index).value,
              child: Text(
                _navigationButtons.entries.elementAt(index).key,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
