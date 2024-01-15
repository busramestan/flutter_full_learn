// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '*';

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure; // burada kendini değiştirecek
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      obscureText: _isSecure, //şifreyi gizliyor.
      obscuringCharacter: _obscureText, //gizlerken hangi işaret kullanılacak onun belirlenmesi.

      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'Password',
        //prefixIcon: Text('a'),
        //prefix: Text('b'), //sol taraf
        suffix: _onVisibilityIcon(),
        //Sağ tarafta görünürlük yapmak için kullanılan widget
        // Bu yüzden burada hayat inceleyeceğim için statefull yapıya sayfayı çeviriyoruz.
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeLoading();
        },
        icon: AnimatedCrossFade(
            firstChild: const Icon(Icons.visibility_outlined),
            secondChild: const Icon(Icons.visibility_off_outlined),
            crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: _DurationItems.durationseconds));
    //Icon(_isSecure ? Icons.visibility_outlined : Icons.visibility_off_outlined));
  }
}

class _DurationItems {
  static const durationseconds = Duration(seconds: 2);
}
