import 'package:flutter/material.dart';
import 'package:multi_provider_demo/providers/Item.dart';
import 'package:provider/src/provider.dart';

import '../providers/counter.dart';


class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {

    var p_length=context.watch<Item>().product_length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter product name',
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: FloatingActionButton(
                    onPressed: (){
                      if(controller.text.isNotEmpty){
                        context.read<Item>().add_item(controller.text);
                        controller.clear();
                      }
                      else{
                        print('Product name is empty!');
                      }
                    },
                    child: Icon(Icons.add),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: p_length==0? Text('No Item added.'):ListView.builder(
                itemCount: context.watch<Item>().product_length,
                  itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: (){},
                      onLongPress: (){
                        context.read<Item>().delete_item(index);
                      },
                      title: Text('${context.watch<Item>().product[index]}'),
                    ),
                  );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}