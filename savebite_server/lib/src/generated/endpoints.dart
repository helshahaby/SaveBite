/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:savebite_server/src/generated/pantry/food_category.dart'
    as _in4i87br;
import 'package:savebite_server/src/generated/pantry/item_status.dart'
    as _is216z6k;
import 'package:savebite_server/src/generated/pantry/storage_type.dart'
    as _i0wijmyl;
import 'package:savebite_server/src/generated/users/user_role.dart'
    as _idrf99d3;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../pantry/pantry_endpoint.dart' as _imzxngxq;
import '../users/user_endpoint.dart' as _ibe74724;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'pantry': _imzxngxq.PantryEndpoint()
        ..initialize(
          server,
          'pantry',
          null,
        ),
      'user': _ibe74724.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['pantry'] = _is.EndpointConnector(
      name: 'pantry',
      endpoint: endpoints['pantry']!,
      methodConnectors: {
        'getPantryItems': _is.MethodConnector(
          name: 'getPantryItems',
          params: {
            'statusFilter': _is.ParameterDescription(
              name: 'statusFilter',
              type: _is.getType<_is216z6k.ItemStatus?>(),
              nullable: true,
            ),
            'storageFilter': _is.ParameterDescription(
              name: 'storageFilter',
              type: _is.getType<_i0wijmyl.StorageType?>(),
              nullable: true,
            ),
            'categoryFilter': _is.ParameterDescription(
              name: 'categoryFilter',
              type: _is.getType<_in4i87br.FoodCategory?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .getPantryItems(
                    session,
                    statusFilter: params['statusFilter'],
                    storageFilter: params['storageFilter'],
                    categoryFilter: params['categoryFilter'],
                  ),
        ),
        'addPantryItem': _is.MethodConnector(
          name: 'addPantryItem',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<_in4i87br.FoodCategory>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'unit': _is.ParameterDescription(
              name: 'unit',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'storageType': _is.ParameterDescription(
              name: 'storageType',
              type: _is.getType<_i0wijmyl.StorageType>(),
              nullable: false,
            ),
            'expirationDate': _is.ParameterDescription(
              name: 'expirationDate',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'cost': _is.ParameterDescription(
              name: 'cost',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .addPantryItem(
                    session,
                    name: params['name'],
                    category: params['category'],
                    quantity: params['quantity'],
                    unit: params['unit'],
                    storageType: params['storageType'],
                    expirationDate: params['expirationDate'],
                    cost: params['cost'],
                    notes: params['notes'],
                  ),
        ),
        'updatePantryItem': _is.MethodConnector(
          name: 'updatePantryItem',
          params: {
            'itemId': _is.ParameterDescription(
              name: 'itemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<_in4i87br.FoodCategory>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'unit': _is.ParameterDescription(
              name: 'unit',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'storageType': _is.ParameterDescription(
              name: 'storageType',
              type: _is.getType<_i0wijmyl.StorageType>(),
              nullable: false,
            ),
            'expirationDate': _is.ParameterDescription(
              name: 'expirationDate',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'cost': _is.ParameterDescription(
              name: 'cost',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .updatePantryItem(
                    session,
                    itemId: params['itemId'],
                    name: params['name'],
                    category: params['category'],
                    quantity: params['quantity'],
                    unit: params['unit'],
                    storageType: params['storageType'],
                    expirationDate: params['expirationDate'],
                    cost: params['cost'],
                    notes: params['notes'],
                  ),
        ),
        'markConsumed': _is.MethodConnector(
          name: 'markConsumed',
          params: {
            'itemId': _is.ParameterDescription(
              name: 'itemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .markConsumed(
                    session,
                    itemId: params['itemId'],
                  ),
        ),
        'markWasted': _is.MethodConnector(
          name: 'markWasted',
          params: {
            'itemId': _is.ParameterDescription(
              name: 'itemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['pantry'] as _imzxngxq.PantryEndpoint).markWasted(
                    session,
                    itemId: params['itemId'],
                  ),
        ),
        'deletePantryItem': _is.MethodConnector(
          name: 'deletePantryItem',
          params: {
            'itemId': _is.ParameterDescription(
              name: 'itemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .deletePantryItem(
                    session,
                    itemId: params['itemId'],
                  ),
        ),
        'getDashboardSummary': _is.MethodConnector(
          name: 'getDashboardSummary',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .getDashboardSummary(session),
        ),
        'getMealSuggestions': _is.MethodConnector(
          name: 'getMealSuggestions',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pantry'] as _imzxngxq.PantryEndpoint)
                  .getMealSuggestions(session),
        ),
      },
    );
    connectors['user'] = _is.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getMyProfile': _is.MethodConnector(
          name: 'getMyProfile',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _ibe74724.UserEndpoint)
                  .getMyProfile(session),
        ),
        'completeOnboarding': _is.MethodConnector(
          name: 'completeOnboarding',
          params: {
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'role': _is.ParameterDescription(
              name: 'role',
              type: _is.getType<_idrf99d3.UserRole>(),
              nullable: false,
            ),
            'phoneNumber': _is.ParameterDescription(
              name: 'phoneNumber',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _ibe74724.UserEndpoint)
                  .completeOnboarding(
                    session,
                    fullName: params['fullName'],
                    role: params['role'],
                    phoneNumber: params['phoneNumber'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
