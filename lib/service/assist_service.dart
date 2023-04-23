import 'package:abc_tech_app/model/assist.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/utils.dart';
import '../provider/assist_provider.dart';

class AssistanceService extends GetxService {
  late AssistanceProviderInterface _assistanceProvider;

  AssistanceService init(AssistanceProviderInterface providerInterface) {
    _assistanceProvider = providerInterface;
    return this;
  }

  Future<List<Assist>> getAssists() async{
    Response response = await _assistanceProvider.getAssists();
    if(response.hasError){
      return Future.error(ErrorDescription("Erro na conexão"));
    }
    try{
      List<Assist> list = response.body.map<Assist>((item) => Assist.fromMap(item)).toList();
      return Future.sync(() => list);
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription(e.toString()));
    }
  }
}