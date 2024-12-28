import 'package:flutter/material.dart';
import 'package:stock_market_app/presentation/screens/home/home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc(stockName: "Nifty50");
  @override
  void initState() {
    super.initState();
    _homeBloc.add(HomeDataInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
