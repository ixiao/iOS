//
//  ViewController.m
//  8-XML-解析
//
//  Created by 闫潇 on 15/1/9.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Division.h"
#import "GDataXMLNode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableV];
    // Do any additional setup after loading the view, typically from a nib.
    //绑定委托
    self.tableV.delegate=self;
    self.tableV.dataSource=self;
    [self XMLPass];
}
- (void)XMLPass
{    //读取文件到缓冲区
    NSURL * url = [NSURL URLWithString:@"http://www.meituan.com/api/v1/divisions"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    //建立NSURLConnetion发送同步请求
    [NSURLConnection connectionWithRequest:request delegate:self];

}
#pragma mark 同步网络请求
//连接成功  仅调用一次
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [NSMutableData new];
    self.list = [NSMutableArray new];
    
}
//多次调用  多次返回数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //data 参数就是每次 返回的数据
    [self.data appendData:data];
}
//响应完成时调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
        //根据data缓冲区创建GDataXMLdocument对象
        NSError * error = nil;
        GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithData:self.data options:0 error:&error];
        if (error)
        {
            NSLog(@"%@",error);
        }
        else
        {
            //获取根字节
            GDataXMLElement * rootElement = [document rootElement];
            //获取根字节下的子节点数据
            NSArray * elementArrry = [rootElement elementsForName:@"divisions"];
            GDataXMLElement * divisions = elementArrry[0];
    
            NSArray * divisionsArr = [divisions elementsForName:@"division"];
    
            //遍历字节数组
            for (GDataXMLElement * divisionElement in divisionsArr)
            {
                //创建Division对象和location对象储存解析后的XML信息
                Division * division = [Division new];
                Location * location = [Location new];
    
                //division节点的id的子节点
                GDataXMLElement * idElement = [divisionElement elementsForName:@"id"][0];
                NSString * idEle = [idElement stringValue];
                division.id = idEle;
               NSLog(@"%@",idEle);
    
                //division节点的name子节点
                GDataXMLElement * nameElement = [divisionElement elementsForName:@"name"][0];
                NSString * name = [nameElement stringValue];
                division.name = name;
                NSLog(@"%@",name);
    
                //division节点的location子节点
                GDataXMLElement * locationElement = [divisionElement elementsForName:@"location"][0];
    
                //location节点的timezone子节点
                GDataXMLElement * timezoneElement = [locationElement elementsForName:@"timezone"][0];
                NSString * timezone = [timezoneElement stringValue];
                location.timezone = timezone;
    //            NSLog(@"%@",timezone);
    
                //location节点的timezone_offset_gmt节点
                GDataXMLElement * timezone_offset_gmtElement = [locationElement elementsForName:@"timezone_offset_gmt"][0];
                NSString * timezone_offset_gmt = [timezone_offset_gmtElement stringValue];
                location.timezone_offset_gmt =timezone_offset_gmt;
    //            NSLog(@"%@",timezone_offset_gmt);
    
                //location节点的latitude节点
                GDataXMLElement * latitudeElement = [locationElement elementsForName:@"latitude"][0];
                NSString * latitude = [latitudeElement stringValue];
                location.latitude = latitude;
    //            NSLog(@"%@",latitude);
    
                //location节点的longitude节点
                GDataXMLElement * longitudeElement = [locationElement elementsForName:@"longitude"][0];
                NSString * longitude = [longitudeElement stringValue];
                location.longitude = longitude;
    //            NSLog(@"%@",longitude);
                
                division.location=location;
                //将解析完的对象 放入数据源数组
                [self.list addObject:division];
                
            }
            [self.tableV reloadData];
    
    }
    
}
#pragma mark tableView dataSoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * cellID = @"cell";

     UITableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    Division *division = self.list[indexPath.row];
    cell.textLabel.text = division.id;
    cell.detailTextLabel.text = division.name;
    return cell;
}
@end
