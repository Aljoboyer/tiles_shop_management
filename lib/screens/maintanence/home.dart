import 'package:flutter/material.dart';
import 'package:tiles_shop_management/widgets/filter_dialog.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';
import 'package:tiles_shop_management/widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late String email;
  final ScrollController _scrollController = ScrollController();


  final List<Map<String, dynamic>> allCartItems = [
    {"title": "T-Shirt", "size": "L", "pieces": 5},
    {"title": "Shoes", "size": "42", "pieces": 2},
    {"title": "Jacket", "size": "M", "pieces": 3},
    {"title": "Jeans", "size": "32", "pieces": 1},
    {"title": "Cap", "size": "Free", "pieces": 4},
    {"title": "Full shart", "size": "XL", "pieces": 4},
    {"title": "T-Shirt", "size": "L", "pieces": 5},
    {"title": "Shoes", "size": "42", "pieces": 2},
    {"title": "Jacket", "size": "M", "pieces": 3},
    {"title": "Jeans", "size": "32", "pieces": 1},
    {"title": "Cap", "size": "Free", "pieces": 4},
    {"title": "Full shart", "size": "XL", "pieces": 4},
    {"title": "T-Shirt", "size": "L", "pieces": 5},
    {"title": "Shoes", "size": "42", "pieces": 2},
    {"title": "Jacket", "size": "M", "pieces": 3},
    {"title": "Jeans", "size": "32", "pieces": 1},
    {"title": "Cap", "size": "Free", "pieces": 4},
    {"title": "Full shart", "size": "XL", "pieces": 4},
    {"title": "T-Shirt", "size": "L", "pieces": 5},
    {"title": "Shoes", "size": "42", "pieces": 2},
    {"title": "Jacket", "size": "M", "pieces": 3},
    {"title": "Jeans", "size": "32", "pieces": 1},
    {"title": "Cap", "size": "Free", "pieces": 4},
    {"title": "Full shart", "size": "XL", "pieces": 4},
  ];

  List<Map<String, dynamic>> displayedItems = [];
  int itemsToShow = 10; // Number of items to show initially

   onEmailChange (value) {
    setState(() {
      email: value;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initially show 10 items
    displayedItems = allCartItems.take(itemsToShow).toList();
    _scrollController.addListener(_onScroll);  // Attach listener to detect scroll events
  }

  // This function will be called when scrolling
  void _onScroll() {
    // Check if the user has reached the bottom
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreItems();  // Load more items when user reaches the end
    }
  }

  // Load more items and update the UI
  void _loadMoreItems() {
    if (displayedItems.length < allCartItems.length) {
      setState(() {
        int nextLength = displayedItems.length + 10;  // Load 10 more items
        if (nextLength > allCartItems.length) {
          nextLength = allCartItems.length;  // Prevent exceeding the total items
        }
        displayedItems = allCartItems.take(nextLength).toList();  // Add more items to the list
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  void filterBySize () async {
    await showFilterModal(context, ['S', 'XL', 'M'], (val) {});
  }
  void filterByCategory () async {
    await showFilterModal(context, ['ABM', 'MB', 'XYZ'], (val) {});
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.sailing, color: const Color.fromARGB(255, 255, 4, 201), size: 35,)
        ],
        title: Align(
              alignment: Alignment.center,
              child: Text('AZ Tiles Shop', style: TextStyle(
              fontWeight: FontWeight.w700,
               color: Colors.white
              ),),
            ),
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor:  Color(0xFF044B91),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
             SizedBox(
                  width: screenWidth * 0.9,
                  child: CustomInputs(label: 'Search By Name',fieldType: false, onChanged: (value) {
                          onEmailChange(value);
                        },),
                ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Filter By', style: TextStyle(
                    color:Color(0xFF044B91),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
                ),
              ),
              SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: filterBySize, 
                    child: Text('Sizes')),
                ),
                SizedBox(width: 50,),
                 SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: filterByCategory, 
                    child: Text('Category')),
                )
              ],
            ),
            SizedBox(
                height: 20,
              ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Showing Result For', style: TextStyle(
                    color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),),
                ),
              ),
                SizedBox(
                height: 20,
              ),
           Expanded(child:  ListView.builder(
                      controller: _scrollController,
                      itemCount: displayedItems.length,
                      itemBuilder: (context, index) {
                        final item = displayedItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ProductCard(
                            title: item["title"],
                            size: item["size"],
                            pieces: item["pieces"],
                          ),
                        );
                      },
                    ))
          ],
        ),
      ),
    );
  }
}