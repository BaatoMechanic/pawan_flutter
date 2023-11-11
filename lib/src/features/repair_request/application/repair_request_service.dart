// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mechanic_baato/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:mechanic_baato/src/features/repair_request/domain/vehichle_repair_request.dart';
import 'package:mechanic_baato/src/utils/validators/in_memory_store.dart';
import 'package:mechanic_baato/src/utils/validators/model_utils.dart';

class RepairRequestService {
  RepairRequestService({
    required this.ref,
  });

  final _repairRequestState = InMemoryStore<VehicleRepairRequest?>(null);
  Ref ref;

  Stream<VehicleRepairRequest?> _repairRequestStateChanges() =>
      _repairRequestState.stream;
  VehicleRepairRequest? get activeRepairRequest => _repairRequestState.value;

  void setActiveRepairRequest(VehicleRepairRequest request) {
    _repairRequestState.value = request;
  }

  Future<dynamic> createVehicleRepairRequest(
      Map<String, dynamic> requestInfo) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .requestForVehicleRepair(requestInfo);

    if (response is Success) {
      VehicleRepairRequest repairRequest = VehicleRepairRequest.fromJson(
          jsonDecode((response.response as Response).body.toString()));
      return repairRequest;
    }
    return false;
    // return response;
  }

  Future<dynamic> addImagesToVechicleRepairRequest(
      String requestId, List<File> images) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .addImagesToRepairRequest(requestId, images);
    if (response is Success) {
      VehicleRepairRequest repairRequest = VehicleRepairRequest.fromJson(
          jsonDecode((response.response as Response).body.toString()));
      _repairRequestState.value = repairRequest;
      return repairRequest;
    }
    if (response is Failure) {
      throw Exception("Couldn't add Images");
    }
    return response;
  }

  fetchUserRepairRequests(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await ref
        .read(repairRequestRepositoryProvider)
        .fetchUserRepairRequest(userId);
    if (response is Success) {
      List<VehicleRepairRequest> repairRequests =
          vehicleRepairRequestsFromJson((response.response as Response).body);
      if (repairRequests.isEmpty) return false;
      // ref
      //     .read(repairRequestControllerProvider.notifier)
      //     .setRepairRequest(repairRequests.first);
      setActiveRepairRequest(repairRequests.first);
      return true;
    }
    print('here');
    return false;
  }

  void dispose() => _repairRequestState.close();
}

final repairRequestServiceProvider = Provider((ref) {
  final serviceProvider = RepairRequestService(ref: ref);
  ref.onDispose(() => serviceProvider.dispose());
  return serviceProvider;
});

final watchRepairRequestStateChangesProvider = StreamProvider((ref) {
  final serviceProvider = ref.watch(repairRequestServiceProvider);
  return serviceProvider._repairRequestStateChanges();
});
