import 'package:flutter/material.dart';
import 'package:live_stream_project/constant/const.dart';
import 'package:live_stream_project/pages/user_card.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  void _showJoinDialog(BuildContext context, List<Map<String, dynamic>> users) {
    final TextEditingController searchController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Color(0xFF1D1E33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("join Live by Username"),
        content: TextField(
          controller: searchController,
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Enter Username (e.g. creator-007",
            hintStyle: TextStyle(color: Colors.white30),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white30),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyanAccent),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              final input = searchController.text.trim();
              if (input.isEmpty) {
                Navigator.pop(context);
                return;
              }
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ZegoUIKitPrebuiltLiveStreaming(
                    appID: yourAppID,
                    userID: userName,
                    appSign: yourAppSign,
                    userName: userName,
                    liveID: input,
                    config: ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
                  ),
                ),
              );
            },
            child: Text('Join', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = [
      {
        'name': 'ChillVibes',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user2',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user3',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user4',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user5',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user6',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user7',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
      {
        'name': 'user8',
        'thumb': 'https://picsum.photos/id/1080/200/300',
        'isLive': true,
      },
    ];
    return Scaffold(
      backgroundColor: Color(0xFF0B0E1C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Live Now",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showJoinDialog(context, users),
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Text(
                userName[0].toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (_, index) {
            final user = users[index];
            print("user['name']");
            return UserCard(
              name: user['name'] as String,
              imageUrl: user['thumb'] as String,
              isLive: user['isLive'] as bool,
              onTap: () {
                if (user['isLive'] == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ZegoUIKitPrebuiltLiveStreaming(
                        appID: yourAppID,
                        appSign: yourAppSign,
                        userID: userName,
                        userName: userName,
                        liveID: user['name'] as String,
                        config: ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${user['name']} is not live right now"),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ZegoUIKitPrebuiltLiveStreaming(
                  appID: yourAppID,
                  appSign: yourAppSign,
                  userID: userName,
                  userName: userName,
                  liveID: userName,
                  config: ZegoUIKitPrebuiltLiveStreamingConfig.host(),
                ),
              ),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          label: const Text(
            "Go Live",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          icon: const Icon(Icons.videocam_rounded),
        ),
      ),
    );
  }
}
