import 'package:booking_app/constants/app_const.dart';
import 'package:booking_app/models/voucher.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/promo/promo_grid.dart';
import 'package:booking_app/widgets/promo/promo_voucher_grid.dart';
import 'package:booking_app/widgets/promo/promo_voucher_list.dart';
import 'package:booking_app/widgets/promo/tab_menu_promo.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/models/promo.dart';
import 'package:booking_app/widgets/promo/promo_list.dart';
import 'package:booking_app/widgets/search/search_common/search_input_btn.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  bool _showSearch = false;
  int _current = 0;

  final List<Widget> _tabContentList = <Widget>[
    PromoList(items: promoList, isHome: true),
    PromoVoucherList(dataList: voucherList)
  ];
  
  final List<Widget> _tabContentGrid = <Widget>[
    PromoGrid(items: promoList, isHome: true),
    PromoVoucherGrid(dataList: voucherList)
  ];

  void toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
    });
  }

  void _changeMenu(int index) {
    setState(() {
      _current = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        forceMaterialTransparency: true,
        backgroundColor: colorScheme(context).surface,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        /// TITLE AND SEARCH
        title: _showSearch ?
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(2), horizontal: spacingUnit(2)),
            child: SearchInputBtn(
              location: '/search-list',
              title: 'Search Promo',
              onCancel: () {
                toggleSearch();
              },
            ),
          ) : const Text('Promos', style: ThemeText.title2,),
        actions: [
          /// SEARCH BUTTON
          !_showSearch ? IconButton(
            icon: const Icon(Icons.search, size: 40),
            onPressed: () {
              toggleSearch();
            },
          ) : Container(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: DecoratedBox(
            decoration: BoxDecoration(color: colorScheme(context).surfaceContainerLowest),
            child: Column(
              children: [
                Text('Check All Promos and Your Voucers by ${branding.name}'),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: ThemeSize.sm
                  ),
                  child: TabMenuPromo(onSelect: _changeMenu, current: _current)
                )
              ]
            ),
          ),
        ),
      ),
      body: ThemeBreakpoints.smUp(context) ? _tabContentGrid[_current] : _tabContentList[_current]
    );
  }
}