import 'package:data_art_task/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../enums/transaction_type.dart';
import '../../../store/store.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  int transactionCount(TransactionType type) =>
      store.state.transactions.where((element) => element.type == type).length;

  Map<String, double> get dataMap {
    final int transferCount = transactionCount(TransactionType.TRANSFER);
    final int depositCount = transactionCount(TransactionType.DEPOSIT);
    final int withdrawalCount = transactionCount(TransactionType.WITHDRAWAL);

    return {
      '${TransactionType.TRANSFER.title} ($transferCount)':
          transferCount.toDouble(),
      '${TransactionType.DEPOSIT.title} ($depositCount)':
          depositCount.toDouble(),
      '${TransactionType.WITHDRAWAL.title} ($withdrawalCount)':
          withdrawalCount.toDouble(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 1500),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const [
        Colors.red,
        Colors.blue,
        Colors.orange,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: context.theme.primaryText,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
      ),
    );
  }
}
