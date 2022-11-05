import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
final GlobalKey _formKey = GlobalKey<FormState>();
  //通过controller获取input数据
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

   String? userName; //用户名
   String? password; //密码


  Widget LoginFormWidget(){
    return Form(
      key: _formKey,//设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,//自动校验
      child: Column(
        children: [
          TextFormField(
           // controller: _unameController,
            autofocus: true,//自动获取焦点
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: (){},
              ),
              labelText: "用户名",
              hintText: "填写用户名或者邮箱",
              icon: const Icon(Icons.person),

            ),
            //校验用户名
            validator: (v){
              return v!.trim().isNotEmpty ? null :'用户名不能为空';
            },
            //当 Form 表单调用保存方法 Save时回调的函数。
            onSaved: (value){
              userName = value;
            },
            // 当用户确定已经完成编辑时触发
            onFieldSubmitted: (value){

            },
          ),
          TextFormField(
           // controller: _pwdController,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: (){},
              ),
              labelText: "密码",
              hintText: "填写密码",
              icon: const Icon(Icons.lock),

            ),
            //校验用户名
            validator: (v){
              return v!.trim().length >5  ? null :'密码不能少于6位';
            },
            //当 Form 表单调用保存方法 Save时回调的函数。
            onSaved: (value){
              password = value;
            },
            // 当用户确定已经完成编辑时触发
            onFieldSubmitted: (value){},
          ),

           Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:(){
                    // 通过_formKey.currentState 获取FormState后，
                    // 调用validate()方法校验用户名密码是否合法，校验
                    // 通过后再提交数据。
                    // if((_formKey.currentState as FormState).validate()){
                    //   print(_unameController.text);
                    //   print(_pwdController.text);
                    //
                    // }
                  } ,
                  child: const Text('登录')
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed:(){
                    // 通过_formKey.currentState 获取FormState后，
                    var loginForm = _formKey.currentState as FormState;
                    //调用validate()方法校验用户名密码是否合法，校验
                    if(loginForm.validate()){
                        loginForm.save();
                        print('userName:${userName!},password:${password!}');
                    }
                    // 通过后再提交数据。
                    
                  } ,
                  child: const Text('调用save方法')
                ),
                const SizedBox(width: 20,),

                ElevatedButton(
                    onPressed:(){
                      // 通过_formKey.currentState 获取FormState后，
                      var loginForm = _formKey.currentState as FormState;
                      loginForm.reset();
                    } ,
                    child: const Text('重置')
                ),

              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('表单实例'),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: LoginFormWidget(),
      ),
    );
  }
}
