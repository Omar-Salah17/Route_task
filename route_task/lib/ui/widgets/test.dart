import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/ui/cubit/get_products_cubit.dart';
import 'package:route_task/ui/cubit/get_products_state.dart';
import 'package:route_task/domain/entity/product.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/Group 5.png"),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(0, 65, 130, 0.3),
                        ),
                      ),
                      child: const Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'What do you search for?',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(0, 65, 130, 0.7),
                              size: 30,
                            ),
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(6, 0, 79, 0.6),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      child: Image.asset("images/🦆 icon _shopping cart_.png")),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  final productCubit = BlocProvider.of<ProductCubit>(context);

                  if (state is ProductInitial) {
                    productCubit.fetchProducts();
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          var product = state.products[index];
                          return GridTile(
                            child: SizedBox(
                              width: 50,
                              height: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(0, 65, 130, 0.7),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Center(
                                            child: Image.network(
                                              product.images![0],
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              left: 120,
                                              top: 5,
                                              child: Image.asset(
                                                  "images/Group 17.png"))
                                        ],
                                      ),
                                      Text(
                                        product.title!,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(6, 0, 79, 1),
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        product.description!,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(6, 0, 79, 1),
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "EGP ${product.discountPercentage}",
                                            style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(6, 0, 79, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Stack(
                                            children: [
                                              Text(
                                                "\$${product.price}",
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 65, 130, 0.6),
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Divider(
                                                      color: Color.fromRGBO(
                                                          0, 65, 130, 0.6),
                                                      thickness: 1.5,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Review (${product.rating})",
                                              style: const TextStyle(
                                                color:
                                                    Color.fromRGBO(6, 0, 79, 1),
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(
                                                  "images/🦆 icon _plus circle_.png"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
