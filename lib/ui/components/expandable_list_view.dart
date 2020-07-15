import 'package:flutter/material.dart';
import 'package:stackedprototype/data/models/expandable_list_item.dart';

import '../../constants.dart';

class ExpandableListView extends StatefulWidget {
  final ExpandableListItem expandableListItem;
  final Function(int itemIndex) onPressed;

  const ExpandableListView({Key key, this.expandableListItem, this.onPressed}) : super(key: key);

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Container(
                          height: 40.0,
                          width: 40.0,
                          child: new Center(
                            child: new Icon(
                              expandFlag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                              color: colorViolet,
                              size: 30.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            expandFlag = !expandFlag;
                          });
                        }),
                    Text(
                      widget.expandableListItem.title,
                      style: TextStyle(fontWeight: FontWeight.bold, color: colorTextDark),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      widget.expandableListItem.date,
                      style: new TextStyle(color: colorTextLight, fontSize: 14),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Text(
                    '(${widget.expandableListItem.expandableItems.length} material items pending)',
                    style: new TextStyle(color: colorTextLight, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          ExpandableContainer(
              expanded: expandFlag,
              expandedHeight: (24 + widget.expandableListItem.expandableItems.length * 50).toDouble(),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    padding: new EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                      onTap: (){
                        widget.onPressed(index);
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${index + 1}. ',
                            style: new TextStyle(color: colorTextLight),
                          ),
                          Text(
                            '${widget.expandableListItem.expandableItems[index].title}',
                            style: new TextStyle(color: colorTextDark),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            '${widget.expandableListItem.expandableItems[index].quantity} ',
                            style: new TextStyle(color: colorTextDark, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 4,),
                          Icon(Icons.arrow_forward, color: colorTextLight, size: 16,),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: widget.expandableListItem.expandableItems.length,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
                        @required this.child,
                        this.collapsedHeight = 12.0,
                        this.expandedHeight = 300.0,
                        this.expanded = true,
                      });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: child,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}