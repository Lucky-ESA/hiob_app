import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/customwidgets/triggerAction/slider_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';

import '../../../manager/manager.dart';

class SliderTriggerActionSettings extends TriggerActionSetting {
  final SliderTriggerAction sliderTriggerAction;
  const SliderTriggerActionSettings({Key? key, required this.sliderTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceSelection(
          customWidgetManager: Manager.instance!.customWidgetManager,
          onDeviceSelected: (d) => {sliderTriggerAction.dataPoint == null},
          onDataPointSelected: (d) => {sliderTriggerAction.dataPoint = d},
          selectedDevice: sliderTriggerAction.dataPoint?.device,
          selectedDataPoint: sliderTriggerAction.dataPoint,
          dataPointLabel: "Datapoint",
          deviceLabel: "Device",

        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController.fromValue(TextEditingValue(text: sliderTriggerAction.min.toString())),
                decoration: const InputDecoration(labelText: "Min"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (v) => sliderTriggerAction.min = int.tryParse(v) ?? 0,
              ),
            ),
            Container(width: 10,),
            Expanded(
              child: TextField(
                controller: TextEditingController.fromValue(TextEditingValue(text: sliderTriggerAction.max.toString())),
                decoration: const InputDecoration(labelText: "Max"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (v) => sliderTriggerAction.max = int.tryParse(v) ?? 0,
              ),
            ),
            Container(width: 10,),
            Expanded(
              child: TextField(
                controller: TextEditingController.fromValue(TextEditingValue(text: sliderTriggerAction.steps.toString())),
                decoration: const InputDecoration(labelText: "Division"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (v) => sliderTriggerAction.steps = int.tryParse(v) ?? 0,
              ),
            )
          ],
        )
      ],
    );
  }

}