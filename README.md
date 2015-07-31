# GW2_WebSite
![建立者](https://img.shields.io/badge/建立者-Coody-orange.svg)
![License](https://img.shields.io/dub/l/vibe-d.svg)

>此專案是用來幫助 iOS 開發者能夠更方便寫出 GW2 的 iOS App 的 WebApi ，讓開發者可以專心設計更好的 iOS native App 介面、以及好的使用者體驗，而不用自己寫很多傳送、接收的類別來增加開發難度以及時程。

# 基本：
> 以 Gem 換成金的例子來看，只要三個步驟就可以跟官方發出請求、並且接收其回傳值：

```
#import "GW2_WebApi_Gems.h"
#import "GW2_Request_Gems.h"
...
// 建立 request ，記得在 interface 加上 < GW2_Request_Gems_Protocol > ，並且實作其接收回傳值的方法
GW2_Request_Gems *gemsRequest = [[GW2_Request_Gems alloc] initWithDelegate:self];
[gemsRequest setGems:100];  // 以 100 Gem 換算為單位（可自行輸入）
[gemsRequest sendRequest];
```

>然後再實作 GW2_Request_Gems_Protocol 的方法來處理接收值：

```
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    // TODO: tempGemsResule shows 100 Gem = ?? Gold. Just do what you wanna show.
}
-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg 
                        withErrorCode:(NSInteger)tempErrorCode{
    // TODO: Got error, you can check error message and show alert or whatever you want.
}
```

# 進階：
> WebApi , 以及其 Request 客製化類別的建立。

### GW2 WebApi 類別的建立方法：

>請繼承 WebApi，並且實作 WebApi_Policy

1. 請實作底下的方法來加入 GW2 Api 的尾端網址，例： https://api.guildwars2.com/v2/commerce/exchange/gems?quantity=100 的詢問``(請不要把 ? 後面的詢問項目寫在 uri 內！)``，只要加上：

```
+(NSString *)uri{
    return @"commerce/exchange/gems";
}
```


2. 回傳結果使用 JSONModel 來處理，因此請將接收參數定義為同名、或是使用 JSONModel 的 KeyMapping 來對應回傳參數命名。
``詳細請看：https://github.com/icanzilb/JSONModel``

3. 如果此 WebApi 有傳送參數，請建立類別方法來加入參數，如：
```
+(NSDictionary *)getGems:(NSInteger)tempGems;
```

4. 請一定要建立 GW2 的 WebApi 回傳時，要怎麼將資料剖析到 className_Result 中（這裡請直接用 JSONModel 的開放方法來處理就好），並回傳，如：
```
+(GW2_WebApi_Gems_Result *)parserResponse:(id)responseData;
```

### GW2 Request 類別的建立方法：

>繼承 WebSiteRequest ，並且建立他的 Protocol ，讓使用這個 Request 問了 GW2 的 WebApi 後，回傳的值可以傳送到 Protocol （不管成功、失敗都傳），讓使用此類別的 ViewController （或是其他類別），可以處理收到的資料。

1. 如果有傳送參數，請開出方法來設定，例子如下：
```
-(void)setGems:(NSInteger)tempGems{
    // 呼叫 WebApi 將值處理完回傳
    self.params = [GW2_WebApi_Gems getGems:tempGems]; 
}
```

2. 請一定要建立 initWithDelegate: 的初始化方法，其收到 GW2 Api 回傳值時，才能回傳給使用此 request 的類別。

3. Request 內一定要實作 -(void)sendRequest; ，並且使用 WebSiteHelper 其類別方法將 webApi 的 uri 、以及傳送參數傳送出去。

4. 請使用 block 來處理接收到的結果，請參考 GW2_Request_Gems，方法定義如下：
```
-(void(^)(NSURLSessionDataTask *task, id responseObject , NSError *error))responseBlock{
    return ... ; // 請直接參考 GW2_Request_Gems
} 
```

### 測試案例建立方法：

- 測試專案主要用來作單元測試，因此如果只是單純用內部已經寫好的 WebApi 以及 Request 可以不用將 WebSiteForGW2Test 這個資料夾加入自己專案中；但如果要自己撰寫 WebApi 以及 Request ，建議可以用這個測試專案來做測試。

- BaseViewController 已經寫好介面，所以不用自行撰寫 TextField 、以及 UIButton ，詳細請看註解。

- 請繼承 BasicViewController ，並且直接 create Label , 以及 create TextField，測試案例請看 Test_ViewController_Gems 或是 Text_ViewController_Demo 。

請去 AppDelegate 將初始 ViewController 替換掉。

### 第三方 Framework
- AFNetworking : https://github.com/Coody/AFNetworking
- JSONModel : https://github.com/icanzilb/JSONModel


如果有任何問題，請來信：coody0829@gmail.com

### License

GW2_WebSite is available under the MIT license.
