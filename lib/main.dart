import 'package:f_provider/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: value.getIsDark
                ? ThemeData.dark()
                : ThemeData.light(),
            home: HomePage(),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme =
        Provider.of<ThemeProvider>(context, listen: false);

    print("build");

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "app bar",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return Text(value.getIsDark ? "Dark" : "Light");
            },
          ),
          const SizedBox(),
          TextButton(
            onPressed: () {
              theme.changeTheme();
            },
            child: const Text("change theme"),
          ),
        ],
      ),
    );
  }
}
