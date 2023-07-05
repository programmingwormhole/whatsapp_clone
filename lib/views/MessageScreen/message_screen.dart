import 'package:flutter/material.dart';
import 'package:whatsapp_chat/utils/colors.dart';
import 'package:whatsapp_chat/utils/message_data.dart';
import '../../components/pop_up_menu_item.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String image;

  const MessageScreen({super.key, required this.name, required this.image});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<PopupMenuEntry<dynamic>> popUpItems = [
    popupMenuItem(
      title: 'Add to contacts',
      onTap: () {},
      value: 0,
      color: white,
    ),
    popupMenuItem(
      title: 'Delete chats',
      onTap: () {},
      value: 1,
      color: white,
    ),
    popupMenuItem(
      title: 'Block',
      onTap: () {},
      value: 2,
      color: white,
    ),
    popupMenuItem(
      title: 'Report',
      onTap: () {},
      value: 3,
      color: white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: white.withOpacity(.1),
              backgroundImage: NetworkImage(widget.image),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Last seen 01:37 AM',
                  style: TextStyle(
                    color: white.withOpacity(.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.videocam_rounded,
                  color: white,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.call,
                  color: white,
                ),
                PopupMenuButton(
                  onSelected: (result) {
                    switch (result) {
                      case 0:
                        print('0');
                        break;
                      case 1:
                        print('1');
                        break;
                      case 2:
                        print('3');
                        break;
                      case 3:
                        print('4');
                        break;
                    }
                  },
                  color: appBarColor,
                  icon: const Icon(
                    Icons.more_vert,
                    size: 26,
                    color: white,
                  ),
                  itemBuilder: (BuildContext context) => popUpItems,
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/wallpaper_blue.jpg',
              ),
              fit: BoxFit.cover,
              opacity: .5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: messageData.length,
                    itemBuilder: (_, index) {
                      final data = messageData[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (data['type'] != 'sent')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width * .7),
                                        decoration: const BoxDecoration(
                                            color: appBarColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            data['text'],
                                            style: const TextStyle(
                                              color: white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  data['time'],
                                  style:
                                      TextStyle(color: white.withOpacity(.5)),
                                )
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                data['message_type'] == 'emoji'
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    // bottomRight: Radius.circular(20),
                                                  )),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 10,
                                                ),
                                                child: Text(
                                                  data['text'],
                                                  style: const TextStyle(
                                                    color: white,
                                                    fontSize: 80,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    // bottomRight: Radius.circular(20),
                                                  )),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 10,
                                                ),
                                                child: Text(
                                                  data['text'],
                                                  style: const TextStyle(
                                                    color: white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      data['time'],
                                      style: TextStyle(
                                          color: white.withOpacity(.5)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      'assets/images/sent.png',
                                      width: 30,
                                      color: data['status'] == 'seen'
                                          ? primary
                                          : white.withOpacity(.5),
                                    )
                                  ],
                                )
                              ],
                            )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: size.width * .9,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_emotions_outlined,
                              size: 28,
                              color: white.withOpacity(.5),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: size.width * .4,
                              child: TextField(
                                maxLines: 5,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                style: TextStyle(color: white.withOpacity(.5)),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Message',
                                    hintStyle: TextStyle(
                                        color: white.withOpacity(.5))),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.link_sharp,
                              size: 37,
                              color: white.withOpacity(.5),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.photo_camera,
                              size: 28,
                              color: white.withOpacity(.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Icon(
                          Icons.mic,
                          color: white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
