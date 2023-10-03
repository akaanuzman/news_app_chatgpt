// Import the test package and Counter class
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_chatgpt/features/models/news_model.dart';
import 'package:news_app_chatgpt/features/models/security_keys_model.dart';
import 'package:news_app_chatgpt/features/models/user_model.dart';
import 'package:news_app_chatgpt/products/constants/index.dart';
import 'package:news_app_chatgpt/products/enums/Collections.dart';
import 'package:news_app_chatgpt/products/initialize/app_initialize.dart';
import 'package:news_app_chatgpt/products/services/api_service.dart';
import 'package:news_app_chatgpt/products/services/index.dart';

void main() async {
  await AppInitialize.initializeApp();

  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  /// Test for [LocaleStorageService]
  group(
    'Local Storage',
    () {
      test(
        'Local Storage Read-Write Case',
        () async {
          final LocaleStorageService localeStorageService =
              LocaleStorageService();
          await localeStorageService.write(key: "key", value: "value");
          String? value = await localeStorageService.read("key");

          expect(value, "value");
        },
      );

      test(
        'Local Storage Delete-Write Case',
        () async {
          final LocaleStorageService localeStorageService =
              LocaleStorageService();
          await localeStorageService.delete("key");
          String? value = await localeStorageService.read("key");

          expect(value, null);
        },
      );
    },
  );

  /// Test for [FireStoreService],
  group(
    'Firestore Test',
    () {
      test(
        'Firestore Create Document Case',
        () async {
          UserModel mockedUser = const UserModel(
            id: "id",
            name: "test",
            email: "test@test.com",
            profilePicture: "user.photoURL",
            isActive: true,
          );

          bool isSuccess = await FireStoreService.createDocument<UserModel>(
            model: mockedUser,
            collection: Collections.Users,
            docId: mockedUser.id!,
          );

          expect(isSuccess, true);
        },
      );

      test(
        'Firestore Read Document Case',
        () async {
          UserModel? mockedUser =
              await FireStoreService.readDocument<UserModel>(
            model: const UserModel(),
            collection: Collections.Users,
            docId: 'id',
          );

          expect(mockedUser, isNotNull);
        },
      );
    },
  );

  /// Test For [ApiService]
  group('Api Service Test', () {
    test(
      'Fetch News Test Case',
      () async {
        // First Step Read API Key from Firestore
        SecurityKeysModel? securityKeysModel =
            await FireStoreService.readDocument<SecurityKeysModel>(
          model: const SecurityKeysModel(),
          collection: Collections.SecurityKeys,
          docId: Collections.SecurityKeys.name,
        );

        expect(securityKeysModel, isNotNull);
        expect(securityKeysModel!.newsApiKey, isNotNull);

        String baseUrl =
            "${AppConstants.newsBaseUrl}${Endpoint.search.name}?q=example&lang=en&max=10&apikey=${securityKeysModel.newsApiKey}";

        List<NewsModel> newsList = [];
        String? errorMessage;

        (List<NewsModel>, String?) result =
            await ApiService.fetchAllData<NewsModel>(
          url: baseUrl,
          model: const NewsModel(),
          key: ResponseKeys.articles.name,
        );

        newsList = result.$1;
        errorMessage = result.$2;

        expect(errorMessage, isNull);
        expect(newsList, isNotEmpty);
      },
    );
  });
}
