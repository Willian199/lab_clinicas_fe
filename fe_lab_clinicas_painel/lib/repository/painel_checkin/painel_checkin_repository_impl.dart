import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/core/env.dart';
import 'package:fe_lab_clinicas_painel/model/painel_checkin_model.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import './painel_checkin_repository.dart';

class PainelCheckinRepositoryImpl with DDIInject<RestClient> implements PainelCheckinRepository {
  PainelCheckinRepositoryImpl();

  @override
  Stream<List<PainelCheckinModel>> getTodayPanel(WebSocketChannel webSocketChannel) async* {
    yield await requestData();
    yield* webSocketChannel.stream.asyncMap((_) async => requestData());
  }

  @override
  ({WebSocketChannel channel, Function dispose}) openChannelSocket() {
    final channel = WebSocketChannel.connect(Uri.parse('${Env.webSocketbackendBaseUrl}?tables=painelCheckin'));

    return (
      channel: channel,
      dispose: channel.sink.close,
    );
  }

  Future<List<PainelCheckinModel>> requestData() async {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final Response(:List data) = await instance.auth.get('/painelCheckin', queryParameters: {
      'time_called': dateFormat.format(DateTime.now()),
    });

    return data.reversed.take(7).map((e) => PainelCheckinModel.fromJson(e)).toList();
  }
}
