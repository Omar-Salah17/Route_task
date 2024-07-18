import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/ui/cubit/get_products_cubit.dart';
import 'package:route_task/ui/cubit/get_products_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/Group 5.png"),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 2.w,
                          color: const Color.fromRGBO(0, 65, 130, 0.3),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'What do you search for?',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(0, 65, 130, 0.7),
                              size: 30.sp,
                            ),
                            hintStyle: TextStyle(
                                color: const Color.fromRGBO(6, 0, 79, 0.6),
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
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
                      padding: EdgeInsets.only(right: 15.0.w, bottom: 15.h),
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
                              width: 50.w,
                              height: 100.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(0, 65, 130, 0.7),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Center(
                                            child: Image.network(
                                              product.images![0],
                                              height: 100.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              left: 105.w,
                                              top: 5.h,
                                              child: Image.asset(
                                                  "images/Group 17.png"))
                                        ],
                                      ),
                                      Text(
                                        product.title!,
                                        style: TextStyle(
                                          color:
                                              const Color.fromRGBO(6, 0, 79, 1),
                                          fontSize: 16.sp,
                                        ),
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        product.description!,
                                        style: TextStyle(
                                          color:
                                              const Color.fromRGBO(6, 0, 79, 1),
                                          fontSize: 14.sp,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "EGP ${product.discountPercentage}",
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  6, 0, 79, 1),
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Stack(
                                            children: [
                                              Text(
                                                "${product.price}",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      0, 65, 130, 0.6),
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Divider(
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 65, 130, 0.6),
                                                      thickness: 1.5.sp,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Review (${product.rating})",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    6, 0, 79, 1),
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
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
