import 'package:cpa_core/generated/l10n.dart';
import 'package:intl/intl.dart';

abstract class FormateDate {
  /// Example: December 10, 2025
  static String formatLong(String? dateStr) {
    return _format(dateStr, DateFormat.yMMMMd('en_US'));
  }

  /// Example: 10 Dec 2025
  static String formatMedium(String? dateStr) {
    return _format(dateStr, DateFormat('d MMM yyyy', 'en_US'));
  }

  /// Example: 10/12/2025
  static String formatShort(String? dateStr) {
    return _format(dateStr, DateFormat('dd/MM/yyyy', 'en_US'));
  }

  /// Example: 2025-12-10
  static String formatIso(String? dateStr) {
    return _format(dateStr, DateFormat('yyyy-MM-dd', 'en_US'));
  }

  /// Example: 10 Dec 2025 - 14:22
  static String formatWithTime(String? dateStr) {
    return _format(dateStr, DateFormat('d MMM yyyy - HH:mm', 'en_US'));
  }

  /// Wednesday, December 10, 2025
  static String fullDay(String? dateStr) =>
      _format(dateStr, DateFormat('EEEE, MMMM d, yyyy'));

  /// Wed, 10 Dec 2025
  static String fullDayShort(String? dateStr) =>
      _format(dateStr, DateFormat('EEE, d MMM yyyy'));

  /// 10 December 2025 at 14:22
  static String fullWithTime(String? dateStr) =>
      _format(dateStr, DateFormat('d MMMM yyyy at HH:mm'));
  // 🆕 Example: 12 hours ago | 1 day ago
  static String formatRelative(String? dateStr) {
    if (dateStr == null) return CoreLocalizations().justNow;

    try {
      final date = DateTime.parse(dateStr);
      final diff = DateTime.now().difference(date);

      if (diff.inSeconds < 60) {
        return CoreLocalizations().justNow;
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes} ${CoreLocalizations().minute} ${CoreLocalizations().age}';
      } else if (diff.inHours < 24) {
        return '${diff.inHours} ${CoreLocalizations().hour} ${CoreLocalizations().age}';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} ${CoreLocalizations().day} ${CoreLocalizations().age}';
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks ${CoreLocalizations().week} ${CoreLocalizations().age}';
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return '$months ${CoreLocalizations().month} ${CoreLocalizations().age}';
      } else {
        final years = (diff.inDays / 365).floor();
        return '$years ${CoreLocalizations().year} ${CoreLocalizations().age}';
      }
    } catch (_) {
      return CoreLocalizations().justNow;
    }
  }

  /// Private shared formatter
  static String _format(String? dateStr, DateFormat formatter) {
    try {
      final date = dateStr == null ? DateTime.now() : DateTime.parse(dateStr);
      return formatter.format(date);
    } catch (_) {
      return formatter.format(DateTime.now());
    }
  }
}
