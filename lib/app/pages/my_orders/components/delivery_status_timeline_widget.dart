import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/utils/constants.dart';
import '../my_orders_controller.dart';

class DeliveryStatusTimelineWidget extends StatelessWidget {
  final List<String>? historic;

  const DeliveryStatusTimelineWidget({
    Key? key,
    this.historic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myOrdersController = Provider.of<MyOrdersController>(context);

    return Container(
      height: myOrdersController.calculateSize(historic!.length),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: historic!.length,
        itemBuilder: (context, index) {
          return TimelineTile(
            nodePosition: 0,
            contents: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '${historic![index]}',
                style: GoogleFonts.poppins(
                  color: Constants.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            node: TimelineNode(
              indicator: DotIndicator(
                //position: 0,
                color: Constants.blackColor,
                child: myOrdersController.iconStatus(historic![index]),
              ),
              startConnector: Connector.dashedLine(
                gap: 4,
                color: Constants.blackColor,
                thickness: 3,
                indent: historic![index].contains('placed') ? 20 : 0,
              ),
              endConnector: Connector.dashedLine(
                gap: 4,
                color: Constants.blackColor,
                thickness: 3,
                indent: 2,
                endIndent: index == historic!.length -1 ? 20 : 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
