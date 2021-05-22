import 'package:flutter_test/flutter_test.dart';

import '../../lib/utils/date_helpers.dart';
main() {
  group('Utils', () {
    group('getTimeGreeting', () {
      test('should return Morning', () {
        // Arrange
        final DateTime morningTime = DateTime(2021, 1, 1, 6);
        // Act
        String timeOfTheDay = DateHelpers.getTimeGreeting(morningTime);

        // Assert
        expect(timeOfTheDay, 'Morning');
      });
      test('should return Afternoon', () {
        // Arrange
        final DateTime morningTime = DateTime(2021, 1, 1, 15);
        // Act
        String timeOfTheDay = DateHelpers.getTimeGreeting(morningTime);

        // Assert
        expect(timeOfTheDay, 'Afternoon');
      });
      test('should return Evening', () {
        // Arrange
        final DateTime morningTime = DateTime(2021, 1, 1, 19);
        // Act
        String timeOfTheDay = DateHelpers.getTimeGreeting(morningTime);

        // Assert
        expect(timeOfTheDay, 'Evening');
      });
      test('should return Night', () {
        // Arrange
        final DateTime morningTime = DateTime(2021, 1, 1, 24);
        // Act
        String timeOfTheDay = DateHelpers.getTimeGreeting(morningTime);

        // Assert
        expect(timeOfTheDay, 'Night');
      });
    });
  });
  // test('', body)
}