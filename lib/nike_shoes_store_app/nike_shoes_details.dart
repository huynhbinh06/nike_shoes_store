import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshoes/nike_shoes_store_app/nike_shoes.dart';
import 'package:nikeshoes/nike_shoes_store_app/nike_shopping_cart.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierBottomButtonsVisible = ValueNotifier(false);

  NikeShoesDetails({Key key, @required this.shoes}) : super(key: key);

  Future<void> _openShoppingCart(BuildContext context) async {
    notifierBottomButtonsVisible.value = false;

    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoppingCart(shoes: shoes),
          );
        },
      ),
    );
    notifierBottomButtonsVisible.value = true;
  }

  Widget _buildCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: 'background_${shoes.model}',
              child: Container(
                color: Color(shoes.color),
              ),
            ),
          ),
          Positioned(
            left: 70,
            right: 70,
            top: 10,
            child: Hero(
              tag: 'number_${shoes.model}',
              child: Material(
                color: Colors.transparent,
                child: FittedBox(
                  child: Text(
                    shoes.modelNumber.toString(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              itemCount: shoes.images.length,
              itemBuilder: (context, index) {
                final tag = index == 0
                    ? 'image_${shoes.model}'
                    : 'image_${shoes.model}_$index';
                return Container(
                  alignment: Alignment.center,
                  child:
                      Hero(tag: tag, child: Image.asset(shoes.images[index])),
                  height: 200,
                  width: 200,
                );
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBottomButtonsVisible.value = true;
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/nike_shoes_store/nike_logo.png',
            height: 80,
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildCarousel(context),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              shoes.model,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$${shoes.oldPrice.toInt().toString()}',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '\$${shoes.currentPrice.toInt().toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'AVAILABLE SIZES',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _ShoesSizeItem(
                              text: '6',
                            ),
                            _ShoesSizeItem(
                              text: '7',
                            ),
                            _ShoesSizeItem(
                              text: '8',
                            ),
                            _ShoesSizeItem(
                              text: '10',
                            ),
                            _ShoesSizeItem(
                              text: '11',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                        onPressed: () {
                          _openShoppingCart(context);
                        },
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
                    bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                    child: child,
                  );
                }),
          ],
        ));
  }
}

class _ShoesSizeItem extends StatelessWidget {
  final String text;

  const _ShoesSizeItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        'US $text',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
