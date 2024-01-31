import 'package:flutter/material.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';

class ChangeLogScreen extends StatelessWidget {
  final Manager manager;
  const ChangeLogScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          manager.status = ManagerStatus.finished;
          manager.managerStatusStreamController.sink.add(ManagerStatus.finished);
        },
        child: const Icon(Icons.visibility),

      ),
      appBar: AppBar(
        title: Text("What's new? " + manager.versionNumber + "(" + manager.buildNumber + ")"),
      ),
      body: ListView(

        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text("Changelog ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text("Version: ${manager.versionNumber}", style: const TextStyle(fontWeight: FontWeight.normal),)
              ],
            ),
          ),
          const Text("Bugs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("- After the next sync in the IoBroker Setting you now should see the Name of the Datapoint again"),
                Text("- A removed data point should not cause a crash"),
                Text("- Known Bugs: Graph Widget does not work anymore"),

              ],
            ),
          ),
          /*const Text("Widgets", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Added the Graph Widget (only use this widget if you backedup your current state):"),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("If you use the sql Adapter you can now use this Widget to display a Graph"),
                ),


              ],
            ),
          ),*/

          const Text("Other", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Connection to IoBroker:"),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("-You can now set up a device so that it can log in without a password"),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("-After the first connection you need to approve the device in hiob.x.device.<device>.approved"),
                ),

                const Text("- Config Sync:"),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("-For this feature you need the new Adapater version", style: TextStyle(fontWeight: FontWeight.bold),),

                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("-You can now upload/load your settings from/to ioBroker"),

                ),

                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("-Location: hiob.x.settings..."),

                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}