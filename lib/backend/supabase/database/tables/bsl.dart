import '../database.dart';

class BslTable extends SupabaseTable<BslRow> {
  @override
  String get tableName => 'BSL';

  @override
  BslRow createRow(Map<String, dynamic> data) => BslRow(data);
}

class BslRow extends SupabaseDataRow {
  BslRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BslTable();

  int get name => getField<int>('name')!;
  set name(int value) => setField<int>('name', value);

  String? get typeOfPlace => getField<String>('type_of_place');
  set typeOfPlace(String? value) => setField<String>('type_of_place', value);

  String? get googlePlaceId => getField<String>('google_place_id');
  set googlePlaceId(String? value) =>
      setField<String>('google_place_id', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get rating => getField<String>('rating');
  set rating(String? value) => setField<String>('rating', value);

  String? get hours => getField<String>('hours');
  set hours(String? value) => setField<String>('hours', value);

  String? get reviews => getField<String>('reviews');
  set reviews(String? value) => setField<String>('reviews', value);

  String? get productsServices => getField<String>('products_services');
  set productsServices(String? value) =>
      setField<String>('products_services', value);

  String? get trafficSummary => getField<String>('traffic_summary');
  set trafficSummary(String? value) =>
      setField<String>('traffic_summary', value);

  String? get specials => getField<String>('specials');
  set specials(String? value) => setField<String>('specials', value);

  String? get favoriteProductsServices =>
      getField<String>('favorite_products_services');
  set favoriteProductsServices(String? value) =>
      setField<String>('favorite_products_services', value);

  String? get weeklyEvents => getField<String>('weekly_events');
  set weeklyEvents(String? value) => setField<String>('weekly_events', value);

  String? get popularTimes => getField<String>('popular_times');
  set popularTimes(String? value) => setField<String>('popular_times', value);

  String? get productServiceDetails =>
      getField<String>('product_service_details');
  set productServiceDetails(String? value) =>
      setField<String>('product_service_details', value);

  String? get customerDemographics => getField<String>('customer_demographics');
  set customerDemographics(String? value) =>
      setField<String>('customer_demographics', value);

  String? get eventsActivities => getField<String>('events_activities');
  set eventsActivities(String? value) =>
      setField<String>('events_activities', value);

  String? get serviceQuality => getField<String>('service_quality');
  set serviceQuality(String? value) =>
      setField<String>('service_quality', value);

  String? get ambiance => getField<String>('ambiance');
  set ambiance(String? value) => setField<String>('ambiance', value);

  String? get accessibility => getField<String>('accessibility');
  set accessibility(String? value) => setField<String>('accessibility', value);

  String? get specialFeatures => getField<String>('special_features');
  set specialFeatures(String? value) =>
      setField<String>('special_features', value);

  String? get healthSafety => getField<String>('health_safety');
  set healthSafety(String? value) => setField<String>('health_safety', value);

  String? get userGeneratedContent =>
      getField<String>('user_generated_content');
  set userGeneratedContent(String? value) =>
      setField<String>('user_generated_content', value);

  String? get pictureLinks => getField<String>('picture_links');
  set pictureLinks(String? value) => setField<String>('picture_links', value);
}
