import 'package:cityu_student_protal/core/secretes/supabase_secrete.dart';
import 'package:cityu_student_protal/features/auth/presentation/pages/login_page.dart';
import 'package:cityu_student_protal/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: SupabaseSecrete.supabaseUrl,
    anonKey: SupabaseSecrete.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        //colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginPage(),
    );
  }
}
