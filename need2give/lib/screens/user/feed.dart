import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/post.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _items = await _itemService.get(context, {"following": true});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Feed"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return PostComponent(
                  item: _items[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
