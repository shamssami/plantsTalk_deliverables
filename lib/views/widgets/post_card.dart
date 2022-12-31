import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:plants_talk/providers/user_provider.dart';

import 'package:plants_talk/services/resources/firestore_methods.dart';
import 'package:plants_talk/views/pages/social-network/comments_screen.dart';
import 'package:plants_talk/utils/colors.dart';
import 'package:plants_talk/utils/global_variable.dart';
import 'package:plants_talk/utils/utils.dart';
import 'package:plants_talk/views/widgets/like_animation.dart';
import 'package:plants_talk/model/user.dart' as model;

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User2? user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;
    print(user);
    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
        border: Border.all(
          color: width > webScreenSize ? secondaryColor : white,
        ),
        color: white,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          // HEADER SECTION OF THE POST
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        //   widget.snap['profImage'].toString(),
                        NetworkImage(
                      widget.snap['profImage'].toString(),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.snap['username'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                widget.snap['uid'].toString() == user?.uid
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'حذف',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                deletePost(
                                                  widget.snap['postId']
                                                      .toString(),
                                                );
                                                // remove the dialog box
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: '${widget.snap['description']}',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // IMAGE SECTION OF THE POST
          GestureDetector(
            onDoubleTap: () {
              FireStoreMethods().likePost(
                widget.snap['postId'].toString(),
                user!.uid,
                widget.snap['likes'],
              );
              setState(() {
                isLikeAnimating = true;
                //   FirebaseFirestore.instance.collection('notification').doc(user.uid).update({
                // "city": widget.snap['postId'].toString(),
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.snap['postUrl'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    child: Icon(FontAwesomeIcons.thumbsUp
                        // color: Colors.white,
                        // size: 100,
                        ),
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // LIKE, COMMENT SECTION OF THE POST

          Container(
            alignment: FractionalOffset.centerLeft,
            child: new Row(
              children: <Widget>[
                LikeAnimation(
                  isAnimating: widget.snap['likes'].contains(user?.uid),
                  smallLike: true,
                  child: IconButton(
                    icon: widget.snap['likes'].contains(user?.uid)
                        ? const Icon(
                            FontAwesomeIcons.thumbsUp,
                            color: Color.fromARGB(255, 49, 158, 113),
                          )
                        : const Icon(
                            FontAwesomeIcons.thumbsUp,
                          ),
                    onPressed: () => FireStoreMethods().likePost(
                      widget.snap['postId'].toString(),
                      user!.uid,
                      widget.snap['likes'],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.comment_sharp,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      '${widget.snap['likes'].length} معجبين',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                InkWell(
                  child: Container(
                    child: Text(
                      'عرض جميع $commentLen التعليقات',
                      style: const TextStyle(
                        fontSize: 16,
                        color: secondaryColor,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        postId: widget.snap['postId'].toString(),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style: const TextStyle(
                      color: secondaryColor,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
