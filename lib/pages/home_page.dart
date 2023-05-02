import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:task_number_one/models/ticker_model.dart';
import 'package:task_number_one/service/api_service.dart';
import 'package:dio/dio.dart';

import '../widgets/ticker_item_list_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Binance Price"),
        centerTitle: true,
      ),
      body: _body(),
      backgroundColor: Colors.grey[900],
/*       bottomNavigationBar: MyBottomNavigationBar, */
    );
  }

  FutureBuilder _body() {
    final apiService = ApiService(
      Dio(
        BaseOptions(contentType: "application/json"),
      ),
    );
    return FutureBuilder<List<TickerModel>>(
        future: apiService.getTickers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final tickers = snapshot.data!;
            return _tickers(tickers);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _tickers(List<TickerModel> tickers) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        final ticker = tickers[index];
        return TickerItemListView(ticker);
      },
    );
  }
}
