import 'package:expenso_341/ui/screens/add_expense_page.dart';
import 'package:expenso_341/ui/screens/expense.dart';
import 'package:expenso_341/ui/screens/navigation_provider.dart';
import 'package:expenso_341/ui/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  List<Map<String, dynamic>> mNavigation = [
    {
      "icon": Icons.home,
      "label": "Home",
      "navigateTo" : ExpensePage()
    },
    {
      "icon": Icons.add,
      "label": "Add",
      "navigateTo" : AddExpensePage()
    },
    {
      "icon": Icons.area_chart,
      "label": "Stats",
      "navigateTo" : StatisticPage()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (ctx, provider, __){
        return Scaffold(
          body: mNavigation[ctx.watch<NavigationProvider>().navIndex]['navigateTo'],
          bottomNavigationBar: NavigationBar(
              selectedIndex: provider.navIndex,
              onDestinationSelected: (index){
                provider.navIndex = index;
              },
              destinations: mNavigation.map((e){
                return NavigationDestination(icon: Icon(e['icon']), label: e['label']);
              }).toList()),
        );
      },
    );
  }
}
