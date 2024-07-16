import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stylish/common/common_button.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/common/common_textField.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/utilis/util.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final Service _service = Service();
  final _key = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final FocusNode _focusNodeTitle = FocusNode();
  final FocusNode _focusNodeDescription = FocusNode();
  final FocusNode _focusNodePrice = FocusNode();
  final FocusNode _focusNodeQuantity = FocusNode();
  void dispose() {
    _description.dispose();
    _title.dispose();
    _price.dispose();
    _quantity.dispose();
    _focusNodeDescription.dispose();
    _focusNodeTitle.dispose();
    _focusNodeQuantity.dispose();
    _focusNodePrice.dispose();
    super.dispose();
  }

  void addProducts() {
    _service.addProduct(
        context: context,
        title: _title.text,
        description: _description.text,
        category: category,
        price: double.parse(_price.text),
        quantity: double.parse(_quantity.text),
        images: images);
  }

  String? validatorTitle(String? value) {
    if (value!.isEmpty) {
      return 'enter title';
    }
    return null;
  }

  String? validatorDescription(String? value) {
    if (value!.isEmpty) {
      return 'enter description';
    }
    return null;
  }

  String? validatorPrice(String? value) {
    if (value!.isEmpty) {
      return 'enter price';
    }
    return null;
  }

  String? validatorQuantity(String? value) {
    if (value!.isEmpty) {
      return 'enter quantity';
    }
    return null;
  }

  void pickfile() async {
    var file = await pickFile();
    setState(() {
      images = file;
    });
  }

  String category = 'Mens';
  List<String> adminCategory = ['Mens', 'Womens', 'Kids', 'Fashion', 'Beauty'];
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          leading: const Text(''),
          title: const CommonText(
              text: 'Add Product',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              size: 20),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(children: [
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map((e) {
                        return Builder(
                          builder: (context) => Image.file(
                            e,
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                        );
                      }).toList(),
                      options:
                          CarouselOptions(height: 200, viewportFraction: 1))
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: width * 0.9,
                      height: height * 0.25,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickfile();
                            },
                            child: const Icon(
                              Icons.folder,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                          const CommonText(
                              text: 'Add image',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              size: 20)
                        ],
                      ),
                    ),
              CommonTextField(
                controller: _title,
                inputType: TextInputType.name,
                hintext: 'title',
                validator: validatorTitle,
                focusNode: _focusNodeTitle,
              ),
              CommonTextField(
                controller: _description,
                inputType: TextInputType.name,
                hintext: 'description',
                validator: validatorDescription,
                focusNode: _focusNodeDescription,
              ),
              CommonTextField(
                controller: _price,
                inputType: TextInputType.number,
                hintext: 'price',
                validator: validatorPrice,
                focusNode: _focusNodePrice,
              ),
              CommonTextField(
                controller: _quantity,
                inputType: TextInputType.number,
                hintext: 'quantity',
                validator: validatorQuantity,
                focusNode: _focusNodeQuantity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width * 0.9,
                  child: DropdownButton(
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      value: category,
                      items: adminCategory.map((e) {
                        return DropdownMenuItem(
                            value: e,
                            child: CommonText(
                              text: e,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              size: 15,
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonButton(
                    width: width * 0.9,
                    text: 'Submit',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 15,
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        addProducts();
                      }
                      FocusScope.of(context).unfocus();
                    },
                    background: Colors.red),
              )
            ]),
          ),
        ));
  }
}
