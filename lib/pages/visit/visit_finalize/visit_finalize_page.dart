import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/common/scrollable_content_with_button_layout_page.dart';

import 'package:shipping_pilot/services/index.dart';

class VisitFinalizePage extends ConsumerStatefulWidget {
  static const String name = 'VisitFinalize';

  final int idx;

  const VisitFinalizePage({super.key, required this.idx});

  @override
  VisitFinalizePageState createState() => VisitFinalizePageState();
}

class VisitFinalizePageState extends ConsumerState<VisitFinalizePage> {
  String _selected = 'successful';

  @override
  Widget build(BuildContext context) {
    final travel = ref.watch(travelProdiver)["travel"];    
    final Visit visit = travel.visits[widget.idx];

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () async {
          visit.status = _selected;
          //TODO: agregar este update en riverpod.
          await VisitService.update(visit);
        },
        child: const Text('Guardar'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
            title: const Text('Exitosa'),
            value: 'successful',
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
              });
            }
          ),
          RadioListTile(
            title: const Text('Fallida'),
            value: 'failed',
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
