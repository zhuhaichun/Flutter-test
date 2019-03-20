import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<int> list;
  List<ExpansionPanelBean> expansionPanelBeanList;

  _ExpansionPanelListDemoState() {
    list = new List();
    expansionPanelBeanList = new List();
    for (int i = 0; i < 10; i++) {
      list.add(i);
      expansionPanelBeanList.add(ExpansionPanelBean(i, false));
    }
  }

  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      expansionPanelBeanList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (index, isExpand) {_setCurrentIndex(index, isExpand);},
        children: list.map((index) {
          return ExpansionPanel(
              headerBuilder: (context, isExpand) {
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion is No.$index'),
              ),
              isExpanded: expansionPanelBeanList[index].isOpen);
        }).toList(),
      ),
    );
  }
}

class ExpansionPanelBean {
  var isOpen;
  var index;

  ExpansionPanelBean(this.index, this.isOpen);
}
