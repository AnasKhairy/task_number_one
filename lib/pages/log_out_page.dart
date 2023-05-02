import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_number_one/route/app_router.dart';

import 'login_page.dart';


@RoutePage()
class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("L O G O U T"),
        centerTitle: true,
      ),
      body: Center(
      child: MaterialButton(
        color: Colors.black54 ,
        onPressed: (){
          context.router.replaceAll([const LoginRoute()]) ;
        },
        child: const Text(
          "LogOut",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    )
    );
  }
  
}
