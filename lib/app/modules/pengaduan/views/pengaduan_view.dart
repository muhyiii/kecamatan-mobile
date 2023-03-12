import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaduan_controller.dart';

class PengaduanView extends GetView<PengaduanController> {
  const PengaduanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengaduanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengaduanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
