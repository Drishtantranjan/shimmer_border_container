# shimmer_border_container

A customizable shimmer border container for Flutter with animated gradient borders and resizable components. Perfect for creating elegant glowing buttons or highlight containers.

## 📽 Demo

![Shimmer Border Demo](https://raw.githubusercontent.com/your-username/shimmer_border_container/main/assets/demo.gif)

## Features

- Animated shimmer border effect
- Customizable border width and radius
- Adjustable shimmer speed and gradient color
- Add any child widget inside (text, icon, images, etc.)

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  shimmer_border_container: ^1.0.0
```

## Usage

```dart
import 'package:shimmer_border_container/shimmer_border_container.dart';

ShimmerBorderContainer(
  width: 280,
  height: 70,
  borderRadius: 12,
  shimmerSpeed: Duration(milliseconds: 600),
  borderWidth: 1.0,
  shimmerColor: Colors.white,
  backgroundColor: Colors.white.withOpacity(0.05),
  child: const Text(
    'Join Community',
    style: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
)
```

## Example

A complete example is available in the `example/` directory.

## Example main.dart

```dart
import 'package:flutter/material.dart';
import 'package:shimmer_border_container/shimmer_border_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0F1113),
        body: Center(
          child: ShimmerBorderContainer(
            width: 300,
            height: 80,
            borderRadius: 15,
            shimmerSpeed: const Duration(milliseconds: 500),
            borderWidth: 1,
            shimmerColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.05),
            child: const Text(
              'Join Community',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## License

MIT license.

---
