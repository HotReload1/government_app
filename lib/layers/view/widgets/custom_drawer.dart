import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/configuration/styles.dart';
import '../../../core/routing/route_path.dart';

class CustomDrawer extends StatefulWidget {
  static int selectedTab = 0;
  static int previousTab = 0;
  CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<DrawerOption> getOptions() {
    return [
      DrawerOption(
          icon: Icons.home,
          title: "الرئيسية",
          function: () =>
              Navigator.of(context).pushReplacementNamed(RoutePaths.Home)),
      DrawerOption(
          icon: Icons.newspaper,
          title: "الأخبار",
          function: () =>
              Navigator.of(context).pushReplacementNamed(RoutePaths.News)),
      DrawerOption(
          icon: Icons.account_balance_sharp,
          title: "القرارات",
          function: () => Navigator.of(context)
              .pushReplacementNamed(RoutePaths.DecisionScreen)),
      DrawerOption(
          icon: Icons.emoji_events,
          title: "الفعاليات",
          function: () => Navigator.of(context)
              .pushReplacementNamed(RoutePaths.EventsScreen)),
      DrawerOption(
          icon: Icons.offline_bolt_sharp,
          title: "الخدمات",
          function: () => Navigator.of(context)
              .pushReplacementNamed(RoutePaths.ServicesScreen)),
      DrawerOption(
          icon: Icons.account_balance,
          title: "عن المجلس",
          function: () => Navigator.of(context)
              .pushReplacementNamed(RoutePaths.AboutScreen)),
      DrawerOption(
          icon: Icons.report,
          title: "الشكاوي",
          function: () => Navigator.of(context)
              .pushReplacementNamed(RoutePaths.ReportScreen)),
    ];
  }

  showAlertDialog(Function function) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "نعم",
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {
        function();
      },
    );

    Widget cancelButton = TextButton(
      child: Text(
        "إلغاء",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        CustomDrawer.selectedTab = CustomDrawer.previousTab;
        setState(() {});
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: const Text("هل أنت متأكد أنك تريد تسجيل الخروج!"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _buildDrawerOption(DrawerOption drawerOption, int index) {
    return Container(
      color: CustomDrawer.selectedTab == index
          ? Styles.colorPrimary.withOpacity(0.2)
          : Colors.transparent,
      child: ListTile(
        leading: Icon(drawerOption.icon),
        title: Text(
          drawerOption.title,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        onTap: () {
          print(index);
          if (index == getOptions().length) {
            drawerOption.function();
          } else if (CustomDrawer.selectedTab == index) {
            Navigator.of(context).pop();
          } else {
            CustomDrawer.previousTab = CustomDrawer.selectedTab;
            CustomDrawer.selectedTab = index;
            drawerOption.function();
            setState(() {});
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Styles.colorPrimary,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/United_Nations_Trusteeship_Council_chamber_in_New_York_City_2.JPG/277px-United_Nations_Trusteeship_Council_chamber_in_New_York_City_2.JPG"))),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black38, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مجلس بلدية ضاحية قدسييا\n لعام 2024",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "نعمل لخدمة المواطن وتحسين الخدمات",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: List.generate(
                        getOptions().length,
                        (index) =>
                            _buildDrawerOption(getOptions()[index], index)),
                  ),
                ),
                _buildDrawerOption(
                    DrawerOption(
                      icon: Icons.logout,
                      title: "تسجيل الخروج",
                      function: () {
                        showAlertDialog(() => SystemNavigator.pop());
                      },
                    ),
                    getOptions().length),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerOption {
  final IconData icon;
  final String title;
  final Function function;

  DrawerOption(
      {required this.icon, required this.title, required this.function});
}
