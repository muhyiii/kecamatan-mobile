import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/potensi_desa_controller.dart';

class PotensiDesaView extends GetView<PotensiDesaController> {
  const PotensiDesaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PotensiDesaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PotensiDesaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
