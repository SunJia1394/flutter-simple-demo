import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class ProfileWidget extends StatelessWidget {
  final String avatarPath;
  final String name;

  const ProfileWidget({
    required this.avatarPath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(avatarPath),
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: CachedNetworkImageProvider(avatarPath),
                    ),
                    SizedBox(width: 10),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: AppTheme.themeData.primaryColor,
                          ),
                        ),
                        child: Text('关注',
                            style: AppTheme.themeData.textTheme.headline3),
                      ),
                      SizedBox(width: 10),

                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
