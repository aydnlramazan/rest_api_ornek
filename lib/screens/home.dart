// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/Api_Service.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  List<UserModel>? userModel = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var users = await ApiService().getUser();
    setState(() {
      userModel = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RestApi Ornek"),
      ),
      body: userModel == null || userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userModel!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userModel![index].name),
                  subtitle: Text(userModel![index].email),
                );
              },
            ),
    );
  }
}
