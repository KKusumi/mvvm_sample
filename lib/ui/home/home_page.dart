import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: const HomePageBody(),
          floatingActionButton: _HomePageFloatingActionButton(),
        )
    );
  }
}

class _HomePageFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: Provider
            .of<HomeViewModel>(context, listen: false)
            .incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add)
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    var viewModel = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times.'
          ),
          Text(
            Provider.of<HomeViewModel>(context).counter.toString(),
            style: Theme.of(context).textTheme.bodyText1
          )
        ]
      )
    );
  }
}
