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
        title: const Text(
          'Ana Sayfa',
          style: TextStyle(
            color: Colors.black, // Yazı rengi
            fontSize: 18, // Yazı boyutu
            fontWeight: FontWeight.normal, // Yazı tipi
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),

      // Fitness Asistan Yazısı
      body: Stack(
        children: [
          Column(
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

          // Sol üst köşe yazısı
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'Fitness Asistan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  Shadow(
                    offset: Offset(-2.0, -2.0),
                    blurRadius: 3.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        child: Column(
          children: [
          // Drawer Header
            Container(
              height: 200,
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
            Icons.check_circle,
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