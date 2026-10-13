import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../util/auth_helpers.dart';

/// Endpoint managing user profile data and initial onboarding.
class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retrieves the current user's profile, or null if onboarding is not yet complete.
  Future<UserProfile?> getMyProfile(Session session) async {
    final authUserId = session.requiredAuthUserId;
    return await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );
  }

  /// Completes or updates onboarding details for the authenticated user.
  Future<UserProfile> completeOnboarding(
    Session session, {
    required String fullName,
    required UserRole role,
    String? phoneNumber,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final trimmedName = fullName.trim();
    if (trimmedName.length < 2) {
      throw FormatException('Full name must be at least 2 characters.');
    }

    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    final now = DateTime.now();
    if (existing != null) {
      existing.fullName = trimmedName;
      existing.role = role;
      existing.phoneNumber = phoneNumber?.trim();
      existing.updatedAt = now;
      return await UserProfile.db.updateRow(session, existing);
    } else {
      final newProfile = UserProfile(
        authUserId: authUserId,
        fullName: trimmedName,
        role: role,
        phoneNumber: phoneNumber?.trim(),
        createdAt: now,
        updatedAt: now,
      );
      return await UserProfile.db.insertRow(session, newProfile);
    }
  }
}
