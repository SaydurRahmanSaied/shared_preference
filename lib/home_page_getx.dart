import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageGetX extends StatefulWidget {
  const HomePageGetX({super.key, required this.title});

  final String title;

  @override
  State<HomePageGetX> createState() => _HomePageGetXState();
}

class _HomePageGetXState extends State<HomePageGetX> {
  //get x variable for observe
  var _counter = 0.obs;

  void _incrementCounter() async {

      _counter++;

    //save value in shared preference
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("counter", _counter.value);
  }

  loadValues() async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
      _counter.value=sp.getInt("counter") ?? 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadValues();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            Obx(()=> Text(_counter.value.toString(), style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}