import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled18practice/models/agent_model.dart';
import 'package:untitled18practice/models/universal_model.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<UniversalModel> getHeroes() async {
    String url = 'https://valorant-api.com/v1/agents';
    try {
      final response = await dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalModel(
            data: (response.data['data'] as List)
                .map((e) => Agent(
                    displayName: e['displayName'],
                    developerName: e['developerName'],
                    displayIcon: e['displayIcon'],
                    backgroundGradientColors: e['backgroundGradientColors']))
                .toList());
      }
      return UniversalModel(error: 'Status code not equal to 200');
    } catch (e) {
      print(e.toString());
      return UniversalModel(error: e.toString());
    }
  }
}
