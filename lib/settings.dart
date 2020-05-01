import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<ThemeItem> _themeItems = ThemeItem.getThemeItems();

  List<DropdownMenuItem<ThemeItem>> _dropDownMenuItems;

  ThemeItem _selectedItem;

  List<DropdownMenuItem<ThemeItem>> buildDropdownMenuItems() {
    List<DropdownMenuItem<ThemeItem>> items = List();
    for (ThemeItem themeItem in _themeItems) {
      items
          .add(DropdownMenuItem(value: themeItem, child: Text(themeItem.name)));
    }
    return items;
  }

  @override
  void initState() {
    _dropDownMenuItems = buildDropdownMenuItems();
    _selectedItem = _dropDownMenuItems[0].value;
    super.initState();
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(this._selectedItem.themeData);
  }

  setSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dynTheme', _selectedItem.slug);
  }

  onChangeDropdownItem(ThemeItem selectedItem) {
    setState(() {
      this._selectedItem = selectedItem;
    });
    changeColor();
    setSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: DynamicTheme.of(context).data.secondaryHeaderColor),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          'Settings',
          style: GoogleFonts.pacifico(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: DynamicTheme.of(context).data.secondaryHeaderColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: DynamicTheme.of(context).data.primaryColor,
        brightness: Brightness.light,
      ),
      body: ListView(
        children: [
          StickyHeader(
            header: Container(
              height: 40.0,
              color: DynamicTheme.of(context).data.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Personalisation',
                style: TextStyle(
                    color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    fontSize: 14),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Tooltip(
                message: "Themes",
                waitDuration: Duration(seconds: 1),
                child: DropdownButton(
                  isDense: true,
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.brightness_4,
                        color:
                            DynamicTheme.of(context).data.secondaryHeaderColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          '          Themes',
                          style: TextStyle(
                              color: DynamicTheme.of(context)
                                  .data
                                  .textTheme
                                  .subtitle
                                  .color,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  icon: Icon(FontAwesomeIcons.angleDown,
                      color: DynamicTheme.of(context).data.iconTheme.color),
                  items: _dropDownMenuItems,
                  onChanged: onChangeDropdownItem,
                  underline: SizedBox(),
                ),
              ),
            ),
          ),
          StickyHeader(
            header: Container(
              height: 40.0,
              color: DynamicTheme.of(context).data.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'General',
                style: TextStyle(
                    color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    fontSize: 14),
              ),
            ),
            content: Column(
              children: [
                ListTile(
                    leading: Icon(
                      Icons.data_usage,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Clear Cache",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Clear locally cached images"),
                    onTap: () {}),
                ListTile(
                    leading: Icon(
                      Icons.storage,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Clear Downloads",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Clear downloaded images"),
                    onTap: () {}),
                ListTile(
                    leading: Icon(
                      Icons.share,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Share Prism!",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text(
                        "Quick link to pass on to your friends and enemies"),
                    onTap: () {}),
              ],
            ),
          ),
          StickyHeader(
            header: Container(
              height: 40.0,
              color: DynamicTheme.of(context).data.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'User',
                style: TextStyle(
                    color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    fontSize: 14),
              ),
            ),
            content: Column(
              children: [
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.heartBroken,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Clear Favorites",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Remove all favorites"),
                    onTap: () {}),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.search,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Clear Search History",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Delete search history data"),
                    onTap: () {}),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Logout",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Sign out from your account"),
                    onTap: () {}),
              ],
            ),
          ),
          StickyHeader(
            header: Container(
              height: 40.0,
              color: DynamicTheme.of(context).data.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Prism',
                style: TextStyle(
                    color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    fontSize: 14),
              ),
            ),
            content: Column(
              children: [
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.github,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "View Prism on GitHub!",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("Check out the code or contribute yourself"),
                    onTap: () {}),
                ListTile(
                    leading: Icon(
                      Icons.code,
                      color: DynamicTheme.of(context).data.secondaryHeaderColor,
                    ),
                    title: new Text(
                      "Version",
                      style: TextStyle(
                          color: DynamicTheme.of(context)
                              .data
                              .textTheme
                              .subtitle
                              .color,
                          fontSize: 18),
                    ),
                    subtitle: Text("1.0 alpha"),
                    onTap: () {}),
                ExpansionTile(
                  leading: Icon(
                    Icons.people,
                    color: DynamicTheme.of(context).data.secondaryHeaderColor,
                  ),
                  title: new Text(
                    "Developers",
                    style: TextStyle(
                        color: DynamicTheme.of(context)
                            .data
                            .textTheme
                            .subtitle
                            .color,
                        fontSize: 18),
                  ),
                  subtitle: Text("Check out the cool devs!"),
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/AB.jpg"),
                        ),
                        title: new Text(
                          "LiquidatorCoder",
                          style: TextStyle(
                              color: DynamicTheme.of(context)
                                  .data
                                  .textTheme
                                  .subtitle
                                  .color,
                              fontSize: 18),
                        ),
                        subtitle: Text("Abhay Maurya"),
                        onTap: () {}),
                    ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/AK.jpg"),
                        ),
                        title: new Text(
                          "CodeNameAkshay",
                          style: TextStyle(
                              color: DynamicTheme.of(context)
                                  .data
                                  .textTheme
                                  .subtitle
                                  .color,
                              fontSize: 18),
                        ),
                        subtitle: Text("Akshay Maurya"),
                        onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}