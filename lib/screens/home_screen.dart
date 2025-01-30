import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // AppBar
      appBar: AppBar(
        
        title: const Text(
          'Ana Sayfa',
          style: TextStyle(
            color: Colors.black, // Yazı rengi
            fontSize: 20, // Yazı boyutu
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

      

     
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(160),
                  child: SizedBox(
                    width: double.infinity,
                    child: DotLottieLoader.fromAsset(
                      "assets/motions/home.lottie",
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

         
          Positioned(
            top: 16,
            left: 16,
            child: Text(
             '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                shadows: [
             
                ],
              ),
            ),
          ),
        ],
      ),

     
      bottomNavigationBar: const BottomMenu(),
      
      

      
      drawer: Drawer(
       // backgroundColor: colors["surface"],
        elevation: 0,
        child: Column(
          children: [
            
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
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(
              CupertinoIcons.home,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: const Icon(
              Icons.check_circle,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(
              CupertinoIcons.person,
            ),
          ),
        ],
      ),
    );
  }
}
