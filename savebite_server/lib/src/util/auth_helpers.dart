import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart' hide UserProfile;

/// Helper extensions for resolving authenticated user identity safely.
extension SessionAuthHelper on Session {
  /// Returns the authenticated user's UuidValue ID.
  /// Throws a [FormatException] if the session is not authenticated.
  UuidValue get requiredAuthUserId {
    final authInfo = authenticated;
    if (authInfo == null) {
      throw FormatException('User is not authenticated.');
    }
    return authInfo.authUserId;
  }
}
