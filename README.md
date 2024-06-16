
# AI Companion

A Flutter package for a personal AI companion providing psychological support. The AI companion offers empathetic and proactive mental health support through a user-friendly mobile interface.

## Features

- Chat with AI
- Health Check-ins
- Notifications and Reminders
- User-friendly Interface
- Statistical Reporting and Feedback Loops

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  ai_companion:
    git:
      url: https://github.com/jrbiltmore/ai_companion.git
```

Import the package in your Dart code:

```dart
import 'package:ai_companion/ai_companion.dart';
```

## Usage

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Companion',
      home: HomeScreen(),
    );
  }
}
```

## Docker

To build and run the application using Docker, use the following commands:

Build the Docker image:
```sh
docker build -t ai-companion .
```

Run the Docker container:
```sh
docker run -p 8080:8080 ai-companion
```

## Docker Compose

To use Docker Compose for managing the containers, use the following command:

```sh
docker-compose up --build
```

## Kubernetes

To deploy the application on Kubernetes, apply the manifests in the `kubernetes` directory:

```sh
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
```

## CD/CI

This project uses GitHub Actions for Continuous Integration and Continuous Deployment. The workflows are defined in the `.github/workflows` directory.

## Statistical Reporting and Feedback Loops

The `StatisticsService` in `lib/services/statistics_service.dart` handles reporting usage statistics and retrieving user feedback to improve the AI companion.

## Datasets

The `scripts/fetch_datasets.py` script fetches open datasets for AI training. Run the script using the following command:

```sh
python scripts/fetch_datasets.py
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

Neural Nexus, J.T. Redmond, Jacob Biltmore

## Contact

For any inquiries, please contact neurosearchers@icloud.com
