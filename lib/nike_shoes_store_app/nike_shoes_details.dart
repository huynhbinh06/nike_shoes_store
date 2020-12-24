import 'package:flutter/material.dart';

class NikeShoesDetails extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomButtonsVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBottomButtonsVisible.value = true;
    });
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
                valueListenable: notifierBottomButtonsVisible,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'fav_1',
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: 'fav_2',
                        backgroundColor: Colors.black,
                        onPressed: () {},
                        child: Icon(Icons.shopping_basket_outlined),
                      ),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    child: child,
                  );
                }),
          ],
        ));
  }
}
