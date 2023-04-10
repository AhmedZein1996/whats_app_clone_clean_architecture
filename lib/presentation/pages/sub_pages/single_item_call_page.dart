import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../../theme/style.dart';

class SingleItemCallPage extends StatelessWidget {
  const SingleItemCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.asset("assets/profile_default.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      sizedBoxHeight5,
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.call_received,
                            color: primaryColor,
                            size: 18,
                          ),
                          Text(
                            "Yesterday",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Icon(Icons.call,color: primaryColor,)
              Icon(
                Icons.call,
                color: primaryColor,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60, right: 10),
            child: Divider(
              thickness: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}
