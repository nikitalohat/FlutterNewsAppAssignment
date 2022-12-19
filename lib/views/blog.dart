import 'package:assignment_app/views/description.dart';
import "package:flutter/material.dart";

class Blog extends StatelessWidget {
  String? imageUrl, title, author, publishedAt, desc;
  Blog(@required this.imageUrl, @required this.title, this.author,
      this.publishedAt, this.desc);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        elevation: 50,
        shadowColor: Colors.black,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 0.4),
                Color.fromRGBO(0, 0, 0, 0.9)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Ink.image(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
                child: InkWell(onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Description(
                          imageUrl, title, author, publishedAt, desc)));
                })),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Flexible(
                    child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        text: TextSpan(
                          text: title!,
                          style: const TextStyle(
                            fontFamily: "Roboto Slab",
                            fontSize: 20,
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      padding:
                          const EdgeInsets.only(bottom: 15, left: 10, right: 5),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: author ?? "Unknown",
                            style: const TextStyle(
                              fontFamily: "Roboto Slab",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromRGBO(186, 186, 186, 1),
                            )),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: RichText(
                          text: TextSpan(
                              //text: DateFormat.yMd(publishedAt).toString(),
                              text:
                                  "${DateTime.parse(publishedAt!).year.toString()} - ${DateTime.parse(publishedAt!).month.toString()} - ${DateTime.parse(publishedAt!).day.toString()}",
                              style: const TextStyle(
                                fontFamily: "Roboto Slab",
                                fontSize: 12,
                                color: Color.fromRGBO(186, 186, 186, 1),
                              )),
                        ))
                  ],
                )
                // Text(
                //   author!,
                //   style: const TextStyle(
                //     fontFamily: "Roboto Slab",
                //     fontWeight: FontWeight.bold,
                //     fontSize: 12,
                //     color: Color.fromRGBO(186, 186, 186, 1),
                //   ),
                //   //textAlign: TextAlign.start,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
