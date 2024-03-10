import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// Widget App : pourrait être dans un fichier à part
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

// Ecran Home : pourrait être dans un fichier à part
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home"),
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 0),
        body: const Center(
          child: Icon(Icons.home),
        ));
  }
}

// Ecran Profil : pourrait être dans un fichier à part
class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Profil"),
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 1),
        body: const Center(
          child: Icon(Icons.person),
        ));
  }
}

// Ecran Likes : pourrait être dans un fichier à part
class Likes extends StatelessWidget {
  const Likes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Likes"),
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 2),
        body: const Center(
          child: Icon(Icons.favorite),
        ));
  }
}

// Un widget dédié pour notre bottom navbar : pourrait être dans un fichier à part
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Likes",
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) => _navigate(context, index),
    );
  }

  // Gestion de la navigation en fonction de l'index cliqué
  _navigate(BuildContext context, int index) {
    late Widget destination;

    switch (index) {
      case 0:
        destination = const Home();
        break;
      case 1:
        destination = const Profil();
        break;
      case 2:
        destination = const Likes();
        break;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));
  }
}
