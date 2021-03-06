import 'package:flutter/material.dart';
import 'package:real_state_finder/services/real-state-service.dart';
import 'package:real_state_finder/utils/constants.dart';
import 'package:real_state_finder/widgets/number-text-field.dart';
import 'package:real_state_finder/widgets/select.dart';

class SearchFilterScreen extends StatefulWidget {

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final minController = TextEditingController();
  final maxController = TextEditingController();
  final realStateService = RealStateService();

  @override
  void initState() {
    minController.text = minPrice.toString();
    maxController.text = maxPrice.toString();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        titleSpacing: 0,
        title: Text(
          'Filter Search', 
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if(double.parse(minController.text) >= 0) {
                minPrice = double.parse(minController.text)?.toInt() ?? 0;
              }
              if(double.parse(maxController.text) >= 0) {
                maxPrice = double.parse(maxController.text)?.toInt() ?? 0;
              }
              realStateService.searchFilterQuery();
              reStartApp(context);
            }, 
            child: Text('Save', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search Type', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                  SelectButton(
                    options: [{'name':'For Sale', 'value': '4sale'}, {'name':'For Rent', 'value': '4rent'}], 
                    dropdownValue: forSale ? '4sale' : '4rent', 
                    onSelect: (value) {
                      if(value == '4sale') forSale = true;
                      else forSale = false;

                      realStateService.searchFilterQuery();
                      reStartApp(context);
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Min Price (\$)', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                  NumberTextField(controller: minController),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Max Price', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                  NumberTextField(controller: maxController),
                ],
              ),
            ),
            Visibility(
              visible: forSale,
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Houses', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isAllHomes, 
                          onChanged: (value) => setState(() => isAllHomes = value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Apartment', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isApartment, 
                          onChanged: (value) => setState(() => isApartment = value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Condominium', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isCondo, 
                          onChanged: (value) => setState(() => isCondo = value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Town House', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isTownhouse, 
                          onChanged: (value) => setState(() => isTownhouse = value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Manufactured', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isManufactured, 
                          onChanged: (value) => setState(() => isManufactured = value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lot/Land', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Switch.adaptive(
                          value: isLotLand, 
                          onChanged: (value) => setState(() => isLotLand = value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}