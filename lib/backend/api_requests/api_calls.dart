import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authorization Group Code

class AuthorizationGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static AccountsCall accountsCall = AccountsCall();
  static CreateAccountLinkCall createAccountLinkCall = CreateAccountLinkCall();
  static RetrieveAccountInformationCall retrieveAccountInformationCall =
      RetrieveAccountInformationCall();
  static CreateAccountSessionsCall createAccountSessionsCall =
      CreateAccountSessionsCall();
  static CheckoutSessionsCall checkoutSessionsCall = CheckoutSessionsCall();
  static StripePaymentLinksCall stripePaymentLinksCall =
      StripePaymentLinksCall();
  static CreateProductCall createProductCall = CreateProductCall();
  static UpdateProductCall updateProductCall = UpdateProductCall();
  static StripeCreatePriceCall stripeCreatePriceCall = StripeCreatePriceCall();
  static StripeUpdatePriceCall stripeUpdatePriceCall = StripeUpdatePriceCall();
  static CustomerSessionCall customerSessionCall = CustomerSessionCall();
  static CreatePLCall createPLCall = CreatePLCall();
}

class AccountsCall {
  Future<ApiCallResponse> call({
    String? businessType = '',
    String? type = '',
    String? country = '',
    String? email = '',
    String? payer = '',
    bool? requested = true,
    bool? transfers = true,
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Accounts',
      apiUrl: '${baseUrl}/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
      },
      params: {
        'business_type': businessType,
        'type': type,
        'country': country,
        'email': email,
        'controller[fees][payer]': payer,
        'capabilities[card_payments][requested]': requested,
        'capabilities[transfers][requested]': transfers,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateAccountLinkCall {
  Future<ApiCallResponse> call({
    String? account = '',
    String? type = '',
    String? refreshUrl = '',
    String? returnUrl = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createAccountLink',
      apiUrl: '${baseUrl}/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
      },
      params: {
        'account': account,
        'type': type,
        'refresh_url': refreshUrl,
        'return_url': returnUrl,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class RetrieveAccountInformationCall {
  Future<ApiCallResponse> call({
    String? accountID = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveAccountInformation',
      apiUrl: '${baseUrl}/accounts/${accountID}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? accountOnboardingFinished(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.charges_enabled''',
      ));
}

class CreateAccountSessionsCall {
  Future<ApiCallResponse> call({
    int? priceId,
    int? quantity,
    int? applicationFeeAmount,
    String? destinationAccountId = '',
    String? successUrl = '',
    String? cancelUrl = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createAccountSessions',
      apiUrl: '${baseUrl}/account_sessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer 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',
        'Stripe-Account': 'acct_1KVWLuCox373OxMX',
      },
      params: {
        'price_is': priceId,
        'quantity': quantity,
        'application_fee_amount': 3,
        'destination_account_id': destinationAccountId,
        'success_url': successUrl,
        'cancel_url': cancelUrl,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckoutSessionsCall {
  Future<ApiCallResponse> call({
    String? cancelUrl = '',
    String? successUrl = '',
    String? connectedAcct = '',
    String? currency = '',
    String? productName = '',
    int? unitAmount,
    int? quantity,
    int? applicationFeeAmount,
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CheckoutSessions',
      apiUrl: '${baseUrl}/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Account': 'acct_1KVWLuCox373OxMX',
        'Authorization':
            'Bearer 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',
      },
      params: {
        'cancel_url': cancelUrl,
        'success_url': successUrl,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][quantity]': quantity,
        'line_items[0][price_data][product_data][name]': productName,
        'line_items[0][price_data][unit_amount]': unitAmount,
        'mode': "payment",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class StripePaymentLinksCall {
  Future<ApiCallResponse> call({
    String? priceid = '',
    int? quantity,
    String? destination = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'stripe payment links',
      apiUrl: '${baseUrl}/payment_links',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Authorization: Bearer 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',
      },
      params: {
        'line_items[0][price]': priceid,
        'line_items[0][quantity]': quantity,
        'transfer_data[destination]': destination,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProductCall {
  Future<ApiCallResponse> call({
    bool? active,
    String? description = '',
    List<String>? imagesList,
    List<String>? featuresList,
    String? name = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();
    final images = _serializeList(imagesList);
    final features = _serializeList(featuresList);

    return ApiManager.instance.makeApiCall(
      callName: 'createProduct',
      apiUrl: '${baseUrl}/products',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Authorization: Bearer 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',
      },
      params: {
        'active': active,
        'description': description,
        'images': images,
        'features': features,
        'name': name,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProductCall {
  Future<ApiCallResponse> call({
    String? product = '',
    double? defaultPrice,
    String? description = '',
    List<String>? imagesList,
    List<String>? featuresList,
    String? name = '',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();
    final images = _serializeList(imagesList);
    final features = _serializeList(featuresList);

    return ApiManager.instance.makeApiCall(
      callName: 'updateProduct',
      apiUrl: '${baseUrl}/products/${product}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Authorization: Bearer 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',
      },
      params: {
        'default_price': defaultPrice,
        'description': description,
        'images': images,
        'features': features,
        'name': name,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StripeCreatePriceCall {
  Future<ApiCallResponse> call({
    int? unitAmount,
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_amount": "${unitAmount}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stripe create price',
      apiUrl: '${baseUrl}/prices/{price}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Authorization: Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StripeUpdatePriceCall {
  Future<ApiCallResponse> call({
    String? price = '',
    int? unitAmount,
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_amount": "${unitAmount}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stripe update price ',
      apiUrl: '${baseUrl}/prices/${price}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomerSessionCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    bool? tableEnabled = true,
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'customerSession',
      apiUrl: '${baseUrl}/customer_sessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer  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',
      },
      params: {
        'customer': customer,
        'components[pricing_table][enabled]': tableEnabled,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatePLCall {
  Future<ApiCallResponse> call({
    String? currency = 'usd',
    String? productName = 'dhdhdhdhdh',
    int? unitAmount = 3000,
    int? quantity = 1,
    String? customer = 'cus_4567890',
    String? successUrl = 'yay.com',
    String? cancelUrl = 'no.com',
  }) async {
    final baseUrl = AuthorizationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createPL',
      apiUrl: '${baseUrl}/payment_links',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer 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',
      },
      params: {
        'line_items[0][currency]': currency,
        'line_items[0][quantity]': quantity,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Authorization Group Code

/// Start ID Check Group Code

class IDCheckGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static VerificationSessionCall verificationSessionCall =
      VerificationSessionCall();
  static UpdateVerificationSessionCall updateVerificationSessionCall =
      UpdateVerificationSessionCall();
  static RetrieveVerificationSessionCall retrieveVerificationSessionCall =
      RetrieveVerificationSessionCall();
  static ListVerificationSessionCall listVerificationSessionCall =
      ListVerificationSessionCall();
  static CancelVerificationSessionCall cancelVerificationSessionCall =
      CancelVerificationSessionCall();
  static RedactVerificationReportCall redactVerificationReportCall =
      RedactVerificationReportCall();
}

class VerificationSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'VerificationSession',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVerificationSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UpdateVerificationSession',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions/:id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveVerificationSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'RetrieveVerificationSession',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions/:id',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVerificationSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listVerificationSession',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelVerificationSessionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelVerificationSession',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions/:id/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RedactVerificationReportCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = IDCheckGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'RedactVerificationReport',
      apiUrl: '${baseUrl}/v1/identity/verification_sessions/:id/redact',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ID Check Group Code

/// Start GoogleAPI Group Code

class GoogleAPIGroup {
  static String getBaseUrl() => 'https://maps.googleapis.com/maps/api';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetDirectionsCall getDirectionsCall = GetDirectionsCall();
  static GetRateCall getRateCall = GetRateCall();
  static AutocompleteCall autocompleteCall = AutocompleteCall();
  static NearbyCall nearbyCall = NearbyCall();
  static GetReferenceCall getReferenceCall = GetReferenceCall();
}

class GetDirectionsCall {
  Future<ApiCallResponse> call({
    String? destination = '',
    String? origin = '',
    String? waypoints = '',
    String? key = 'AIzaSyAawLGPiBxFNY144jjcCZFn7vfDlB-1Csc',
  }) async {
    final baseUrl = GoogleAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getDirections',
      apiUrl: '${baseUrl}/directions/json',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'destination': destination,
        'origin': origin,
        'waypoints': waypoints,
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRateCall {
  Future<ApiCallResponse> call({
    String? units = 'imperial',
    String? origins = '',
    String? destinations = '',
    String? travelmode = 'BICYCLING',
    String? key = 'AIzaSyAawLGPiBxFNY144jjcCZFn7vfDlB-1Csc',
  }) async {
    final baseUrl = GoogleAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getRate',
      apiUrl: '${baseUrl}/distancematrix/json',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'units': "imperial",
        'origins': origins,
        'destinations': destinations,
        'travelMode': "DRIVING",
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
}

class AutocompleteCall {
  Future<ApiCallResponse> call({
    String? input = '',
    String? location = '',
    String? radius = '',
    bool? strictbounds = true,
    String? key = 'AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM',
  }) async {
    final baseUrl = GoogleAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'autocomplete',
      apiUrl: '${baseUrl}/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'input': input,
        'location': location,
        'radius': radius,
        'strictbounds': strictbounds,
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pred(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? placeid(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NearbyCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) async {
    final baseUrl = GoogleAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'nearby',
      apiUrl: '${baseUrl}/place/nearbysearch/json',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'keyword': keyword,
        'location': "30.3107976,-89.3652744",
        'radius': "2000",
        'key': "AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pred(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? placeid(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetReferenceCall {
  Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final baseUrl = GoogleAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getReference',
      apiUrl: '${baseUrl}/place/details/json',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'placeid': input,
        'key': "AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lat''',
      ));
  double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lng''',
      ));
}

/// End GoogleAPI Group Code

/// Start fcgroup Group Code

class FcgroupGroup {
  static String getBaseUrl() => 'https://rabbit-2ba47.uc.r.appspot.com/';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static CreatepaymentintentCall createpaymentintentCall =
      CreatepaymentintentCall();
  static RefundCall refundCall = RefundCall();
  static CreatepayoutCall createpayoutCall = CreatepayoutCall();
  static RetrievedisputeCall retrievedisputeCall = RetrievedisputeCall();
  static WebhookCall webhookCall = WebhookCall();
  static CreateexpressaccountCall createexpressaccountCall =
      CreateexpressaccountCall();
  static AutoCall autoCall = AutoCall();
}

class CreatepaymentintentCall {
  Future<ApiCallResponse> call({
    String? amount = '',
    String? endTime = '',
    String? startTime = '',
    String? driverId = '',
    String? customerId = '',
    int? currency,
  }) async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createpaymentintent',
      apiUrl: '${baseUrl}create_payment_intent',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'amount': amount,
        'currency': "usd",
        'customer_id': customerId,
        'driver_id': driverId,
        'start_time': startTime,
        'end_time': endTime,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefundCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'refund',
      apiUrl: '${baseUrl}refund',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatepayoutCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createpayout',
      apiUrl: '${baseUrl}create_payout',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrievedisputeCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'retrievedispute',
      apiUrl: '${baseUrl}retrieve_dispute',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WebhookCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'webhook',
      apiUrl: '${baseUrl}create_payment_intent',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateexpressaccountCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createexpressaccount',
      apiUrl: '${baseUrl}/create_express_account',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AutoCall {
  Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final baseUrl = FcgroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'auto',
      apiUrl: '${baseUrl}autocomplete',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End fcgroup Group Code

class WeatherCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'weather',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?q=London&appid=4c30fb6bdde1f850e52d45d0754fc524',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? temp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static double? feelsliketemp(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.main.feels_like''',
      ));
  static String? overcastclouds(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].description''',
      ));
  static int? sunset(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sys.sunset''',
      ));
  static int? sunrise(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sys.sunrise''',
      ));
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static double? speed(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.wind.speed''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
