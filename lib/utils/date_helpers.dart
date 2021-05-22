class DateHelpers {
  static String getTimeGreeting(DateTime time) {
    final int currentHour = time.hour;

    if (currentHour >= 5 && currentHour <= 12) {
      return 'Morning';
    }
    if (currentHour >= 13 && currentHour <= 17) {
      return 'Afternoon';
    }
    if (currentHour >= 18 && currentHour <= 23) {
      return 'Evening';
    }
    if (currentHour >= 0 && currentHour <= 4) {
      return 'Night';
    }
    return 'Unknown time';
  }
}