Future<void> init() async {
  // Get.put<DatabaseHelper>(DatabaseHelper());
  // await Get.putAsync<DatabaseHelper>(() => DatabaseHelper.to.init());

  /// Api Client

  // Get.lazyPut(() => ApiClient(url: EndPoints.baseUrl), fenix: true);

  /// Repository

  // Get.lazyPut(() => HomeRepo(), fenix: true);
  // Get.lazyPut(() => AuthRepo(), fenix: true);
  // Get.lazyPut(() => MainRepo(), fenix: true);
  // Get.lazyPut(() => MachinRepo(), fenix: true);
  // Get.lazyPut(() => CartRepo(apiClient: Get.find()), fenix: true);

  /// Controllers

  // Get.lazyPut(() => AppThemeController(), fenix: true);

  // Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
}
