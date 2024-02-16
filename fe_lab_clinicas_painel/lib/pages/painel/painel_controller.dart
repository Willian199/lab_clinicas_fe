import 'package:fe_lab_clinicas_painel/model/painel_checkin_model.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelController {
  PainelController({
    required PainelCheckinRepository painelCheckinRepository,
  }) : _painelCheckinRepository = painelCheckinRepository;

  final PainelCheckinRepository _painelCheckinRepository;

  Function? _socketDispose;

  final painelData = listSignal<PainelCheckinModel>([]);

  Connect? _painelConnect;

  void listenerPainel() {
    final (:channel, :dispose) = _painelCheckinRepository.openChannelSocket();

    _socketDispose = dispose;

    _painelConnect = connect(painelData);

    final painelStream = _painelCheckinRepository.getTodayPanel(channel);

    _painelConnect!.from(painelStream);
  }

  void dispose() {
    _painelConnect?.dispose();
    _socketDispose?.call();
  }
}
