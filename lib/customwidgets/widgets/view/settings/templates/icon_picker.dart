import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Map<String, IconData> icons = {
  "import export": Icons.import_export,
  "home": Icons.home,
  "home outlined": Icons.home_outlined,
  "home work": Icons.home_work,
  "light bulb": Icons.lightbulb,
  "light": Icons.light,
  "light outlined": Icons.light_outlined,
  "highlight rounded": Icons.highlight_rounded,
  "window": Icons.window,
  "window sharp": Icons.window_sharp,
  "stream": Icons.stream,
  "living": Icons.living,
  "living outlined": Icons.living_outlined,
  "family restroom": Icons.family_restroom,
  "checkroom outlined": Icons.checkroom_outlined,
  "bathroom": Icons.bathroom,
  "ac unit": Icons.ac_unit,
  "ac unit rounded": Icons.ac_unit_rounded,
  "access alarm": Icons.alarm,
  "access time outlines": Icons.access_time_outlined,
  "accessibility": Icons.accessibility,
  "account box": Icons.account_box,
  "account tree": Icons.account_tree,
  "adb": Icons.adb,
  "directions car": Icons.directions_car,
  "electric car": Icons.electric_car,
  "electric car outlined": Icons.electric_car_outlined,
  "adf scanner": Icons.adf_scanner,
  "ad scanner outlined": Icons.adf_scanner_outlined,
  "air": Icons.air,
  "airline seat recline normal rounded": Icons.airline_seat_recline_normal_rounded,
  "all inbox": Icons.all_inbox,
  "analytics outlined": Icons.analytics_outlined,
  "analytics": Icons.analytics,
  "android": Icons.android,
  "aod handy": Icons.aod,
  "apartment": Icons.apartment,
  "assessment": Icons.assessment,
  "attachment": Icons.attachment,
  "attractions": Icons.attractions,
  "audiotrack": Icons.audiotrack,
  "bathtub": Icons.bathtub,
  "bathtub outlined": Icons.bathtub_outlined,
  "battery alert": Icons.battery_alert,
  "battery charging full": Icons.battery_charging_full,
  "battery full": Icons.battery_full,
  "bed": Icons.bed,
  "bedroom child outlined": Icons.bedroom_child_outlined,
  "bedroom child": Icons.bedroom_child,
  "bedroom parent": Icons.bedroom_parent,
  "bedroom parent outlined": Icons.bedroom_parent_outlined,
  "moon": Icons.bedtime,
  "blender mixer": Icons.blender,
  "bolt": Icons.bolt,
  "boy": Icons.boy,
  "brunch dining": Icons.brunch_dining,
  "bungalow": Icons.bungalow,
  "business": Icons.business,
  "calendar month": Icons.calendar_month,
  "calendar month outlined": Icons.calendar_month_outlined,
  "call": Icons.call,
  "camera alt": Icons.camera_alt,
  "cast outlined": Icons.cast_outlined,
  "chair outlined": Icons.chair_outlined,
  "chair": Icons.chair,
  "coffee": Icons.coffee,
  "coffee maker": Icons.coffee_maker,
  "coffee maker outlined": Icons.coffee_maker_outlined,
  "delete": Icons.delete,
  "delete outlined": Icons.delete_outline,
  "desktop mac": Icons.desktop_mac,
  "device thermostat": Icons.device_thermostat,
  "devices": Icons.devices,
  "directions car filled outlined": Icons.directions_car_filled_outlined,
  "door back door": Icons.door_back_door,
  "door back door outlined": Icons.door_back_door_outlined,
  "doorbell": Icons.doorbell,
  "doorbell outlined": Icons.doorbell_outlined,
  "drafts mail post": Icons.drafts,
  "drafts mail post outlined": Icons.drafts_outlined,
  "electrical services": Icons.electric_car_outlined,
  "email": Icons.email,
  "email outlined": Icons.email_outlined,
  "fireplace": Icons.fireplace,
  "flashlight on": Icons.flashlight_on,
  "garage": Icons.garage,
  "garage outlined": Icons.garage_outlined,
  "group": Icons.group,
  "headphones": Icons.headphones,
  "hot tub": Icons.hot_tub,
  "house": Icons.house,
  "house outlined": Icons.house_outlined,
  "print": Icons.print,
  "print outlined": Icons.print_outlined,
  "print disabled": Icons.print_disabled,
  "microwave": Icons.microwave,
  "microwave outlined": Icons.microwave_outlined,
  "water": Icons.water,
  "water damage": Icons.water_damage,
  "water damage outline": Icons.water_damage_outlined,
  "sensor": Icons.sensors,
  "sensor off": Icons.sensors_off,
  "bell": FontAwesomeIcons.bell,
  "kitchen": FontAwesomeIcons.kitchenSet,
  "fire Burner": FontAwesomeIcons.fireBurner,
  /*"floor home 0 zero ground ": CommunityMaterialIcons.home_floor_0,
  "floor home 1 first ": CommunityMaterialIcons.home_floor_1,
  "floor home 2 second ": CommunityMaterialIcons.home_floor_2,
  "floor home 3 third ": CommunityMaterialIcons.home_floor_3,
  "floor home -1 negative one basement": CommunityMaterialIcons.home_floor_negative_1,
  "floor home a": CommunityMaterialIcons.home_floor_a,
  "floor home b": CommunityMaterialIcons.home_floor_b,
  "floor home g": CommunityMaterialIcons.home_floor_g,
  "floor home l": CommunityMaterialIcons.home_floor_l,*/
};
class IconPickerTemplate extends StatefulWidget {
  final Function(IconData? iconData) onChange;
  final IconData selected;
  final bool reset;
  const IconPickerTemplate({Key? key, required this.onChange, this.selected = Icons.home, this.reset = false}) : super(key: key);

  @override
  State<IconPickerTemplate> createState() => _IconPickerTemplateState();
}

class _IconPickerTemplateState extends State<IconPickerTemplate> {
  @override
  Widget build(BuildContext context) {

    return DropdownSearch<String>(
      dropdownDecoratorProps: const DropDownDecoratorProps(

        dropdownSearchDecoration: InputDecoration(
          labelText: "Icon",
        ),
      ),
      onChanged: (s) => widget.onChange(icons[s]),
      items: icons.keys.toList()..sort(),
      selectedItem: icons.keys.firstWhere((element) => icons[element]?.codePoint == widget.selected.codePoint, orElse: () => "home"),
      dropdownBuilder: (context, iconKey) {
        return iconKey != null ? Icon(icons[iconKey]) : const Text("");
      },
      clearButtonProps: ClearButtonProps(
        isVisible: widget.reset,

      ),
      popupProps:  PopupProps.modalBottomSheet(
        showSelectedItems: true,
        searchDelay: const Duration(seconds: 0),
        showSearchBox: true,
        title: const Text("Icon", style: TextStyle(fontSize: 17.5),),
        itemBuilder: (context, iconKey, b) {
          return ListTile(
            title: Icon(icons[iconKey]?? icons["home"]),
          );
        },

      ),
    );
  }
}
