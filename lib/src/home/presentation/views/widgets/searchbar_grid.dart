import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/widgets/custom_icon_button.dart';

class SearchbarGrid extends StatefulWidget {
  final Function(String)? onChanged;

  const SearchbarGrid({super.key, this.onChanged});

  @override
  State<SearchbarGrid> createState() => _SearchbarGridState();
}

class _SearchbarGridState extends State<SearchbarGrid> {
  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: SearchBar(
            controller: searchbarController,
            onChanged: widget.onChanged,
            leading: Padding(padding: EdgeInsets.symmetric(horizontal: 7.w), child: const Icon(Icons.search, color: Colors.grey)),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            surfaceTintColor: MaterialStateProperty.all(Colors.grey.shade500),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
            hintStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, color: Colors.grey)),
            hintText: "Search Product",
          )),
          5.horizontalSpace,
          CustomIconButton(icon: Icons.shopping_cart_outlined, onPressed: () {}),
          5.horizontalSpace,
          CustomIconButton(icon: Icons.notifications_none_outlined, onPressed: () {}),
        ],
      ),
    );
  }
}
