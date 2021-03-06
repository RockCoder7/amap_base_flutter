import 'package:amap_base/amap_base.dart';
import 'package:amap_base_example/utils/misc.dart';
import 'package:amap_base_example/widgets/button.widget.dart';
import 'package:amap_base_example/widgets/dimens.dart';
import 'package:flutter/material.dart';

class DrivingRoutPlanScreen extends StatefulWidget {
  DrivingRoutPlanScreen();

  factory DrivingRoutPlanScreen.forDesignTime() => DrivingRoutPlanScreen();

  @override
  _DrivingRoutPlanScreenState createState() => _DrivingRoutPlanScreenState();
}

class _DrivingRoutPlanScreenState extends State<DrivingRoutPlanScreen> {
  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('驾车出行路线规划'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: AMapView(
              onAMapViewCreated: (controller) {
                setState(() => _controller = controller);
              },
              amapOptions: AMapOptions(),
            ),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              children: <Widget>[
                Text('起点: 39.993291, 116.473188'),
                Text('终点: 39.940474, 116.355426'),
                SPACE_NORMAL,
                Button(
                  label: '开始规划',
                  onPressed: (_) {
                    loading(
                      context,
                      _controller.calculateDriveRoute(
                        RoutePlanParam(
                          from: LatLng(39.993291, 116.473188),
                          to: LatLng(39.940474, 116.355426),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
