import 'package:NotiPush/controllers/auth_controller.dart';
import 'package:NotiPush/models/usuario.dart';
import 'package:NotiPush/views/auth/login.dart';
import 'package:NotiPush/views/notificaciones/notificaciones.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loged = await AuthController.isLoged();
  Usuario usuario = (loged) ? await AuthController.getLogedUsuario() : null;
  initializeDateFormatting();
  Intl.defaultLocale="es_MX";
  runApp(MyApp(loged: loged, usuario: usuario));
}

class MyApp extends StatelessWidget {
  final bool loged;
  final Usuario usuario;

  MyApp({
    @required this.loged,
    @required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PushNotiUPIIZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (loged) ? Notificaciones(usuario: usuario) : LoginPage(),
    );
  }
}
