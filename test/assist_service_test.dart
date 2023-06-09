import 'dart:convert';
import 'dart:io';

import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';
@GenerateMocks([AssistanceProviderInterface])
void main() {
  late AssistanceProviderInterface providerInterface;
  late AssistanceService assistanceService;
  setUp(() async{
    providerInterface = MockAssistanceProviderInterface();
    assistanceService = AssistanceService().init(providerInterface);
    var json = File("${Directory.current.path}/test/resources/assists.json").readAsStringSync();
    when(providerInterface.getAssists()).thenAnswer((_) async => Future.sync(() => Response(body: jsonDecode(json), statusCode: HttpStatus.ok)));
  });
  test('Test de listagem de assistencia', () async {
    List<Assist> list = await assistanceService.getAssists();
    expect(list.length, 6);
  });
}
