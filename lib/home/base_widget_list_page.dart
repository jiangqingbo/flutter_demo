import 'package:flutter/material.dart';
import 'package:flutterdemo/animation/1-animation.dart';
import 'package:flutterdemo/animation/2-animation_double.dart';
import 'package:flutterdemo/animation/3-animation_widget.dart';
import 'package:flutterdemo/animation/4-animation_builder.dart';
import 'package:flutterdemo/animation/5-animation_heart.dart';
import 'package:flutterdemo/animation/5-paint_heart.dart';
import 'package:flutterdemo/animation/6-3d.dart';
import 'package:flutterdemo/animation/7-flipper_widget.dart';
import 'package:flutterdemo/animation/8-animation_brick.dart';
import 'package:flutterdemo/base_widget/1-container.dart';
import 'package:flutterdemo/base_widget/1-login.dart';
import 'package:flutterdemo/base_widget/2-image.dart';
import 'package:flutterdemo/base_widget/3-text.dart';
import 'package:flutterdemo/base_widget/4-icons_buttons.dart';
import 'package:flutterdemo/cupertino_widget/cupertino_button.dart';
import 'package:flutterdemo/cupertino_widget/cupertino_demo.dart';
import 'package:flutterdemo/cupertino_widget/cupertino_dialog.dart';
import 'package:flutterdemo/cupertino_widget/cupertino_loading.dart';
import 'package:flutterdemo/gesture_detector/dismissiable.dart';
import 'package:flutterdemo/gesture_detector/gesture_datector.dart';
import 'package:flutterdemo/layout/1-align.dart';
import 'package:flutterdemo/layout/2-stack.dart';
import 'package:flutterdemo/listview/1-listview.dart';
import 'package:flutterdemo/listview/2-listview_dismissiable.dart';
import 'package:flutterdemo/listview/3-gridview.dart';
import 'package:flutterdemo/base_widget/5-form.dart';
import 'package:flutterdemo/listview/4-reorded_listview.dart';
import 'package:flutterdemo/listview/5-listview_3d.dart';
import 'package:flutterdemo/listview/6-listview_pull_to_refresh.dart';
import 'package:flutterdemo/md_widget/1-material_app.dart';
import 'package:flutterdemo/md_widget/2-dialog.dart';
import 'package:flutterdemo/md_widget/3-card.dart';
import 'package:flutterdemo/table/table.dart';

///
/// author: bobo
/// create time: 2019/4/12 2:50 PM
/// email: jqbo84@163.com
///

class BasicWidgetPage extends StatefulWidget {
  @override
  _BasicWidgetPageState createState() => _BasicWidgetPageState();
}

class _BasicWidgetPageState extends State<BasicWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => EntryItem(context, data[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.page, [this.children = const <Entry>[]]);

  final String title;
  final Widget page;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Basic Widget',
    null,
    <Entry>[
      Entry('1-Container', ContainerPage()),
      Entry('1-Login', LoginPage()),
      Entry('2-Image', ImagePage()),
      Entry('3-Text', TextPage()),
      Entry('4-Icons_Buttons', IconsButtonsPage()),
      Entry('5-From', LoginFromPage()),
    ],
  ),
  Entry(
    'Layout',
    null,
    <Entry>[
      Entry('1-Align', AlignPage()),
      Entry('2-Stack', StackPage()),
      Entry('3-Table', TablePage()),
    ],
  ),
  Entry(
    'ListView',
    null,
    <Entry>[
      Entry('1-ListView', ListViewPage()),
      Entry('2-ListView_Dismissiable', ListViewDismissiablePage()),
      Entry('3-GridView', GridViewPage()),
      Entry('4-Reorded_ListView', ReorderableListViewPage()),
      Entry('5-ListView_3D', ListView3DPage()),
      Entry('6-ListView_Pull_To_Refresh', ListViewPullToRefreshPage()),
    ],
  ),
  Entry(
    'Material Design Layout',
    null,
    <Entry>[
      Entry('1-MaterialApp', MaterialAppPage()),
      Entry('2-Dialog', DialogPage()),
      Entry('3-Card', CardPage()),
    ],
  ),
  Entry(
    'GestureDetector',
    null,
    <Entry>[
      Entry('1-Dismissiable', DismissiblePage()),
      Entry('2-GestureDetector', GestureDetectorPage()),
    ],
  ),
  Entry(
    'CupertinoWidget',
    null,
    <Entry>[
      Entry('1-CupertinoButton', CupertinoButtonPage()),
      Entry('2-CupertinoDialog', CupertinoDialogPage()),
      Entry('2-CupertinoLoading', CupertinoLoadingPage()),
      Entry('2-CupertinoDemo', CupertinoDemoPage()),
    ],
  ),
  Entry(
    'Animation',
    null,
    <Entry>[
      Entry('1-Animation', AnimationPage()),
      Entry('2-Animation_Double', AnimationDoublePage()),
      Entry('3-Animation_Widget', AnimationWidgetPage()),
      Entry('4-Animation_Builder', AnimationBuilderPage()),
      Entry('5-Animation_Heart', AnimationHeartPage()),
      Entry('5-Paint_Heart', PaintHeartPage()),
      Entry('6-3D', Animation3DPage()),
      Entry('7-Filpper_Widget', FlipperWidgetPage()),
      Entry('8-Animation_Brick', AnimationBrickPage()),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {

  const EntryItem(this.buildContext, this.entry);

  final Entry entry;

  final BuildContext buildContext;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title),
        onTap: () {
          _navPush(buildContext, root.page);
        },
      );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  _navPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
