import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pinjamhistory_controller.dart';

class PinjamhistoryView extends GetView<PinjamhistoryController> {
  const PinjamhistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinjamhistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PinjamhistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
