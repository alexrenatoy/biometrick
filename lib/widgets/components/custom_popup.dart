
import 'package:flutter/material.dart';

class CustomFormPopup extends StatelessWidget {
  final String titleText;
  final Widget formContent;

  const CustomFormPopup({
    super.key,
    required this.titleText,
    required this.formContent,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  formContent,
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Enviar'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text(titleText),
    );
  }
}

// Ejemplo de uso: CustomFotmPopup(
//             titleText: 'Titulo de ejemplo',
//             formContent: Contenido...()
//             )

