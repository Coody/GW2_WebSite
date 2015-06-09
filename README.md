# GW2_WebSite
GW2 的 iOS WebApi 相關

# GW2 WebApi 類別的建立方法：

請繼承 WebApi，並且實作 WebApi_Policy

1. 請實作底下的方法來加入 GW2 Api 的尾端網址，例： https://api.guildwars2.com/v2/commerce/exchange/gems?quantity=100 則只要加上：
+(NSString *)uri{
return @"commerce/exchange/gems";
}

2. WebApi 請建立自己處理完要的 Result，命名原則通常為 className_Result 來接收資料。

3. Key 請建立出來讓使用此 WebApi 的人知道有哪些 Key。

4. 如果此 WebApi 有傳送參數，請建立類別方法來加入參數，如：
+(NSDictionary *)getGems:(NSInteger)tempGems;

5. 請一定要建立 GW2 的 WebApi 回傳時，要怎麼將資料剖析到 className_Result 中，並回傳，如：
+(GW2_WebApi_Gems_Result *)parserResponse:(id)responseData;

# GW2 Request 類別的建立方法：

請繼承 WebSiteRequest ，並且建立他的 Protocol ，讓使用這個 Request 問了 GW2 的 WebApi 後，回傳的值可以傳送到 Protocol （不管成功、失敗都傳），讓使用此類別的 ViewController （或是其他類別），可以處理收到的資料。

1. 如果有傳送參數，請開出方法來設定，例子如下：
-(void)setGems:(NSInteger)tempGems{
    // 呼叫 WebApi 將值處理完回傳
    self.params = [GW2_WebApi_Gems getGems:tempGems]; 
}

2. 請一定要建立 initWithDelegate: 的初始化方法，其收到 GW2 Api 回傳值時，才能回傳給使用此 request 的類別。

3. Request 內一定要實作 -(void)sendRequest; ，並且使用 WebSiteHelper 其類別方法將 webApi 的 uri 、以及傳送參數傳送出去。

4. 請使用 block 來處理接收到的結果，請參考 GW2_Request_Gems，方法定義如下：
-(void(^)(NSURLSessionDataTask *task, id responseObject , NSError *error))responseBlock{
    return ... ; // 請直接參考 GW2_Request_Gems
} 

# 測試案例建立方法：

請繼承 BasicViewController ，並且直接 create Label , 以及 create TextField，測試案例請看 Test_ViewController_Gems 或是 Text_ViewController_Demo 。

請去 AppDelegate 將初始 ViewController 替換掉。


如果有任何問題，請來信：coody0829@gmail.com


