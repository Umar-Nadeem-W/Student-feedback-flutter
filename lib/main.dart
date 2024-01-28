import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'feedback.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}

void _login (String emai,String passwrd,BuildContext context) async
{
    await FirebaseAuth.instance.signOut();
  try {
    UserCredential userCredential = await
    FirebaseAuth.instance.signInWithEmailAndPassword(

        email: emai,

        password: passwrd

    );

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackbar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackbar(context, 'Wrong password provided for that user.');
    }
    else {
      showSnackbar(context, 'Error: ${e.code}');
    }
  }catch (e) {
    showSnackbar(context, e.toString());
  }
 if (FirebaseAuth.instance.currentUser != null) {
     showSnackbar(context, 'User is signed in!');
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedbackPage()));
   }
}
void _signup(String emai,String passwrd,BuildContext context) async
{
  try {

    UserCredential userCredential = await
    FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: emai,

        password: passwrd );

  } on FirebaseAuthException catch (e) {

    if (e.code == 'weak-password') {

      showSnackbar(context, 'The password provided is too weak.');

    } else if (e.code == 'email-already-in-use') {

      showSnackbar(context, 'The account already exists for that email.');

    }
    else if (e.code == 'invalid-email') {

      showSnackbar(context, 'The email address is not valid.');

    }
    else {
      showSnackbar(context, 'Error: ${e.code}');
    }
  } catch (e) {
    showSnackbar(context, e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Feedback From with Firebase 212052'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 250,child: TextField
              (
              controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter Email',
            ),
            ),
            ),
            const SizedBox(height: 20),
            SizedBox(width: 250,child: TextField
              (
              controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
                ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed:(){_login(emailController.text.toString(),passwordController.text.toString(),context);},child: const Text('Login')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed:(){_signup(emailController.text.toString(),passwordController.text.toString(),context);}, child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
