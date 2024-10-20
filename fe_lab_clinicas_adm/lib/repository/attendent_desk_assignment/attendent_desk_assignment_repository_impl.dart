import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class AttendantDeskAssignmentRepositoryImpl with DDIInject<RestClient> implements AttendantDeskAssignmentRepository {
  AttendantDeskAssignmentRepositoryImpl();

  @override
  Future<Either<RepositoryException, Unit>> startService(int deskNumber) async {
    final response = await _clearDeskByUser();

    switch (response) {
      case Left(value: final exception):
        return Left(exception);
      case Right():
        await instance.auth.post(
          '/attendantDeskAssignment',
          data: {
            'user_id': '#userAuthRef',
            'desk_number': deskNumber,
            'date_created': DateTime.now().toIso8601String(),
            'status': 'Available',
          },
        );

        return Right(unit);
    }
  }

  Future<({String id, int deskNumber})?> _getDeskByUser() async {
    final Response(:List data) = await instance.auth.get(
      '/attendantDeskAssignment',
      queryParameters: {'user_id': '#userAuthRef'},
    );

    if (data
        case List(
          isNotEmpty: true,
          first: {'id': final String id, 'desk_number': final int deskNumber},
        )) {
      return (id: id, deskNumber: deskNumber);
    }

    return null;
  }

  Future<Either<RepositoryException, Unit>> _clearDeskByUser() async {
    try {
      final desk = await _getDeskByUser();

      if (desk != null) {
        await instance.auth.delete('/attendantDeskAssignment/${desk.id}');
      }

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao remover número de guichê.', error: e, stackTrace: s);

      return Left(RepositoryException(message: 'Erro ao remover número de guichê.'));
    }
  }

  @override
  Future<Either<RepositoryException, int>> getDeskAssignment() async {
    try {
      final Response(data: List(first: data)) = await instance.auth.get(
        '/attendantDeskAssignment',
        queryParameters: {
          'user_id': '#userAuthRef',
        },
      );

      return Right(data['desk_number']);
    } on DioException catch (e, s) {
      log('Erro ao buscar número do guichê.', error: e, stackTrace: s);

      return Left(RepositoryException(message: 'Erro ao buscar número do guichê.'));
    }
  }
}
