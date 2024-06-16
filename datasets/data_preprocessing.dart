
import 'dart:io';

class DataPreprocessing {
  Future<void> preprocessData(String inputFilePath, String outputFilePath) async {
    final inputFile = File(inputFilePath);
    final outputFile = File(outputFilePath);

    final lines = await inputFile.readAsLines();
    final processedLines = lines.map((line) => line.trim()).where((line) => line.isNotEmpty);

    await outputFile.writeAsString(processedLines.join('\n'));
  }
}
