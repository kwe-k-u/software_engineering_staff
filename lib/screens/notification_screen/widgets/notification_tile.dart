import 'package:flutter/material.dart';
import 'package:software_engineering/utils/constants.dart';


class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("from", style: Theme.of(context).textTheme.labelMedium!
                      .copyWith(
                    color: Colors.grey
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Administrator", style: Theme.of(context).textTheme.bodyLarge!
                      .copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Spacer(),
                  // Icon(i)
                  Text("25 Feb 2022")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Bus services for next month will be unavailable"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.only(top: 16,left: 4, right:4, bottom: 0)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap
                      ),
                      child: Text("Indicate lateness", style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(color: ashesiRed),),
                      onPressed: (){},
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
