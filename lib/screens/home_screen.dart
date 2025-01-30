import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/main.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).brightness == Brightness.light
                    ? Colors.green // Açık modda yeşil (doğa, sağlık)
                    : Colors.teal,  // Koyu modda daha koyu yeşil tonları
                Theme.of(context).brightness == Brightness.light
                    ? Colors.orange // Enerjik turuncu
                    : Colors.blueGrey, // Koyu modda soğuk tonlar
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Fitness Asistan',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white // Açık modda beyaz
                    : Colors.white70, // Koyu modda daha soluk beyaz
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.moon,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                onPressed: () {
                  // Koyu/Açık mod geçişi
                  final brightness =
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark;
                  final theme = ThemeData(brightness: brightness);
                  MyApp.of(context)?.setTheme(theme);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 8,
        child: Column(
          children: [
            const SizedBox(height: 40),

            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Geçmiş'),
              onTap: () {
                context.go("/search");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.checkmark_alt_circle_fill),
              title: const Text('Tamamlanmış Egzersizler'),
              onTap: () {
                context.go("/voice");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () {
                context.go("/profile");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Bugün Hedefin Ne?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FitnessCard(
                    icon: CupertinoIcons.double_music_note,
                    title: 'Egzersiz Başlat',
                    onTap: () {},
                  ),
                  FitnessCard(
                    icon: CupertinoIcons.time,
                    title: 'Antrenman Programı',
                    onTap: () {},
                  ),
                  FitnessCard(
                    icon: CupertinoIcons.check_mark_circled,
                    title: 'Tamamlanmışlar',
                    onTap: () {
                      context.go("/voice");
                    },
                  ),
                  FitnessCard(
                    icon: CupertinoIcons.heart_fill,
                    title: 'Sağlık Takibi',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class FitnessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const FitnessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade100 // Açık modda yumuşak yeşil
            : Colors.green.shade700, // Koyu modda koyu yeşil
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade50
            : Colors.green.shade800,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(CupertinoIcons.home),
          ),
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: const Icon(CupertinoIcons.checkmark_alt_circle_fill),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
