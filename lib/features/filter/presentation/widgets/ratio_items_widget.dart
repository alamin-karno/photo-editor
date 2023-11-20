import 'package:flutter/material.dart';

class RatioItemsWidget extends StatelessWidget {
  const RatioItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              '1:1',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '2:1',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '1:2',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '4:3',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '3:4',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '16:9',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '9:16',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
