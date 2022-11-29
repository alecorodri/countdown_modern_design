import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CountDown"),
        actions: [
          IconButton(
              onPressed: () {
                //TODO Reiniciar el timer
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),
      // body: _CounterView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO Start Timer
        },
        tooltip: 'Start',
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.timer_10_outlined,
            color: Colors.blue,
            size: 60,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '00:30',
            style: TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
