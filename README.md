## 🗞️ News App 
### 🔎 Case İncelemesi (Case Preview)

https://github.com/akaanuzman/news_app_chatgpt/assets/55639112/ecd415e8-3a6e-434c-a4bf-012f1bb6f79b

https://github.com/akaanuzman/news_app_chatgpt/assets/55639112/acb4686f-c5fc-42d1-9854-eb85f4a79a4d


### 🇹🇷 Türkçe 
* #### 👨🏻‍💻 Case Hakkında
  * Öncellikle uzun zamandır Flutter tarafında sıfırdan bir mobil uygulama geliştirmiyordum. Bu case sayesinde kendimi geliştirdiğim, uçtan uca yapı kurarak yazdığım bir case çalışması oldu. Elimden geldiğince temiz yazmaya ve yorum satırları ekleyerek projeyi okunabilir hale getirmeye dikkat ettim. İncelediğiniz için teşekkürler!

* #### 📁 Klasör Yapısı, Yazılım Mimarisi ve Teknik Detaylar
  * Verilen çalışma mobil kısmı Flutter & Dart ile, back-end kısmının bir bölümü Firebase ile kalan kısmı ise hazır API'larla geliştirilmiş olup temiz kodlama felsefelerine ve SOLID prensiplerine dikkat edilmeye çalışılmıştır. Ayrıca Dart programlama dilinin ve nesne yönelimli programlamanın tüm efektif özelliklerinin kullanılmasına özen gösterilmiştir. Hazır yapılar kurulmuş olup bu yapılar projeden projeye aktaralıp kolayca bir şekilde kullanılabilecek bir seviyededir. Flutter framework'ünün vermiş olduğu özellikler, esneklikler kullanılmaya ve uygulanmaya çalışılmıştır.Design Pattern olarak MVMM kullanılmış olup tasarım kısmında ise Atomic Design metodolijisi uygulanmıştır. Route yapısı, network layer'ı, db layer'ı olmak üzere projedeki her bir işlev kendini tekrarlaması için generic metotlara ayırılmıştır. Model yapısında json serializable, state management tarafında provider kullanılmıştır. Authentication kısmında Google ve Apple Sign In kullanılmıştır. Apple Sign In için Apple Developer hesabında serviceId gibi parametreler girilmesi gerektiğinden sadece iOS cihazlarda gösterilmektedir ve çalışmaktadır. Projede herhangi bir hassas bilgi bulunmamasına özen gösterilmiş olup hassas bilgiler (apiKey,clientId) Firestore Db'de tutulmuştur. Paket bağımlılığını azaltmak için projenin tasarım kısmında minimum paket kullanılmaya özen gösterilmiştir. Github'ta ise branch yapısına aşina olunması açısından feature/base branch yapısı kullanılmıştır.
    
  * Klasör yapısı olarak proje iki farklı klasörden dallanmaktadır. Products klasörü altında enum type'lar, uygulama içi sabitler, extension'lar, servis işlemleri,tema yapısı,widgetlar ve router yapısı gibi yapılar bulunmaktadır. Features klasörünün altına MVVM design pattern gömülmüştür. Projenin yazılabilen tüm test senaryolarının unit test'leri test klasörünün altındaki 'unit_tests.dart' dosyasında bulunmaktadır.
  
### 📀 Kurulum
* [APK](https://github.com/akaanuzman/news_app_chatgpt/blob/main/app-release.apk)
```bash
git clone https://github.com/akaanuzman/news_app_chatgpt
```

#### 🎁 [Bağımlılıklar](https://github.com/akaanuzman/news_app_chatgpt/blob/main/pubspec.yaml)

#### ✅ [Test Senaryoları](https://github.com/akaanuzman/news_app_chatgpt/commit/bea9a1bd11213ac53e6b54d8c53b8342e06f43da)
  
<br>

### 🏴󠁧󠁢󠁥󠁮󠁧󠁿 English 
#### 👨🏻‍💻 About Case
  * First of all, I haven't developed a mobile application from scratch on Flutter for a long time. Thanks to this case, it was a case study that I improved myself and wrote by building an end-to-end structure. I paid attention to write as cleanly as I could and make the project readable by adding comment lines. Thanks for reviewing!

* #### 📁 Folder Structure, Software Architecture and Technical Details
  * The mobile part of the given work was developed with Flutter & Dart, part of the back-end part was developed with Firebase and the remaining part was developed with ready-made APIs, and clean coding philosophies and SOLID principles were tried to be paid attention to. In addition, all effective features of the Dart programming language and object-oriented programming have been used. Ready-made structures have been established and these structures are at a level that can be transferred from project to project and can be used easily. The features and flexibilities provided by the Flutter framework have been tried to be used and implemented. MVMM has been used as the Design Pattern and Atomic Design methodology has been applied in the design part. Route structure, network layer, db layer, each function in the project is divided into generic methods to repeat itself. In the model structure, json serialisable, provider is used on the state management side. Google and Apple Sign In are used in the authentication part. Since parameters such as serviceId must be entered in the Apple Developer account for Apple Sign In, it is only shown and works on iOS devices. Care has been taken not to have any sensitive information in the project and sensitive information (apiKey, clientId) is kept in Firestore Db. In order to reduce package dependency, care was taken to use minimum packages in the design part of the project. In Github, feature/base branch structure was used to familiarise with the branch structure.

 * As a folder structure, the project branches from two different folders. Under the Products folder, there are structures such as enum types, in-application constants, extensions, service operations, theme structure, widgets and router structure. MVVM design pattern is embedded under the Features folder. The unit tests of all test cases that can be written are in the 'unit_tests.dart' file under the test folder.

### 📀 Installation
* [APK](https://github.com/akaanuzman/news_app_chatgpt/blob/main/app-release.apk)
```bash
git clone https://github.com/akaanuzman/news_app_chatgpt
```

#### 🎁 [Dependencies](https://github.com/akaanuzman/news_app_chatgpt/blob/main/pubspec.yaml)

#### ✅ [Test Scenarios](https://github.com/akaanuzman/news_app_chatgpt/commit/bea9a1bd11213ac53e6b54d8c53b8342e06f43da)
  

