import 'package:flutter/material.dart';
import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  String? dogImageUrl;

  @override
  void initState() {
    super.initState();
    _loadDogImage();
  }

  Future<void> _loadDogImage() async {
    try {
      String url = await apiService.fetchRandomDogImage();
      setState(() {
        dogImageUrl = url;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foto Segawon Random')),
      body: Center(
        child: dogImageUrl == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(dogImageUrl!),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _loadDogImage,
                    child: Text('Entukno Gambar Segawon Liyane'),
                  ),
                ],
              ),
      ),
    );
  }
}
