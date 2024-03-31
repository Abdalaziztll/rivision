import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:value_notfi_and_nav_bar/service/cat_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: getCat(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CounterPage(),
                            ));
                      },
                      trailing: Text((index + 1).toString()),
                      leading: Image.network(snapshot.data![index].image),
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].origin),
                    ),
                  );
                },
              );
            } else {
              return LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {}

  int counter = 0;
  double width = 100;
  double height = 100;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterPagewihtoutStatfull(),
                  ));
            },
            icon: Icon(Icons.countertops)),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: width,
          height: height,
          color: color,
          child: Center(
            child: Text(
              counter.toString(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              counter++;
              print(counter);
              width = width + 70;
              height = height + 70;
              color = Colors.red;
            },
          );
        },
      ),
    );
  }
}

class CounterPagewihtoutStatfull extends StatelessWidget {
  CounterPagewihtoutStatfull({super.key});

  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: counter,
        builder: (context, value, child) {
          return Text(value.toString());
        },
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        counter.value++;
      }),
    );
  }
}
