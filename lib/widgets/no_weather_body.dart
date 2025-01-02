import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(maxLines:1,
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 110),
              child: Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



