import 'package:flutter/material.dart';
import 'package:flutter_random_year_api_app/controller/function_provider.dart';
import 'package:flutter_random_year_api_app/model/data_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataModel _data;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final provider = Provider.of<FunctionProvider>(context, listen: false);
    final fetchedData = await provider.fetchDataFromAPI();
    setState(() {
      _data = fetchedData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Text: ${_data.text}'),
                Text('Found: ${_data.found}'),
                Text('Number: ${_data.number}'),
                Text('Type: ${_data.type}'),
                Text('Date: ${_data.date}'),
                ElevatedButton(
                  onPressed: () {
                    _fetchData();
                  },
                  child: const Text('Fetch'),
                )
              ],
            ),
    );
  }
}
