import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentComponent extends StatelessWidget {
  final List<Map<String, String>> comments;

  CommentComponent({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments.map((comment) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:CachedNetworkImageProvider(comment['avatarUrl'] ?? ''),
          ),
          title: Text(comment['name'] ?? ''),
          subtitle: Text(comment['content'] ?? ''),
        );
      }).toList(),
    );
  }
}