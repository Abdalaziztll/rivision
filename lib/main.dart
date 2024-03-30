import 'package:flutter/material.dart';
import 'package:value_notfi_and_nav_bar/model/book_model.dart';
import 'package:value_notfi_and_nav_bar/serice/book_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> pages = [HomePageWithApi(), SearchPage(), HelpPage()];

int selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
          animationDuration: Duration(seconds: 4),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.facebook),
                tooltip: 'fake facebook',
                icon: Icon(Icons.home),
                label: 'HomePage'),
            NavigationDestination(icon: Icon(Icons.card_travel), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.help), label: 'Help')
          ]),
    ));
  }
}

class HomePageWithApi extends StatelessWidget {
  HomePageWithApi({
    super.key,
  });

  ValueNotifier<List<BookModel>> books = ValueNotifier([]);

  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () async {
              counter.value++;
              List<BookModel> temp = await getBook();

              // books.value.addAll(temp);
              books.value = temp;
            },
            child: Text("Get Data")),
      ),

      // body: Center(
      //     child: ValueListenableBuilder(
      //   valueListenable: counter,
      //   builder: (context, value, child) {
      //     return Text(value.toString());
      //   },
      // )),
      body: ValueListenableBuilder(
          valueListenable: books,
          builder: (context, value, _) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Image.network(value[index].cover_image),
                ),
                title: Text(value[index].title),
                subtitle: Text(value[index].author),
              ),
            );
          }),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Fut,
    );
  }
}
