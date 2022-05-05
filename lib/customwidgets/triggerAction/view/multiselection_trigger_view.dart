
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

class MultiSelectionTriggerActionView extends StatelessWidget {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;

  const MultiSelectionTriggerActionView(
      {Key? key, required this.multiSelectionTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = DataPointBloc(multiSelectionTriggerAction.dataPoint!);
    if (multiSelectionTriggerAction.dataPoint == null ||
        multiSelectionTriggerAction.selections.length < 2) {
      return const Text("Error");
    }

    return BlocBuilder<DataPointBloc, DataPointState>(
      builder: (context, state) {
        if(!multiSelectionTriggerAction.selections.containsValue(state.value.toString())) {
          return const Text("Error 404");
        }
        return DropdownButtonFormField<String>(
          items: multiSelectionTriggerAction.selections.keys.map((e) => DropdownMenuItem<String>(child: Text(e), value: multiSelectionTriggerAction.selections[e],)).toList(),
          onChanged: (d)  {
            if(multiSelectionTriggerAction.selections.containsValue(d)) {
              dynamic value = d;
              if(int.tryParse(value.toString()) != null) {
                value = int.parse(value.toString());
              } else if(value == "true" || value == "false") {
                value = value == "true";
              } else if(double.tryParse(value.toString()) != null) {
                value = double.parse(value.toString());
              }

              bloc.add(DataPointValueUpdateRequest(value: value));
            }

          },

          value: state.value.toString(),
          decoration: const InputDecoration(border: OutlineInputBorder()),
        );


      },
      bloc: bloc ,
    );
  }
}
