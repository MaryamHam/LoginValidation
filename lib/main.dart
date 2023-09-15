import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _key= GlobalKey<FormState>();
   bool isChecked = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
      
         body: Center(
           child: Container(
          margin: EdgeInsets.all(40),

           child: Form(
             key: _key,

             child: Column(
           
             children: [
              
                Text("FACIO",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(height: 30,),
              //Image(image: AssetImage("assets/login.jpg"),width: 170, height: 100,),
           
             TextFormField(
              validator: (value){
              if(value!.isEmpty || value ==null){
        
                return "Email can not be empty";
              }
              else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)){
                return "Email not match email formate ";
              }
        
              },

              decoration: InputDecoration(
              hintText: "Email Address",
              prefixIcon: Icon(Icons.email, color: Colors.grey,),            
              hintStyle: TextStyle(
              color: Colors.greenAccent,
              ),
                   
              labelText: "Email",
              labelStyle: TextStyle( color: Color.fromARGB(255, 32, 57, 121)),
                   
                  
               
                    focusedBorder:UnderlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                    ), 
               
                   ), ),
           
           
           TextFormField(
            validator: (value){
              if(value!.isEmpty || value ==null){
        
                return "Password can not be empty";
              }
              //Minimum eight characters, at least one uppercase letter, one lowercase letter and one number
              else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value)){
                return "Password does not match password formate ";
              }
        
              },


              obscureText: true,
              decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: Colors.grey,),            
              hintStyle: TextStyle(
              color: Colors.greenAccent,
              ),
                   
              labelText: "Password",
              labelStyle: TextStyle( color: Color.fromARGB(255, 32, 57, 121)),
                   
                 
               
                     focusedBorder:UnderlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                    ), 
             
                   ), ),
                   SizedBox( height: 20,),
                   Row(
                   children: [

                     SizedBox(
                     width: MediaQuery.sizeOf(context).width*.06,
                       child:  Container(
    
                        child: CheckboxListTile(
                          checkboxShape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          value: isChecked,
                          activeColor: Colors.greenAccent,
                          checkColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                            isChecked = value ?? false;
                            });
                          },
                        ),
                      ),

                       
                     ),
                     SizedBox(width: MediaQuery.sizeOf(context).width*.03,),
           
             // Icon(Icons.check_circle ,color: Colors.greenAccent,),
              Text("Remember me"),
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Text("Forget password?", style: TextStyle(color: Colors.greenAccent,),)),
           
                   ],
                   ),
           
           
                   Container(
                     margin: EdgeInsets.only(top: 20),
                     width: 300,
                     child: ElevatedButton(onPressed: (){
                       _key.currentState!.validate();
                      }, child: Text("Login",
              
                 style: TextStyle(color: Colors.white),),
                 style: ButtonStyle(
                 backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                 )),
                   ),
                 
                 SizedBox( height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                    Text("Dont have an account?"),
                    Text("Signup here", style: TextStyle(color: Colors.greenAccent,),)
                   ],
                   ),

           
           
           
             ],
           
             ),
           ),
            
           ),
         ),
      
      
      
      
      
        ),
      ),
    );
  }
}