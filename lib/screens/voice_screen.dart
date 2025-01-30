import 'package:flutter/material.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> searchHistory = [
    "Barfiks",
    "Plank",
    "Squat",
    "Dumbell Press",
    "Koşu Antrenmanı",
    "Şınav Çekme",
  ];

  void _addSearchToHistory(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      setState(() {
        searchHistory.add(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 20, 122, 6),
              borderRadius: BorderRadius.circular(99),
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Arama yap...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              onSubmitted: (query) {
                _addSearchToHistory(query);
                _searchController.clear();  
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Geçmiş Aramalar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history, color: Colors.grey),
                    title: Text(searchHistory[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          searchHistory.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      
                      _searchController.text = searchHistory[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
