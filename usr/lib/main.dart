import 'package:flutter/material.dart';

void main() {
  runApp(const InfomixApp());
}

class InfomixApp extends StatelessWidget {
  const InfomixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'infomix.id',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const NewsListPage(),
    const Center(child: Text('Halaman Trending Viral')),
    const Center(child: Text('Halaman Bookmark')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('infomix.id'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi untuk pencarian
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data berita bohongan untuk placeholder
    final List<Map<String, String>> dummyNews = List.generate(10, (index) {
      return {
        "title": "Judul Berita Menarik #${index + 1}",
        "summary": "Ini adalah ringkasan singkat dari berita yang sedang ditampilkan. Konten ini nantinya akan diambil dari RSS feed portal berita di Indonesia.",
        "source": "Portal Berita ${index % 3 + 1}",
      };
    });

    return ListView.builder(
      itemCount: dummyNews.length,
      itemBuilder: (context, index) {
        final newsItem = dummyNews[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Placeholder untuk thumbnail
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsItem['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        newsItem['summary']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        newsItem['source']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500], fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
