import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon_flutter/poke_list_item.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentbnb = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentbnb == 0 ? const PokeList() : const Settings(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () => currentbnb = index,
          )
        },
        currentIndex: currentbnb,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          )
        ],
      ),
    );
  }
}

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: 898,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
        ),
      ],
    );
  }
}
