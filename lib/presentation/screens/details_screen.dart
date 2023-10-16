import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter_app/presentation/counter/cubit/counter_cubit.dart';
import 'package:learning_flutter_app/presentation/providers/theme_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.extra, super.key});

  final Map<String, Widget> extra;

  void checkPermission(Permission permission) async {
    permission.request();
    var status = await permission.status;

    if (status.isDenied) {
      print("Permission is denied");
    } else if (status.isGranted) {
      print("Permission is granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$state',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: const Icon(Icons.remove),
                    )
                  ],
                ),
                extra["title"]!,
                extra["subtitle"]!,
                ElevatedButton(
                  onPressed: () {
                    context.go("/");
                  },
                  child: const Text("go back"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: const Text("theme")),
                ElevatedButton(
                    onPressed: () {
                      checkPermission(Permission.location);
                    },
                    child: const Text("Show Permission"))
              ],
            ),
          );
        },
      ),
    );
  }
}
