import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const String usersKey = "users";
  static const String currentUserKey = "currentUser";

  /// **Tüm kullanıcıları getirir**
  static Future<List<Map<String, String>>> getAllUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersJson = prefs.getString(usersKey);
    if (usersJson == null) return [];

    List<dynamic> usersList = json.decode(usersJson);
    return usersList.map((e) => Map<String, String>.from(e)).toList();
  }

  /// **Yeni kullanıcı ekler**
  static Future<bool> addUser(String name, String email, String password) async {
    List<Map<String, String>> users = await getAllUsers();

    // Eğer bu e-posta ile zaten kayıtlı bir hesap varsa kayıt etmeyelim.
    bool userExists = users.any((user) => user["email"] == email);
    if (userExists) return false;

    users.add({"name": name, "email": email, "password": password});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(usersKey, json.encode(users));

    return true;
  }

  /// **Belirtilen e-posta ile kullanıcıyı getirir**
  static Future<Map<String, String>?> getUserByEmail(String email) async {
    List<Map<String, String>> users = await getAllUsers();
    return users.firstWhere((user) => user["email"] == email, orElse: () => {});
  }

  /// **Giriş yapan kullanıcıyı kaydeder**
  static Future<void> setCurrentUser(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(currentUserKey, email);
  }

  /// **Oturum açan kullanıcıyı getirir**
  static Future<Map<String, String>?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(currentUserKey);
    if (email == null) return null;

    return await getUserByEmail(email);
  }

  /// **Çıkış yap (currentUser bilgisini sıfırla)**
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(currentUserKey);
  }
}
