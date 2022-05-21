import 'package:Habo/helpers.dart';
import 'package:Habo/provider.dart';
import 'package:Habo/screens/onboarding_screen.dart';
import 'package:Habo/widgets/calendar_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (!Provider.of<Bloc>(context).getSeenOnboarding)
        ? OnBoardingScreen()
        : Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "HabManager",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 50,
                    ),
                  ],
                  fontSize: 35,
                ),
              ),
              backgroundColor: Colors.black87,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.bar_chart,
                    semanticLabel: 'Statistics',
                    size: 30,
                  ),
                  color: Colors.white,
                  tooltip: 'Statistics',
                  onPressed: () {
                    Provider.of<Bloc>(context, listen: false).hideSnackBar();
                    navigateToStatisticsPage(context);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                // IconButton(
                //   icon: const Icon(
                //     Icons.settings,
                //     semanticLabel: 'Settings',
                //     size: 30,
                //   ),
                //   color: Colors.white,
                //   tooltip: 'Settings',
                //   onPressed: () {
                //     Provider.of<Bloc>(context, listen: false).hideSnackBar();
                //     navigateToSettingsPage(context);
                //   },
                // ),
              ],
            ),
            body: CalendarColumn(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<Bloc>(context, listen: false).hideSnackBar();
                navigateToCreatePage(context);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                semanticLabel: 'Add',
                size: 35.0,
              ),
            ),
          );
  }
}
