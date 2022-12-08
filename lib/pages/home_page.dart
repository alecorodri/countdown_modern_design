import 'dart:math';

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:countdown_modern_design/providers/countdown_provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
      backgroundColor: const Color(0xFFE7ECEF),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color(0xFFE7ECEF),
        centerTitle: true,
        title: const Text(
          "Countdown",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                countdounProvider
                    .setCountdownDuration(const Duration(seconds: 60));
              },
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: const _CounterView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 253, 85, 85),
        onPressed: () {
          countdounProvider.startStopTimer();
        },
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
    double size = Random().nextInt(150) + 200.toDouble();
    Color baseColor = const Color(0xFFF2F2F2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClayContainer(
              color: baseColor,
              height: 80,
              width: 80,
              borderRadius: 75,
              curveType: CurveType.none,
              child: const Center(
                  child: Text('10"',
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(
              width: 50,
            ),
            ClayContainer(
              // child:  GestureDetector(
              //   onTap: () {},
              //   child: Center(
              //       child: Text('15"',
              //           style: TextStyle(color: Colors.black, fontSize: 30))),
              // ),
              color: baseColor,
              height: 80,
              width: 80,
              borderRadius: 75,
              curveType: CurveType.none,
            ),
            const SizedBox(
              width: 50,
            ),
            ClayContainer(
              color: baseColor,
              height: 80,
              width: 80,
              borderRadius: 75,
              curveType: CurveType.none,
              child: const Center(
                  child: Text('20"',
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
          ],
        ),
        Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 550),
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFFE7ECEF),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-20, -20),
                    blurRadius: 60,
                    color: Colors.white,
                    inset: context.select(
                        (CountdounProvider countdown) => countdown.isRunning)),
                BoxShadow(
                    offset: const Offset(20, 20),
                    blurRadius: 60,
                    color: const Color(0xFFBEBEBE),
                    inset: !context.select(
                        (CountdounProvider countdown) => countdown.isRunning)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: !context.select(
                          (CountdounProvider countdown) => countdown.isRunning)
                      ? Colors.grey
                      : Colors.black,
                  size: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  context.select((CountdounProvider countdown) =>
                      countdown.timeLeftString),
                  style: TextStyle(
                      fontSize: 50,
                      color: !context.select((CountdounProvider countdown) =>
                              countdown.isRunning)
                          ? Colors.grey
                          : Colors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
