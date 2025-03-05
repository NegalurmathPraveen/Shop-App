import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/extensions/widget_extension.dart';
import 'package:shop_app/core/widgets/custom_icon_button.dart';
import 'package:shop_app/src/home/presentation/views/widgets/empty_products_widget.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/product_model.dart';
import '../../bloc/home_bloc.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<ProductModel> shimmerList() => List.generate(
      10,
      (index) => ProductModel(
          id: index,
          title: "title",
          price: index + 10,
          description: "description",
          category: "category",
          image: "https://www.iconsdb.com/icons/preview/white/photo-xxl.png",
          rating: Rating(count: 4, rate: 10)));

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is ProductListFailedState) {
          return CustomErrorWidget(
            onRetry: () {
              bloc.add(GetProductListEvent());
            },
            errorMessage: state.message,
          );
        }
        final isLoading = state is ProductListLoadingState;
        final productList = state is ProductListLoadedState ? bloc.productList : shimmerList();
        if (productList.isEmpty) {
          return const EmptyProductsWidget();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            final isFavourite = isLoading ? false : bloc.favouriteList.contains(bloc.productList[index]);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.w)),
                  child: Image.network(
                    product.image,
                    frameBuilder: (_, image, frame, __) {
                      if (frame == null) {
                        return const Icon(
                          Icons.image_outlined,
                          size: 50,
                        );
                      }
                      return image;
                    },
                    filterQuality: FilterQuality.low,
                    color: Colors.grey.withOpacity(0.1),
                    colorBlendMode: BlendMode.difference,
                    width: 75.w,
                    height: 75.h,
                    fit: BoxFit.fill,
                  ),
                ).shimmer(enableShimmer: isLoading),
                8.verticalSpace,
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.w,
                    fontWeight: FontWeight.bold,
                  ),
                ).shimmer(enableShimmer: isLoading, width: 75),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        fontSize: 14.w,
                        color: Colors.orange,
                      ),
                    ).shimmer(enableShimmer: isLoading, width: 100),
                    CustomIconButton(
                        padding: 5,
                        size: 20,
                        icon: isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
                        iconColor: isFavourite ? Colors.red : null,
                        bgColor: isFavourite ? Colors.redAccent.withOpacity(0.2) : null,
                        onPressed: () {
                          bloc.add(MarkAsFavouriteEvent(model: product, favouritiseItem: !isFavourite));
                        }).shimmer(enableShimmer: isLoading)
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
