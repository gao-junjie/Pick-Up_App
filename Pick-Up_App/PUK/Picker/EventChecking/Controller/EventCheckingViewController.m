//
//  EventCheckingViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "EventCheckingViewController.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface EventCheckingViewController ()

@end

@implementation EventCheckingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (@available(iOS 15.0, *)) {
//        self.view.backgroundColor = [UIColor tintColor];
//    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    //}
    
    [self setMapView];
}

- (void)setMapView {
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, SIZE_HEIGHT * 0.9)];
    _mapView.backgroundColor = [UIColor whiteColor];
    self.mapView.delegate = self;
    //设置定位精度
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    //设置定位距离
    _mapView.distanceFilter = 1.0f;
    //普通样式
    _mapView.mapType = MAMapTypeStandard;
    //地图跟着位置移动
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    //设置成NO表示关闭指南针；YES表示显示指南针
    _mapView.showsCompass= YES;
    //设置指南针位置
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22);
    //设置成NO表示不显示比例尺；YES表示显示比例尺
    _mapView.showsScale= YES;
    //设置比例尺位置
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);
    //开启定位
    _mapView.showsUserLocation = YES;
    //缩放等级
    [_mapView setZoomLevel:18 animated:YES];
    [self.view addSubview:self.mapView];
    
    //初始化定位
    [self initLocation];
}

//初始化定位
- (void)initLocation {
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 10;
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
}

////添加大头针
//- (void)addAnnotation {
//    _pointAnnotation.coordinate = _mapView.userLocation.coordinate;
//    _pointAnnotation.coordinate = CLLocationCoordinate2DMake(_tipTemp.location.latitude, _tipTemp.location.longitude);
//    _pointAnnotation.title = _tipTemp.name;
//    _pointAnnotation.subtitle = _tipTemp.address;
//    [_mapView addAnnotation:_pointAnnotation];
//    [_mapView selectAnnotation:_pointAnnotation animated:YES];
//}

//实现路径搜索的回调函数
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response {
    if (response.route == nil) {
        return;
    }
 
    //通过AMapNavigationSearchResponse对象处理搜索结果
    NSString *route = [NSString stringWithFormat:@"Navi: %@", response.route];
    NSLog(@"%@", route);
    AMapPath *path = response.route.paths[0]; //选择一条路径
    AMapStep *step = path.steps[0]; //这个路径上的导航路段数组
    NSLog(@"%@",step.polyline);   //此路段坐标点字符串
    NSLog(@"%@",response.route.paths[0]);
    
    if (response.count > 0) {
        //移除地图原本的遮盖
        [_mapView removeOverlays:_pathPolylines];
        _pathPolylines = nil;
 
        // 只显示第⼀条 规划的路径
        _pathPolylines = [self polylinesForPath:response.route.paths[0]];
        NSLog(@"%@",response.route.paths[0]);
        //添加新的遮盖，然后会触发代理方法进行绘制
        [_mapView addOverlays:_pathPolylines];
    }
}

//绘制遮盖时执行的代理方法
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay {
    /* 自定义定位精度对应的MACircleView. */
 
    //画路线
    if ([overlay isKindOfClass:[MAPolyline class]]) {
       //初始化一个路线类型的view
        MAPolylineRenderer *polygonView = [[MAPolylineRenderer alloc] initWithPolyline:overlay];
        //设置线宽颜色等
        polygonView.lineWidth = 8.f;
        polygonView.strokeColor = [UIColor colorWithRed:0.015 green:0.658 blue:0.986 alpha:1.000];
        polygonView.fillColor = [UIColor colorWithRed:0.940 green:0.771 blue:0.143 alpha:0.800];
        polygonView.lineJoinType = kMALineJoinRound;//连接类型
        //返回view，就进行了添加
        return polygonView;
    }
    return nil;
}
@end
