import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  String? userEmail;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("name");
    String? email = prefs.getString("email");

    if (name != null && email != null) {
      setState(() {
        userName = name;
        userEmail = email;
        isLoggedIn = true;
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      userName = null;
      userEmail = null;
      isLoggedIn = false;
    });

    context.go("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: isLoggedIn ? _buildProfileView() : _buildLoginPrompt(),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  /// **Giriş Yapmış Kullanıcının Görünümü**
  Widget _buildProfileView() {
    return Container(
      width: double.infinity,
      height: double.infinity, // Tüm ekranı kaplar
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/profile_avatar.png"), // Profil fotoğrafı eklenebilir
            ),
          ),
          const SizedBox(height: 10),
          Text(
            userName ?? "Kullanıcı Adı",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            userEmail ?? "E-Posta",
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 30),

          /// **Profil Seçenekleri**
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileOption(Icons.history, "Aktivitelerim"),
                _buildProfileOption(Icons.notifications, "Bildirimler"),
                _buildProfileOption(Icons.settings, "Ayarlar"),
                _buildProfileOption(Icons.help_outline, "Yardım"),
              ],
            ),
          ),

          /// **Çıkış Yap Butonu**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Çıkış Yap", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Giriş Yapmamış Kullanıcıya Giriş Butonu Göster**
  Widget _buildLoginPrompt() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.white),
            const SizedBox(height: 10),
            const Text(
              "Giriş Yapınız",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push("/login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "Giriş Yap",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Profil Seçenekleri Kartı**
  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Hafif şeffaf görünüm
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white, size: 30),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
          onTap: () {
            // İlgili sayfaya yönlendirme yapılabilir
          },
        ),
      ),
    );
  }
}
