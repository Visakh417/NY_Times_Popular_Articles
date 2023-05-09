import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget{
  final String message;
  const ErrorMessageWidget(this.message, {super.key} );

  @override
  Widget build(BuildContext context) {
   return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(Icons.error, size: 32,color: Colors.red,),
      const SizedBox(height: 8,),
      Text(message, style: Theme.of(context).textTheme.bodyText1,)
    ],
   );
  }

}