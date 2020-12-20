import 'package:flutter/material.dart';

class sifremiunuttum extends StatefulWidget {
  @override
  _sifremiunuttumState createState() => _sifremiunuttumState();
}

class _sifremiunuttumState extends State<sifremiunuttum> {
  String email;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Sıfırlama Ekranı'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder()
                  ),
                  validator:(value){
                    if (value.isEmpty){
                      return "Emailinizi Giriniz:";
                    } else {
                      return null;
                    }
                  } ,
                  onSaved: (value){
                    email = value;
                  },
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                        child: Text("Vazgeç"),
                        onPressed:(){
                          Navigator.pushNamed(context, '/');
                        }
                    ),
                  ],
                ),
                _girisbuton()
              ],
            )
        ),
      ),
    );
  }
  Widget _girisbuton() =>
      RaisedButton(child: Text("Gönder"), onPressed: (){
        if (_formKey.currentState.validate()){
          _formKey.currentState.save();
          if (email==email){
            debugPrint("Email adresinize şifreniz gönderildi: $email");
            Navigator.pushNamed(context, '/');
          }else{
            debugPrint("Bir değer girmediniz $email");
          }
        }
      },
      );
}


