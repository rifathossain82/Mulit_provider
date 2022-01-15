import 'package:flutter/material.dart';
import 'package:multi_provider_demo/providers/counter.dart';
import 'package:provider/provider.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${context.watch<Counter>().count}',style: TextStyle(fontSize: 42),),
            SizedBox(height: 20,),
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/productPage');
                },
                label: Text('Product Page '),
              icon: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          context.read<Counter>().increment();
        },
      ),
    );
  }
}
