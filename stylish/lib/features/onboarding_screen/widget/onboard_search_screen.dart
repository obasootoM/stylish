import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/features/admin/service/service.dart';
import 'package:stylish/features/puchase_detailed_screen/screen/purchase_detailed_screen.dart';

class OboardingSearch extends StatefulWidget {
  static const routeName = '/onboardingSearch';
  const OboardingSearch({super.key, required this.search});
  final String search;
  @override
  State<OboardingSearch> createState() => _OboardingSearchState();
}

class _OboardingSearchState extends State<OboardingSearch> {
  final TextEditingController _controller = TextEditingController();
  List<Product>? _product;
  final Service _service = Service();
  void initState() {
    _controller.addListener(() {});
    super.initState();
    getProduct();
  }

  Future<void> liquidRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  void getProduct() async {
    _product = await _service.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(16),
      child: Autocomplete<Product>(
        optionsBuilder: (TextEditingValue value) {
          if (value.text.isEmpty) {
            return List.empty();
          }
          return _product!
              .where((element) => element.title
                  .toLowerCase()
                  .contains(value.text.toLowerCase()))
              .toList();
        },
        fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                Function onFieldSubmitted) =>
            TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(hintText: 'search...'),
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        optionsViewBuilder: (BuildContext context, Function onSelect,
            Iterable<Product> iterable) {
          return Material(
            color: Colors.transparent,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: iterable.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  Product product = iterable.elementAt(index);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PurchaseDetailedScreen.routeName,
                          arguments: product);
                    },
                    child: ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.images[0],
                          width: width * 0.3,
                          height: height * 0.4,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
        onSelected: (value) => print(value.title),
        displayStringForOption: (Product pr) => '${pr.title}',
      ),
    )));
  }
}
