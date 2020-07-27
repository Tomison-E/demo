import 'package:custom_switch/custom_switch.dart';
import 'package:demo/utils/sizeConfig.dart';
import 'package:demo/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }

}
class _Register extends State<Register>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.keyboard_backspace,color: Color.fromRGBO(224, 17, 95, 1.0),),onPressed: (){}),actions: <Widget>[
        SizedBox(width: 10),
        Icon(Icons.more_vert,color: Color.fromRGBO(224, 17, 95, 1.0))
      ],backgroundColor: Colors.white,elevation: 2.0),
      body: SingleChildScrollView(
        child: Padding(
    child:Column(
         children: [
           SizedBox(height: 30),
          RegisterForm(_scaffoldKey)
          ]
        ),padding: EdgeInsets.all(15),
        )
      ),
      backgroundColor: Colors.white,
    );
  }

}

class RegisterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const RegisterForm(this._scaffoldKey,{Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _formWasEdited = false;
  Validators validate;
  TextEditingController txt;
  bool p1 =true; bool p2 =true;
  String firstName,lastName,email,phoneNumber,password;


  @override
  void initState() {
    validate = Validators(_formWasEdited);
    txt=  TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txt.dispose();
    super.dispose();
  }

  void showInSnackBar(String value) {
    widget._scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }



  Future<void> _handleSubmitted() async{
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      try {
        _showDialog(context);
        bool test = false;
        if(test){
          Navigator.pop(context);
          _autoValidate = false;
          _reset(form);
         // Navigator.pushNamed(context, UIData.authRoute);
        }
        else {
          Navigator.pop(context);
          showInSnackBar('Registeration Unsuccessful');
        }
      }
      catch(exception){
        print(exception);
        showInSnackBar(exception);
      }

    }
  }

  void _reset(FormState form){
    form.reset();
    txt.text="";
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      autovalidate: _autoValidate,
      onWillPop: _warnUserAboutInvalidData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
                decoration:  InputDecoration(
                    labelText: 'Name of Staff',
                    focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 15,fontWeight: FontWeight.w200),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
                ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),

              ),
          SizedBox(height: 20.0),
          TextFormField(
              decoration:  InputDecoration(
                  labelText: 'Email',
                  focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 15,fontWeight: FontWeight.w200),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
              ),keyboardType: TextInputType.emailAddress,onSaved: (String mail)=>email=mail, validator: (String mail)=>validate.validateEmail(mail)

          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:  InputDecoration(
                labelText: 'Address',
                focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 15,fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
            ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),

          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:  InputDecoration(
                labelText: 'Phone number',
                focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 15,fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
            ),keyboardType: TextInputType.phone,onSaved: (String number)=>phoneNumber=number, validator: (String number)=>validate.validatePhoneNumber(number),

          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration:  InputDecoration(
                labelText: 'Password',
                focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 15,fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
            ),obscureText: p1,onSaved: (String passCode)=>password=passCode, validator: (String passCode)=>validate.validatePassword(passCode),controller: txt,
          ),
          SizedBox(height: 20.0),
          Text("Staff Image",style: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 17),),
          SizedBox(height: 30),
          Container(child:FlatButton(onPressed: (){},child: Text("Select File",style: TextStyle(color: Color.fromRGBO(102, 25, 234, 1.0),fontSize: 20)),),width: 143,height: 39,decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(224, 17, 95, 1.0),width: 2.0),borderRadius: BorderRadius.circular(10)),),
          SizedBox(height: 30),
          TextFormField(
            decoration:  InputDecoration(
                labelText: 'Select Staff Location',
                focusColor: Color.fromRGBO(224, 17, 95, 1.0),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0)),labelStyle: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 17,fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(204, 204, 204, 1.0),width: 1.0))
            ),obscureText: p1,onSaved: (String passCode)=>password=passCode, validator: (String passCode)=>validate.validatePassword(passCode),controller: txt,
          ),
          SizedBox(height: 35.0),
          Text("Select Staff Access Rights",style: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 17)),
          SizedBox(height: 30),
          Text("Access to Sales Register",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("Online Pos", true),
          switchWidget("All Sale Reports", false),
          Text("Access to Customers",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("View Customers", true),
          switchWidget("Add/Edit Customer", false),
          SizedBox(height: 15),
          Text("Access to Suppliers",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("View Suppliers", true),
          switchWidget("Add/Edit Suppliers", false),
          SizedBox(height: 15),
          Text("Access to Product and Services",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("Access to Product List", true),
          switchWidget("Add Products", false),
          switchWidget("View Cost Price", false),
          switchWidget("Edit Product/Service", false),
          switchWidget("Restock Product", false),
          switchWidget("Delete Product/Service", false),
          SizedBox(height: 15),
          Text("Access to Staff",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("Add/Edit Staff", false),
          switchWidget("View Staff", true),
          SizedBox(height: 15),
          Text("Access to Reporting",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("Sales Report", false),
          switchWidget("Inventory Report", true),
          switchWidget("Expense Report", true),
          SizedBox(height: 15),
          RichText(text: TextSpan(text:"Access to Profile ",style: TextStyle(color: Colors.black,fontSize: 20),children: [
              TextSpan(text:"(Allow staff to edit his/he details)",style: TextStyle(color: Colors.black,fontSize: 10))
          ])),
          SizedBox(height: 15),
          switchWidget("Update Profile Settings", true),
          SizedBox(height: 15),
          Text("Access to Expense",style: TextStyle(color: Colors.black,fontSize: 20)),
          SizedBox(height: 15),
          switchWidget("Add/Edit Expenses", false),
          switchWidget("View Expenses", true),
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              SizedBox(child:RaisedButton(onPressed: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=>Dashboard())),child: Text("Save",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),color:Color.fromRGBO(224, 17, 95, 1.0),highlightColor: Colors.white,hoverColor: Colors.black,textColor: Colors.white,padding: EdgeInsets.only(left: 10.0,right: 10.0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),width: 143,height: 39,)
            ],mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: 15.0),
        ],mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Text("Creating Account"),
          content: Column(
              children:[
                SizedBox(height: 20.0),
                CupertinoActivityIndicator()
              ]),
        );
      },
    );
  }

  Widget switchWidget(String label,bool val){
    return Container(
      height: 75,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey[100],blurRadius: 25,offset: Offset(0,15))
      ]),
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            SizedBox(width: 10),
            Text(label,style: TextStyle(color: Color.fromRGBO(190, 194, 206, 1.0),fontSize: 17)),
            Spacer(),
            CustomSwitch(
              activeColor: Color.fromRGBO(224, 17, 96, 1.0),
              value: val,
              onChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),SizedBox(width: 10)],mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }

}