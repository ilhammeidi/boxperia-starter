import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/models/voucher.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/utils/no_data.dart';
import 'package:booking_app/widgets/cards/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PromoVoucherList extends StatelessWidget {
  const PromoVoucherList({super.key, required this.dataList});

  final List<Voucher> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty ? ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: dataList.length,
      padding: EdgeInsets.only(
        top: spacingUnit(2),
        left: spacingUnit(2),
        right: spacingUnit(2),
        bottom: spacingUnit(4),
      ),
      itemBuilder: ((BuildContext context, int index) {
        Voucher item = dataList[index];
        return Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppLink.voucherDetail);
            },
            child: VoucherCard(
              title: item.title,
              desc: item.desc,
              onSelected: (_) {},
              isSelected: false,
              color: item.color,
              image: item.image ?? item.image,
              status: VoucherStatus.readonly
            ),
          ),
        );
      }),
    ) : _emptyList(context);
  }

  Widget _emptyList(BuildContext context) {
    return NoData(
      image: ImgApi.emptyVoucher,
      title: 'You don\'t any vouchers yet',
      desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
    );
  }
}