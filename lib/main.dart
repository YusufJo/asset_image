import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Res-Aware images'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Exact scale loading',
              style: theme.textTheme.headline5,
            ),
            const SizedBox(height: 5),
            Text(
              "ExactAssetImage('asset/icon/layers.png', scale: scale)",
              style: theme.textTheme.caption,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: const [
                ResAwareLayersIcon(scale: 1),
                ResAwareLayersIcon(scale: 2),
                ResAwareLayersIcon(scale: 3),
                ResAwareLayersIcon(scale: 4),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(),
            ),
            Text(
              'Exact path loading',
              style: theme.textTheme.headline5,
            ),
            const SizedBox(height: 5),
            Text(
              "AssetImage('asset/icon/\${scale}x/layers.png')",
              style: theme.textTheme.caption,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: const [
                ExactPathLayersIcon(scale: 1),
                ExactPathLayersIcon(scale: 2),
                ExactPathLayersIcon(scale: 3),
                ExactPathLayersIcon(scale: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResAwareLayersIcon extends StatelessWidget {
  const ResAwareLayersIcon({Key? key, required this.scale}) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: ExactAssetImage('asset/icon/layers.png', scale: scale),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text('Scale: $scale'),
          ],
        ),
      ),
    );
  }
}

class ExactPathLayersIcon extends StatelessWidget {
  const ExactPathLayersIcon({Key? key, required this.scale}) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: scale == 1.0
                    ? const AssetImage('asset/icon/layers.png')
                    : AssetImage('asset/icon/${scale}x/layers.png'),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text('Scale: $scale'),
          ],
        ),
      ),
    );
  }
}
