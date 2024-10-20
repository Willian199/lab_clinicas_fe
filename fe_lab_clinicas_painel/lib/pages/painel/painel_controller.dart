import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/model/painel_checkin_model.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelController with DDIInject<PainelCheckinRepository> {
  PainelController();

  Function? _socketDispose;

  final painelData = listSignal<PainelCheckinModel>([]);

  Connect? _painelConnect;

  void listenerPainel() {
    final (:channel, :dispose) = instance.openChannelSocket();

    _socketDispose = dispose;

    _painelConnect = connect(painelData);

    final painelStream = instance.getTodayPanel(channel);

    _painelConnect!.from(painelStream);
  }

  void dispose() {
    _painelConnect?.dispose();
    _socketDispose?.call();
  }
}
