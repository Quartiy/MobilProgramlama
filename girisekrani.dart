import 'package:flutter/material.dart';
import 'package:muhammet_vizeodev/main.dart';

class girisekrani extends StatefulWidget {
  @override
  _girisekraniState createState() => _girisekraniState();
}

class _girisekraniState extends State<girisekrani> {
  String kullaniciadi;
  String sifre;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yapma Ekranı'),
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
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                } ,
                onSaved: (value){
                  sifre = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed:(){
                        Navigator.pushNamed(context, '/uyeol');
                      }
                      ),
                  MaterialButton(
                      child: Text("Şifremi Unuttum"),
                      onPressed:(){
                        Navigator.pushNamed(context, '/sifremiunuttum');
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
      RaisedButton(child: Text("Giriş Yap"), onPressed: (){
        if (_formKey.currentState.validate()){
          _formKey.currentState.save();
          if (kullaniciadi== "demo" && sifre== "demo"){
          debugPrint("kullanici adi: $kullaniciadi , sifre: $sifre");

        }else{
            debugPrint("Hatalı Giriş, kullanici adi: $kullaniciadi , sifre: $sifre");
          }
        }
      },
      );
}


