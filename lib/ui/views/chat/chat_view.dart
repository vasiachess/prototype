import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  itemBuilder: (context, index) => GestureDetector(
                    onTapDown: _storePosition,
                    onLongPress: () {
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject();
                      showMenu(
                        position: RelativeRect.fromRect(
                            _tapPosition & const Size(40, 40), // smaller rect, the touch area
                            Offset.zero & overlay.size // Bigger rect, the entire screen
                            ),
                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.delete),
                                Text("Delete"),
                              ],
                            ),
                          )
                        ],
                        context: context,
                      );
                    },
                    onTap: () {
                      model.navigateChatMessages();
                    },
                    child: ListTile(
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
            ],
          ),
        );
      },
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
