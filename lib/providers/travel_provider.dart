import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProdiver = StateNotifierProvider<TravelNotifier, Map<String, dynamic>>((ref) => TravelNotifier());

class TravelNotifier extends StateNotifier<Map<String, dynamic>> {
  TravelNotifier(): super({
    'isLoading': false,
    'travel': null,
  });

  int _findVisitById(String id) {
    if (state['travel'] == null) {
      return -1;
    }

    return state['travel'].visits.indexWhere((Visit visit) => visit.id == id);
  }

  Future<void> loadTravel(id) async {
    state = {...state, 'isLoading': true};

    Travel travel = await TravelService.get(id);

    state = {...state, 'isLoading': false, 'travel': travel};
  }

  Future<void> updateVisit(Visit visit) async {
    final idx = _findVisitById(visit.id);

    if (idx != -1) {
      //? create a new array of visits.
      final updatedVisits = List<Visit>.from(state['travel'].visits);
      updatedVisits[idx] = visit.copyWith();

      //? update the visit in the database.
      await VisitService.update(visit);

      //? update the state with the updated visits.
      state = {...state, 'travel': state['travel']!.copyWith(visits: updatedVisits)};
    }
  }
}