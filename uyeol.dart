import 'package:flutter/material.dart';

class uyeol extends StatefulWidget {
  @override
  _uyeolState createState() => _uyeolState();
}

class _uyeolState extends State<uyeol> {
  String email;
  String kullaniciadi;
  String sifre;
  String tekrarsifre;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üye Olma Ekranı'),
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
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      labelText: "Kullanıcı Adı",
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder()
                  ),
                  validator:(value){
                    if (value.isEmpty){
                      return "Kullanıcı Adınızı Giriniz:";
                    } else {
                      return null;
                    }
                  } ,
                  onSaved: (value){
                    kullaniciadi = value;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      labelText: "Şifre",
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder()
                  ),
                  validator:(value){
                    if (value.isEmpty){
                      return "Şifrenizi Giriniz:";
                    } else {
                      return null;
                    }
                  } ,
                  onSaved: (value){
                    sifre = value;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      labelText: "Şifre Tekrar",
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder()
                  ),
                  validator:(value){
                    if (value.isEmpty){
                      return "Şifrenizi Tekrar Giriniz:";
                    } else {
                      return null;
                    }
                  } ,
                  onSaved: (value){
                    tekrarsifre = value;
                  },
                ),
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
      RaisedButton(child: Text("Kaydol"), onPressed: (){
        if (_formKey.currentState.validate()){
          _formKey.currentState.save();
          if (sifre== tekrarsifre){
            debugPrint("Email: $email, kullanici adi: $kullaniciadi , sifre: $sifre");
            Navigator.pushNamed(context, '/');
          }else{
            debugPrint("Şifreleriniz uyuşmuyor. $sifre, $tekrarsifre");
          }
        }
      },
      );
}


