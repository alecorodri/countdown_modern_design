import 'package:countdown_modern_design/providers/countdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final countdounProvider = Provider.of<CountdounProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CountDown"),
        actions: [
          IconButton(
              onPressed: () {
                // Reiniciar el timer
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),
      body: const _CounterView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countdounProvider.startStopTimer();
        },
        tooltip: 'Start',
        child:
            Icon(countdounProvider.isRunning ? Icons.pause : Icons.play_arrow),
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
        children: [
          const Icon(
            Icons.timer_outlined,
            color: Colors.blue,
            size: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            context.select(
                (CountdounProvider countdown) => countdown.timeLeftString),
            style: const TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
