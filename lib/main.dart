import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab11/config/container_config.dart'; // Імпортуємо модель конфігурації

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContainerConfig(),
      child: TextPreviewerApp(),
    ),
  );
}

class TextPreviewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container Configurator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class SliderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: context.watch<ContainerConfig>().width,
          min: 50,
          max: 400,
          label: 'Width: ${context.watch<ContainerConfig>().width.toInt()}',
          onChanged: (value) {
            context.read<ContainerConfig>().updateWidth(value);
          },
        ),
        Slider(
          value: context.watch<ContainerConfig>().height,
          min: 50,
          max: 400,
          label: 'Height: ${context.watch<ContainerConfig>().height.toInt()}',
          onChanged: (value) {
            context.read<ContainerConfig>().updateHeight(value);
          },
        ),
        Slider(
          value: context.watch<ContainerConfig>().borderRadius,
          min: 0,
          max: 50,
          label: 'Border Radius: ${context.watch<ContainerConfig>().borderRadius.toInt()}',
          onChanged: (value) {
            context.read<ContainerConfig>().updateBorderRadius(value);
          },
        ),
      ],
    );
  }
}
class RedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.watch<ContainerConfig>().width,
      height: context.watch<ContainerConfig>().height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(context.watch<ContainerConfig>().borderRadius),
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Configurator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SliderSection(), // Секція зі слайдерами
            SizedBox(height: 30),
            RedContainer(), // Червоний контейнер
          ],
        ),
      ),
    );
  }
}

