import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white, 
        title: const Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: Column(
          children: [
          // Drawer Header
            Container(
              height: 200,
          //color: Colors.blue,
            child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    CircleAvatar(
      radius: 40, // Yuvarlak çerçeve boyutu
      backgroundImage: AssetImage('assets/images/pp.jpg'), // Resim yolu
      backgroundColor: Colors.black, // Arka plan rengi
    ),
    const SizedBox(height: 10),
    const Text(
      'Buğra Kasapoğlu',
      style: TextStyle(
        color: Color.fromARGB(255, 156, 154, 154),
        fontSize: 18,
      ),
    ),
  ],
),

            ),
            // Menü öğeleri
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
                Navigator.pop(context);
              },
            ),

              ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () {
                context.go("/profile");
              },
            ),

              ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset("assets/motions/home.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                  ),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed:(){
              context.go("/home");
            }, 
            icon: Icon(
            CupertinoIcons.home,
            )
          ),
    
        IconButton(
          onPressed: () {
            context.go("/search");
          },
          icon: Icon(
            CupertinoIcons.search,
          ),
        ),
    
       IconButton(
          onPressed: () {
            context.go("/voice");
          },
          icon: Icon(
            Icons.android,
          ),
        ),
    
        IconButton(
          onPressed: () {
            context.go("/history");
          },
          icon: Icon(
            Icons.history,
          ),
        ),
    
      IconButton(
          onPressed: () {
            context.go("/profile");
          },
          icon: Icon(
            CupertinoIcons.person,
          ),
        ),
    
    
    
    
        ], 
      )
    );
  }
}