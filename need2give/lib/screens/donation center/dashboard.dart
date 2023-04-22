import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/donation%20center/add_item.dart';
import 'package:need2give/screens/donation%20center/remove_item.dart';
import 'package:need2give/widgets/button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardDonation extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardDonation({Key? key}) : super(key: key);

  @override
  State<DashboardDonation> createState() => _DashboardDonation();
}

class _DashboardDonation extends State<DashboardDonation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Global.backgroundColor,
            appBar: AppBar(
              title: const Text("Your Dashboard"),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total products",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "150",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'total number of items '),
                        series: <LineSeries<ProductsData, String>>[
                          LineSeries<ProductsData, String>(
                              dataSource: <ProductsData>[
                                ProductsData('Jan', 35),
                                ProductsData('Feb', 28),
                                ProductsData('Mar', 34),
                                ProductsData('Apr', 32),
                                ProductsData('May', 40)
                              ],
                              xValueMapper: (ProductsData sales, _) =>
                                  sales.year,
                              yValueMapper: (ProductsData sales, _) =>
                                  sales.sales,
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: Global.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button(
                        text: "Add item",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddItem(),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TransparentButton(
                        text: "Update item",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddItem(),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: RedButton(
                        text: "Remove item",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RemoveItem(),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TransparentButton(
                        text: "View all items", onPressed: () {}),
                  ),
                ],
              ),
            )));
  }
}

class ProductsData {
  ProductsData(this.year, this.sales);
  final String year;
  final double sales;
}
