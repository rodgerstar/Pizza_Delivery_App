import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if(state is SignInSuccess) {
            setState(() {
              signInRequired = false;
            });
          } else if(state is SignInLoading) {
            setState(() {
              signInRequired = true;
            });
          } else if(state is SignInFailure) {
            setState(() {
              signInRequired = false;
              _errorMsg = 'Invalid email or Password';
            });
          }
        },
    child: Form(
      key: _formKey,
      child: Column(

      ),
    ),
    );
  }
}
