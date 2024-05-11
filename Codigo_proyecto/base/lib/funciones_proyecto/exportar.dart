import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:flutter/material.dart';

// Lista de correos electrónicos remitentes
List<String> recipientEmails = [
  'marlons.espinosaj@gmail.com',
  'sapeov2004@gmail.com',
  'mateovarcla@gmail.com',
  // Añade más correos según necesites
];

// Función para enviar correos electrónicos
void sendEmail(BuildContext context) async {
  // Crear una instancia de Mailer con tu clave API de SendGrid

  // Dirección de correo electrónico desde donde se enviarán los correos
  final fromAddress = Address('mateovargas25123@gmail.com');

  // Bucle para enviar un correo a cada dirección en la lista de remitentes
  for (var recipientEmail in recipientEmails) {
    final toAddress = Address(recipientEmail);
    final content = Content('text/plain', 'Este es el contenido del correo.');
    final subject = 'Asunto del correo';
    final personalization = Personalization([toAddress]);

    final email = Email([personalization], fromAddress, subject, content: [content]);
    
    mailer.send(email).then((result) {
      // Manejo de la respuesta de SendGrid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo enviado a $recipientEmail: ${result.isValue}'))
      );
    }).catchError((error) {
      // Manejo de errores
      print('Error enviando correo a $recipientEmail: $error');
    });
  }
}