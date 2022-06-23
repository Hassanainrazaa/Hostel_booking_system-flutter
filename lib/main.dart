//import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_vscode/auth/signin.dart';
import 'package:flutter_application_vscode/provider/Reviewcart_provider.dart';
import 'package:flutter_application_vscode/provider/product_provider.dart';
import 'package:flutter_application_vscode/provider/userprovider.dart';
import 'package:flutter_application_vscode/screens/home/home_screen.dart';
import 'package:flutter_application_vscode/screens/home/productoverview/productoverview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_vscode/provider/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String id = "main";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<productProvider>(
            // title: 'Flutter Demo',
            create: (context) => productProvider(),
          ),
          ChangeNotifierProvider<UserProvider>(
            // title: 'Flutter Demo',
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider<ReviewcartProvider>(
            // title: 'Flutter Demo',
            create: (context) => ReviewcartProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(),
          home: SignIn(),
          initialRoute: MyApp.id,
          routes: {
            //WelcomePage.id: (context) => WelcomePage(),
            //LoginPage.id: (context) => LoginPage(),
            //RegistrationPage.id: (context) => RegistrationPage(),
            HomePage.id: (context) => HomePage(),
            productOverview.id: (context) => productOverview(
                  productImage: "",
                  productName: "",
                  ProductPrice: 2,
                ),
            //ResetPassword.id: (context) => ResetPassword(),
            //ProfileScreen.id: (context) => ProfileScreen()
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(widget.title),
          ),
      body: Center(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
