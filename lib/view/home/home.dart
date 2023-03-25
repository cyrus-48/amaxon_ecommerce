import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/controller/home/home_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/products/products.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              Utils().imageLogoAsset,
              width: 50,
              height: 50,
            ),
            actions: [
              IconButton(
                onPressed: () => _.onChangeAsc(),
                icon: _.isAsc
                    ? const Icon(
                  Icons.arrow_upward,
                )
                    : const Icon(Icons.arrow_downward),
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  onTap: () => _.onCloseSession(),
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('log out'),
                          Icon(Icons.logout_outlined),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //banner section that has card with slider show different images an name of the product
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: FSColors.cardColor,
                    border: Border.all(
                      color: FSColors.purple,
                    ),
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          bottom: 15,
                          left: 25,
                          right: 25,
                          child: Container(
                            width: 80,
                            height: 80,
                            child: CachedNetworkImage(
                              width: 80,
                              height: 80.0,
                              fit: BoxFit.contain,
                              imageUrl: _.products[0].image!,
                              placeholder: (context, url) => SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgress(
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/sinimagen.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        ),
                        Positioned(
                          top: 5,
                          bottom: 15,
                          left: 25,
                          right: 25,
                          child: Container(
                            width: 80,
                            height: 80,
                            child: CachedNetworkImage(
                              width: 80,
                              height: 80.0,
                              fit: BoxFit.contain,
                              imageUrl: _.products[1].image!,
                              placeholder: (context, url) => SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgress(
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/sinimagen.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        ),
                        Positioned(
                          top: 5,
                          bottom: 15,
                          left: 25,
                          right: 25,
                          child: Container(
                            width: 80,
                            height: 80,
                            child: CachedNetworkImage(
                              width: 80,
                              height: 80.0,
                              fit: BoxFit.contain,
                              imageUrl: _.products[2].image!,
                              placeholder: (context, url) => SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgress(
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                      errorWidget: (context, url, error) => Image.asset(
                                'assets/images/sinimagen.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
        ) ,
        ),
                    ],
                  ),
                ),
                ),
                //list of products in gridview
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _.products.length,
                    itemBuilder: (context, index) {
                      return _buildCard(_.products[index], context, _);
                    },
                  ),
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(Product item, BuildContext context, HomeController _) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: FSColors.cardColor,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              bottom: 15,
              left: 25,
              right: 25,
              child: Container(
                width: 80,
                height: 80,
                child: CachedNetworkImage(
                  width: 40,
                  height: 40.0,
                  fit: BoxFit.contain,
                  imageUrl: item.image!,
                  placeholder: (context, url) => SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgress(
                      width: 10,
                      height: 10,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/sinimagen.png',
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),

              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              left: 10,
              child: SizedBox(
                width: double.minPositive,
                child: Text(
                  item.title!.split(' ').sublist(0, 3).join(' '),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Positioned(
              top: 210,
              right: 15,
              left: 10,
              child: SizedBox(
                width: double.minPositive,
                child: Text(
                  '\$ ${item.price.toString()}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Positioned(
              top: 210,
              right: 5,
              child: OutlinedButton(
                onPressed: () => _.goToDetailProduct(item.id.toString(),item),
                child: Text(
                  S.of(context)!.buy,
                  style: const TextStyle().copyWith(
                    color: FSColors.purple,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
