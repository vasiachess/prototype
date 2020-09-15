import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/chat/chat_viewmodel.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    var _tapPosition;

    void _storePosition(TapDownDetails details) {
      _tapPosition = details.globalPosition;
    }

    return ViewModelBuilder<ChatViewModel>.reactive(
      onModelReady: (model) {
        model.getChats();
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Chat',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/ic_create.png',
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorGreyCountdown,
                    borderRadius: BorderRadius.circular(48.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.search, color: colorTextLight),
                      ),
                      Container(
                        width: 220,
                        child: TextField(
                          controller: controller,
                          decoration: new InputDecoration(hintText: 'Search', border: InputBorder.none),
                          onChanged: model.onSearchTextChanged,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconButton(
                          color: Colors.transparent,
                          icon: Icon(
                            Icons.close,
                            color: colorTextLight,
                          ),
                          onPressed: () {
                            controller.clear();
                            model.onSearchTextChanged('');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (context, index) => FocusedMenuHolder(
                    menuWidth: MediaQuery.of(context).size.width*0.50,
                    blurSize: 1.0,
                    menuItemExtent: 45,
                    menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    duration: Duration(milliseconds: 100),
                    animateMenuItems: true,
                    blurBackgroundColor: Colors.grey.withOpacity(0.2),
                    menuOffset: 10.0, // Offset value to show menuItem from the selected item
                    bottomOffsetHeight: 80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                    menuItems: <FocusedMenuItem>[
                      FocusedMenuItem(title: Text("Delete",style: TextStyle(color: colorTextDark),),trailingIcon: Icon(Icons.delete,color: colorTextDark) ,onPressed: (){
                        model.showDeleteDialog();
                      }),
                    ],
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){},
                        leading: Container(
                          width: 70,
                          child: Row(
                            children: [
                              index == 0
                                  ? Image.asset(
                                      'assets/images/ic_dot.png',
                                      width: 6,
                                    )
                                  : SizedBox(
                                      width: 6,
                                    ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 27,
                                  backgroundImage: AssetImage('assets/images/ic_order_success.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          'Martin Lubin',
                          style: TextStyle(color: colorTextDark, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'I\'ll inform you',
                            style: TextStyle(
                              color: index == 0 ? colorTextDark : colorTextLight,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        trailing: Text(
                          '10:24 am',
                          style: TextStyle(
                            color: colorTextLight,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
