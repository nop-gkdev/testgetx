import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:testgetx/models/testmodels.dart';

class Controller extends GetxController {
  var photoList = <AlbumModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbumData();
  }

  Future<void> fetchAlbumData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // ignore: no_leading_underscores_for_local_identifiers
      AlbumModel _albumModel = AlbumModel.fromJson(jsonDecode(response.body));

      photoList.add(
        AlbumModel(
          title: _albumModel.title,
          userId: _albumModel.userId,
          id: _albumModel.id,
          completed: _albumModel.completed,
        ),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
