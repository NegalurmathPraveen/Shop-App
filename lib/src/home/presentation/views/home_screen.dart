import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/init_app.dart';
import '../bloc/home_bloc.dart';
import 'widgets/offer_card.dart';
import 'widgets/product_grid.dart';
import 'widgets/searchbar_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final bloc = getIt<HomeBloc>();

  @override
  void initState() {
    bloc.add(GetProductListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Shop App"),
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchbarGrid(
                onChanged: (text) {
                  bloc.add(SearchProductListEvent(text));
                },
              ),
              const OfferCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.h,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.h,
                      ),
                    ),
                  )
                ],
              ),
              5.verticalSpace,
              BlocProvider.value(
                value: bloc,
                child: Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(GetProductListEvent());
                    },
                    child: const ProductGrid(),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
