import 'package:driver/pages/alert/alert.dart';
import 'package:driver/state/bottom_nav_bar/bottom_nav_logic.dart';
import 'package:driver/state/contract/contract_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final conLogic = Get.find<ContractLogic>();
  final navLogic = Get.find<BottomNavLogic>();

  @override
  void initState() {
    conLogic.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AppAlertDialog(
                        onConfirm: () {},
                        title: 'Log out',
                        subtitle: '',
                      ));
            },
            child: const Card(
              elevation: 2,
              // height: 20,
              // width: 30,
              // decoration: const BoxDecoration(
              //     color: Colors.white, shape: BoxShape.circle),

              child: Padding(
                  padding: EdgeInsets.all(10), child: Icon(Icons.exit_to_app)),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 15.h,
              width: 100.w,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(15)),
              child: const Row(
                children: [
                  Text(
                    'Total Earned',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 2,
                  )),
                  Text(
                    '0 ETH',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Container(
                  height: 15.h,
                  width: 42.w,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reward',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 10,
                  ),
                ),
                Container(
                  height: 15.h,
                  width: 42.w,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
                child: SizedBox(
              height: 1,
            )),
            GestureDetector(
              onTap: () {
                navLogic.changeTap(1);
                conLogic.getLocation();
              },
              child: Container(
                width: 100.w,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green[800]),
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
