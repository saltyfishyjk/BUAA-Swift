<h1>
    <div align = "center">《Swift程序设计》</div>
</h1>


<h1>
    <div align = "center">大作业实验报告</div>
</h1>
<h2>
    <div align = "center">SCSESU——北航计算机学院学生会APP</div>
</h2>












































<h6>
    <div align = "center">2022年11月</div>
</h6>
<div STYLE="page-break-after: always;"></div>



## 一、实验任务

完成一个使用Swift语言编写的iOS APP。

### 内容

在6系，学业是大家生活的基调，但俗话说的好：“All work and no play make jack a dull boy”。合理的学业之外的课余生活对调节大家的生活节奏、释放学业压力乃至更好地投入到学习和工作当中至关重要。计算机学院学生会正是秉持“全心全意为同学服务”的理念而来，为同学们提供丰富多彩的课余生活。在“SCSESU”（School of Computer Science and Engineering Student Unioon，计算机学院学生会）app中，你可以查看计算机学院的近期新闻并点赞、收藏和评论，向计算机学院学生会的各个部门提出你的意见和建议，使用院会提供的便民服务如向组织部查询入党进展、向活动实践部提交活动方案、向志愿权益部发起权益维护请求等。

## 二、已完成任务

### 登入软件

1. 支持欢迎页面✔
2. 支持用户登录系统✔
3. 支持用户注册系统✔

### Home页面

4. 支持首页卡片式新闻缩略展示与二级页面（点击跳转至新闻详情页）✔
5. 支持首页新闻分类（党政建设、师生互动、学院活动）与二级页面（点击跳转至该类别新闻列表）✔
6. 支持分类新闻页面卡片式展示（每个新闻卡片点击跳转至新闻详情页）✔
7. 支持精选内容卡片式展示✔
8. 支持新闻详情页（标题、点赞、收藏、评论、正文等）✔

### Message页面

9. 支持向学生会提出意见与二级页面（点击跳转至提意见详情页）✔

10. 支持提意见详情页（标题、正文）✔
11. 支持向活动部发起活动与二级页面（点击跳转至发起活动详情页）✔
12. 支持发起活动详情页（标题、活动目标、所需经费、正文、申请进展）✔
13. 支持向组织部查询入党进展与二级页面（点击跳转至查询入党进展详情页）✔
14. 支持查询入党进展详情页（输入学号、姓名，获得入党进展图示：入党积极分子、重点发展对象、中共预备党员、中共党员）✔
15. 支持向志愿权益部发起权益维护申请与二级页面（点击跳转至权益维护详情页）✔
16. 支持权益维护详情页（标题、诉求部门、正文）✔
17. 支持列表显示按照时间顺序发起的事件（包括向学生会提出意见、向活动实践部发起活动、向志愿权益部申请权益维护）✔

### Me页面

18. 支持显示用户名✔
19. 支持显示已点赞内容卡片与二级页面（点击跳转至已点赞内容详情页）✔
20. 支持已点赞内容详情页（卡片式展示新闻缩略图，点击跳转至新闻详情页）✔
21. 支持显示已收藏内容卡片与二级页面（点击跳转至已收藏内容详情页）✔
22. 支持已收藏内容详情页（卡片式展示新闻缩略图，点击跳转至新闻详情页）✔

## 三、整体设计方案

### 3.1 软件框架

用户点击打开本App，通过滑动浏览欢迎页

<table>
<tr>
	<td><img src="设计文档/IMG_5501(2).PNG" width="200"></td>
	<td><img src="设计文档/IMG_5502.PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5503(1).PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5504(1).PNG"  width="200"></td>
<tr>
</table>

而后进入登陆与注册页面。对于登录，输入用户名和密码后。用户名栏下方有提示字样”建议至少4个字符“，当该栏输入字符不足4个时，会显示橘色字样；当该栏输入字符大于等于4时，该字样会变灰并被删除线标识。对于密码栏同理，有两个提示字样分别提示至少输入8字符和1大写字符，满足条件字样会变灰并被删除线标识（iPhone截屏时密码不会被截入，因此密码栏看起来是空白的）。用户名和密码都输入后点击登录，若用户名或密码错误会向下图最后一个展示的那样弹出报错提示，否则会正常进入系统。

<table>
<tr>
	<td><img src="设计文档/IMG_5505(1).PNG" width="200"></td>
	<td><img src="设计文档/IMG_5508(1).PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5506(1).PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5509(1).PNG"  width="200"></td>
    <td><img src="设计文档/IMG_5511(1).PNG"  width="200"></td>
    <td><img src="设计文档/IMG_5512(1).PNG"  width="200"></td>
<tr>
</table>

对于注册，输入用户名和密码后点击注册即可注册并自动登录，如果用户名已被注册会弹出如下方所示提示。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5513(1).PNG" width="200"></center></td>
<tr>
</table>

进入软件后，下方导航栏有”Home“”Message“和”Me“三个按钮，以下分别介绍。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5514.PNG" width="200"></center></td>
<tr>
</table>

### 3.2 Home（首页）

上方是”近期新闻“卡片式栏目，向右滑动可以查看更多新闻

<table>
<tr>
	<td><img src="设计文档/IMG_5514.PNG" width="200"></td>
    <td><img src="设计文档/IMG_5515(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5516.PNG" width="200"></td>
    <td><img src="设计文档/IMG_5517(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5518(1).PNG" width="200"></td>
<tr>
</table>

每张卡片可以点开并跳转至新闻详情页面；

<table>
<tr>
	<td><img src="设计文档/IMG_5519(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5520(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5521(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5522(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5523.PNG" width="200"></td>
<tr>
</table>

往下是类别按钮，有”学院活动“”师生互动“和”党政建设“三个类别

<table>
<tr>
	<td><center><img src="设计文档/IMG_5514.PNG" width="200"></center></td>
<tr>
</table>

每个类别点击跳转至二级页面，为卡片式展示该类别下的新闻列表：

<table>
<tr>
	<td><img src="设计文档/IMG_5525.PNG" width="200"></td>
    <td><img src="设计文档/IMG_5526(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5527(1).PNG" width="200"></td>
<tr>
</table>

再往下是精选内容卡片列表，为编辑向用户推荐的新闻，每张卡片可以点开进入新闻详情页。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5528.PNG" width="200"></center></td>
<tr>
</table>

#### 新闻详情页

<table>
<tr>
	<td><center><img src="设计文档/IMG_5530.PNG" width="200"></center></td>
<tr>
</table>

通过点击新闻卡片跳转进入新闻详情页，新闻详情页最上方是头图，下方是卡片式内容，从上至下依次包括标题、发布日期、是否点赞（红心）、是否收藏（黄色五角星）、评论、详情描述。

用户可以通过点击点赞（红心）按钮为这篇新闻点赞，也可以再点击一次取消点赞。

<table>
<tr>
	<td><img src="设计文档/IMG_5530.PNG" width="400"></td>
    <td><img src="设计文档/IMG_5532(1).PNG" width="400"></td>
<tr>
</table>

用户可以通过点击收藏（黄色五角星）按钮收藏这篇新闻，也可以再点击一次取消收藏。

<table>
<tr>
	<td><img src="设计文档/IMG_5532(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5533(1).PNG" width="400"></td>
<tr>
</table>

用户可以点击”评论“按钮添加评论，评论支持文字、emoji和图片，其中图片会被以一定大小的缩略图展示。输入文字和上传图片后后点击提交会弹出提示，若确定立即发布则该评论被发布，否则点继续编辑会回到编辑界面。

<table>
<tr>
	<td><img src="设计文档/IMG_5534(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5535(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5536(2).PNG" width="400"></td>
<tr>
</table>

新闻下方的评论可以左右滑动来查看，点击进去还可以查看详情：

<table>
<tr>
	<td><img src="设计文档/IMG_5530.PNG" width="400"></td>
    <td><img src="设计文档/IMG_5531(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5554.PNG" width="400"></td>
    <td><img src="设计文档/IMG_5555(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5556(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5557(1).PNG" width="400"></td>
<tr>
</table>



#### 类别页面

Home页有三个类别按钮，点击后跳转进入对应的类别页面，每个类别页面包含若干该类别的新闻卡片，点击新闻卡片会跳转进入对应的新闻详情页。如下分别是学院活动、师生互动和党政建设三个类别的新闻卡片列表

<table>
<tr>
	<td><img src="设计文档/IMG_5525.PNG" width="200"></td>
    <td><img src="设计文档/IMG_5526(1).PNG" width="200"></td>
    <td><img src="设计文档/IMG_5527(1).PNG" width="200"></td>
<tr>
</table>

### 3.3 Message（消息与服务）

最上方是四个按钮，分别是”表达意见“”申请活动“”入党程“以及”权益维护“。

页面下方是本账号已发起的服务列表，点击进入可以查看详情。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5539(2).PNG" width="200"></center></td>
<tr>
</table>

#### 3.3.1 表达意见

点击“表达意见”按钮后，进入意见表单填写界面，通过填写标题和提案并点击提交，可以将该条意见发送给院会主席团和各部部长，同时，该条意见会显示在Message页面下方的服务列表中。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5540(2).PNG" width="200"></center></td>
<tr>
</table>

#### 3.3.2 申请活动

点击”申请活动“按钮后，进入活动申请表单填写界面，通过填写标题、目标、预算（缺省为0）、内容后点击提交，将该申请发送给活动实践部，由活动实践部进行审批和处理。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5541(2).PNG" width="200"></center></td>
<tr>
</table>

#### 3.3.3 入党进程

点击”入党进程“按钮后，输入学号和姓名并点击提交可以向组织部查询入党进程，有积极分子、重点发展对象、预备党员、正式党员四种状态，若学号或姓名错误则会弹出提示信息。点击返回可以直接返回Message页面。

<table>
<tr>
	<td><img src="设计文档/IMG_5542(2).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5553(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5552(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5550(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5543(2).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5551.PNG" width="400"></td>
<tr>
</table>

#### 3.3.4 权益维护

点击”权益维护“按钮后，填写标题、权益所属部门、权益申请内容后向志愿权益部发起权益维护申请，志愿权益部将牵头组织维护同学正当权益。

<table>
<tr>
	<td><center><img src="设计文档/IMG_5544(2).PNG" width="200"></center></td>
<tr>
</table>

### 3.4 Me（我）

上方为点赞新闻卡片式列表，下方为收藏新闻卡片式列表，该卡片可点击，点击后跳转至新闻详情页。

<table>
<tr>
	<td><img src="设计文档/IMG_5547(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5548(1).PNG" width="400"></td>
    <td><img src="设计文档/IMG_5549(1).PNG" width="400"></td>
<tr>
</table>

## 四、软件实现介绍

### 4.1 Sandbox沙箱实现数据持久化

在本次项目开发过程中，使用了Sandbox沙箱技术实现了数据的持久化。具体地，这一技术的应用解决了应用在本地存储数据以保证在关闭app后下一次打开还可以访问这些数据。

在本项目中，用户注册账号并登录进入后，在软件内进行了点赞、收藏、发表评论、使用院会提供的各项服务等都会产生本地数据，而Sandbox沙箱保证了这些数据不会随着软件关闭而丢失。在下一次打开软件的时候，随着正确账号的登录，这些信息也会随之被加载。

具体地，在`Parser.swift`中实现了存取逻辑，以下展示几个典型案例：

#### LOAD（加载数据）

- 加载文件

  ```swift
  // ...
  func getDocumentsDirectory() -> URL {
      let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      return paths[0]
  }
  // ...
  ```

- 加载图片

  ```swift
  // ...
  func getImageFromCache(str:String) -> Image {
       let fileName = getDocumentsDirectory().appendingPathComponent("\(str).jpg")
       let imgData = try! Data(contentsOf: fileName)
       return Image(uiImage: UIImage(data: imgData)!)
  }
  // ...
  ```

#### STORE（存储）

- 存储图片

  ```swift
  // ...
  func loadImageInToCache(str:String, uploadImg:UIImage){
      let fileName = getDocumentsDirectory().appendingPathComponent("\(str).jpg")
      if let data = uploadImg.jpegData(compressionQuality: 0.8) {
          try? data.write(to: fileName)
      }
  }
  // ...
  ```

### 4.2 使用SwiftUI构建整个项目

尽管课程中主要学习了使用playground来构建iOS app，但是对于本项目来说，较大的工程量更适合使用swift ui来搭建。

在本项目中，大量使用了VStack，HStack，Text，Image，Alert，ScrollView和各种修饰器，并充分运用了Swift语言提供的遍历特性，搭建了结构清晰，内容完整的大型iOS app项目。

以内容最复杂的Home View为例：

```swift
//
//  HomeView.swift
//  BUAASCSE
//

import SwiftUI

// Home视图

struct HomeView: View {
    //@EnvironmentObject var userData:UserData
    @State var hero = false
    @State var data = articleData
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    SearchBar()
                    
                    //TrendingWeek
                    VStack{
                        HStack {
                            Text("近期新闻")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 20)
                            
                            Spacer()
                            Text("浏览更多 >>")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(#colorLiteral(red: 0.3403331637, green: 0.10593573, blue: 0.9580881, alpha: 1)))
                                .padding(.trailing, 20)
                        }
                        // 首页新闻滚播
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(articleData) { card in
                                    NavigationLink(
                                        destination: ArtivleView(article :card),
                                        label: {
                                            TrendingWeek(trendingMeal: card)
                                                .background(Color.white)
                                                .cornerRadius(15)
                                                .shadow(radius: 1)
                                        })
                                        .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.bottom, 10)
                                .padding(.leading, 30)
                                
                            }
                        }
                    }.padding(.top, -50)
                    .opacity(self.hero ? 0 : 1)
                    
                    
                    //Categories
                    VStack{
                        HStack {
                            Text("分类")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        // Categories View
                            HStack {
                                ForEach(1 ..< 4) { i in
                                    NavigationLink(
                                        destination: ArticleListView(data: data.filter{ $0.type == articleTypes[Int(i)-1] }),
                                        label: {
                                            VStack {
                                                Image("categ-\(String(i))")
                                                Text(articleTypes[Int(i)-1])
                                                    .font(.subheadline)
                                                    .bold()
                                            }
                                            .frame(minWidth:0, maxWidth:.infinity, minHeight: 100)
                                            .background(Color.white)
                                            .cornerRadius(15)
                                        })
                                }
                                .padding(.horizontal)
                            }
                        
                    }
                    .shadow(radius: 1)
                    .opacity(self.hero ? 0 : 1)
                    
                    //Our picks
                    VStack{
                        HStack {
                            Text("精选内容")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 20)
                            
                            Spacer()
                            Text("下滑浏览更多")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(#colorLiteral(red: 0.3403331637, green: 0.10593573, blue: 0.9580881, alpha: 1)))
                                .padding(.trailing, 20)
                        }
                        .opacity(self.hero ? 0 : 1)
                        
                        
                        // Card View
                        VStack(spacing: 100) {
                            ForEach(0..<self.data.count){i in
                                GeometryReader{g in
                                    OurPicks(card: self.$data[i], hero: self.$hero)
                                        
                                        .offset(y: self.data[i].isStared ? -g.frame(in: .global).minY : 0)
                                        .opacity(self.hero ? (self.data[i].isStared ? 1 : 0) : 1)
                                        .onTapGesture {
                                            
                                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                                if !self.data[i].isStared{
                                                    self.hero.toggle()
                                                    self.data[i].isStared.toggle()
                                                } }}}
                                .frame(height: self.data[i].isStared ? UIScreen.main.bounds.height : 250)
                            }
                        }  }.padding(.top, 50)
                    .padding(.bottom, 150)
                    
                    Spacer()
                    
                    
                }
                .background(Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1)))
                
            }
            .background(Color(#colorLiteral(red: 0.3403331637, green: 0.10593573, blue: 0.9580881, alpha: 1)))
            .edgesIgnoringSafeArea(.top)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct SearchBar: View {
    @State var search = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)*0.25, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Text("欢迎来到计算机学院学生会")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, -40)
                    Spacer()
                }
                // 搜索栏
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.title)
                    TextField("Search...", text: $search)
                        
                        .font(.title3)
                }
                .frame(width:  ( UIScreen.main.bounds.width)*0.85, height: 40, alignment: .leading)
                .padding(.leading, 20)
                .background(Color.white)
                .cornerRadius(10)
                
            }
        }
    }
}

```

通过大量SwiftUI的特性的使用丰富了前端UI的展示和交互。

### 4.3 面向对象的设计

在本项目中，面向对象设计的思想贯穿始终，struct，class，构造器以及类方法等各种面向对象的特性被广泛使用，这保证了本项目的健壮性和鲁棒性，遵循了SOLID设计原则，并广泛采用了单例模式在内的软件设计模式。

具体地，下例中展示了文章详情页和其他页面的交互逻辑：

```swift
// 文章详情页
struct ArtivleView: View {
    @EnvironmentObject var userData:UserData
    @State private var quantity = 0
    @State var article : Article
    @State var heart = "heart.fill"
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(article.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(article.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(article.date)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                    }
                    
                    
                    Text("正文")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(article.context)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            Spacer()
        }
    }
    
}
```

```swift
// 首页新闻滚播
ScrollView(.horizontal, showsIndicators: false) {
HStack {
ForEach(articleData) { card in
	NavigationLink(
        /* 此处将页面跳转至ArticleView*/
		destination: ArtivleView(article :card),
			label: {
			TrendingWeek(trendingMeal: card)
			.background(Color.white)
			.cornerRadius(15)
			.shadow(radius: 1)
			})
		.buttonStyle(PlainButtonStyle())
		}
		.padding(.bottom, 10)
		.padding(.leading, 30)              
	}
}
```



### 4.4 高版本iOS的特性

在本项目中，充分发挥了iOS的界面特点，大量使用了系统系统的包括SF Symbol、官方修饰器等在内的各种UI部件，使整个软件非常符合iOS的设计特点，与平台完美贴合。

例如，在项目中使用了如下代码，实现了渐进色彩的圆角矩形按钮，十分好看：

```swift
label:{
	Text("登录")
	.font(.system(.body, design: .rounded))
	.foregroundColor(.white)
	.bold()
	.padding()
	.frame(minWidth: 0, maxWidth: .infinity)
	.background(LinearGradient(gradient: Gradient(colors: [Color(red:251/255, green:128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
	.cornerRadius(10)
	.padding(.horizontal)
}
```

效果：

<table>
<tr>
	<td><center><img src="设计文档/image-20221120221859924.png" width="200"></center></td>
<tr>
</table>
又如可以显示输入栏提示的效果：

```swift
// ...
Text("登录")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            // 用户名
            FormField(fieldName: "用户名", fieldValue: $userRistrantionViewModel.name)
            RequirementText(iconColor: userRistrantionViewModel.isNameLengthVaild ? Color.secondary : Color(red:251/255, green: 128/255, blue:128/255), text: "至少4个字符", isStrikeThrough: userRistrantionViewModel.isNameLengthVaild)
                .padding()
            FormField(fieldName: "密码", fieldValue: $userRistrantionViewModel.password, isSecure: true)
            // 密码
            VStack {
                RequirementText(iconName: "lock.open", iconColor: userRistrantionViewModel.isPasswordLengthVaild ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text:"至少8个字符", isStrikeThrough: userRistrantionViewModel.isPasswordLengthVaild)
                RequirementText(iconName: "lock.open", iconColor: userRistrantionViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "至少1个大写字母", isStrikeThrough: userRistrantionViewModel.isPasswordCapitalLetter)
            }
            .padding()
            NavigationLink(
                destination:
                    NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label:{
                    Text("登录")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red:251/255, green:128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .padding(.horizontal)
            })
// ...
```

效果（“建议至少4个字符”等字样会随着输入信息的变化而变化）：

<table>
<tr>
	<td><img src="设计文档/IMG_5505(1).PNG" width="200"></td>
	<td><img src="设计文档/IMG_5508(1).PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5506(1).PNG"  width="200"></td>
	<td><img src="设计文档/IMG_5509(1).PNG"  width="200"></td>
    <td><img src="设计文档/IMG_5511(1).PNG"  width="200"></td>
<tr>
</table>



### 4.5 与系统API交互——以访问图片为例

在本项目开发中，使用了唤起系统相册照片选择的api，具体实现如下：

```swift
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    let sourceType: UIImagePickerController.SourceType
    let onImagePicked: (UIImage) -> Void
 
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
        @Binding private var presentationMode: PresentationMode
        private let sourceType: UIImagePickerController.SourceType
        private let onImagePicked: (UIImage) -> Void
 
        init(presentationMode: Binding<PresentationMode>,
             sourceType: UIImagePickerController.SourceType,
             onImagePicked: @escaping (UIImage) -> Void) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self.onImagePicked = onImagePicked
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            onImagePicked(uiImage)
            presentationMode.dismiss()
        }
 
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
 
    }
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode,
                           sourceType: sourceType,
                           onImagePicked: onImagePicked)
    }
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
```






## 五、创新之处

### 5.1 立意新

本App立足计算机学院师生的真实需求和关切，首次提出并实现了整合计算机学院的资讯新闻以及常用功能解决方案，实现了类似“北航小程序”的功能且用户体验更佳，是真正从用户体验角度出发的App。

### 5.2 框架新

采用了苹果公司近年来新发布的SwiftUI来完成整个app，使用全新的框架搭建了强鲁棒性的软件。

### 5.3 实现新

很多代码实现并没有中文资料甚至没有英文博客资料，本app的实现过程中参考了大量官方英文文档和各大技术论坛网站，在代码实现上和过去iOS开发中常见的OC和StoryBoard实现有显著不同。

### 5.4 git版本管理

本次项目使用了git进行版本管理，并使用GitHub私有仓库进行代码托管，实现了良好的版本控制与保护，在一些时刻使用该技术方便地进行了版本回退等操作。

![image-20221119225927081](设计文档/image-20221119225927081.png)

## 六、课程学习总结

### 6.1 理论课与日常作业

本门课程课后作业的难度逐次提升，每次实验作业基本覆盖了所有上课涉及的知识点，帮助我快速巩固课上所学知识。本门课程的iOS实践作业质量也很高，帮我快速入门了使用swift语言开发iOS app，这也为我后来的大作业奠定了良好的基础。

### 6.2 大作业

### 6.2.1 Swift和Swift UI的学习

在本次大作业的设计与实现过程中，我充分复习了课上所学的Swift知识，并真正将他们运用到实践当中，很有收获和成就感。

### 6.2.2 大项目开发

本项目较大，共3000余行代码，这是进入计算机学院以来最大的个人工程项目之一。在本次大作业中，我充分使用git、面向对象、设计模式等现代流行技术和设计方案进行开发，保证了项目的扩展性、鲁棒性、可插拔性，奠定了良好的代码基础和风格。

### 6.2.3 前后端分离

在本项目过程中，使用了包括json、Sandbox沙箱等技术来完成数据后端，使用SwiftUI等提供的前端部件接口构建页面和逻辑。这样大致使得前后端分离，在调试和测试的过程中有极大的便利。

## 七、参考资料

1. [MacOS 10.13.6 下装xcode 流程](https://www.cnblogs.com/lovesKey/p/10778416.html)
2. [Swift第三方中文翻译](https://www.cnswift.org/)
3. [Swift UI demo翻译](https://swiftui.jokerhub.cn/)
4. [Swift官方文档](https://www.swift.org/documentation/)
5. [Swift UI官方文档](https://developer.apple.com/documentation/swiftui)
6. [iOS-Swift数据持久化](https://developer.aliyun.com/article/312147)