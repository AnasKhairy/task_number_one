
import 'package:flutter/material.dart';

import '../models/ticker_model.dart';

class TickerItemListView extends StatelessWidget {
  const TickerItemListView(this.ticker, {super.key});
  final TickerModel ticker;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ticker.symbol,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            children: [
              Text(
                ticker.lastPrice,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 7,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ticker.priceChangePercentDouble > 0
                      ? Colors.green
                      : double.parse(ticker.priceChangePercent) < 0
                          ? Colors.red
                          : Colors.grey,
                ),
                child: Text('${ticker.priceChangePercent} %'),
              )
            ],
          )
        ],
      ),
    );
  }
}
