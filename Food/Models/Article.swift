//
//  Card.swift
//  SCSESU
//
//  Created by YJK on 11/12/22.

// 首页新闻滚播图

import Foundation

struct Article : Identifiable {
    var id : Int // 文章序号
    var image : String // 图片名
    var title : String // 文章标题
    var date : String // 文章发表日期，格式为yyyy.mm.dd
    var stars : Int // 获得星星数
    var price = "$25.00" // TODO : 待删除
    var isStared : Bool = false // 当前用户是否点赞
    var isFavorite : Bool = false // 当前用户是否收藏
    var context : String // 正文
    var type : String // 文章类别，有Party(党政), Teacher(师生), Activity(学院活动)三种
    var commets : [Comment] = [] // 文章评论，初始时没有评论
    
}

var articleData = [
    Article(id: 0, image: "News1-2106", title: "七秩芳华，计见君子", date: "2022.9.29",stars: 5, isStared: false, context: "青春澎湃，活力飞扬\n计算机学院又迎来新一届学子\n时光如梭，聚焦今朝\n让美妙的歌声，唱响我们温馨的祝愿\n让轩昂的颂词，放飞我们美好的希望\n9月29日星期四\n计算机学院2021级新生齐聚一堂\n欣赏学院精心准备的迎新典礼\n“七秩芳华，计见君子”\n计算机学院党委书记李建欣老师、院长王蕴红老师、行政副院长卢静老师、党委副书记冯维成老师、2021级各小班班主任、专兼职辅导员、高年级优秀学生代表以及2021级全体本科生参加了本次典礼。", type: "Activity"),
    Article(id: 1, image: "News2-SportsMeeting", title: "我院师生运动会斩获佳绩", date: "2022.10.29",stars: 3, isStared: false, context: "橙黄橘绿、天朗气清。10月29日，北京航空航天大学第60届师生运动会在学院路校区和沙河校区同时举行。正值北航建校70周年华诞，计算机学院的运动健儿们用拼搏和汗水，庆祝北航70岁生日快乐。本届运动会赛程共计2天，由教职工运动会和学生运动会两部分组成。经过激烈角逐，计算机学院教职工代表队获得1金2银1铜，荣获了“教工团体冠军”的荣誉；计算机学院研究生代表队获得5金1银3铜，并荣获“研究生团体第四名”；同时，我院师生获得趣味比赛优胜奖，入场式方阵获得一等奖！", type:"Teacher"),
    Article(id: 2, image: "News3-2006", title: "2006大班第一次团建", date: "2022.9.24",stars: 4, isStared: false, context: "我们举办大班团建的初衷不仅仅只是“玩”。让大家玩得开心只是其中的一个目的\n另一个更重要的目的是给大家营造一种团队感，创造一种属于2006的氛围。生活不能只有代码，还应该有阳光、蓝天和清风。我们希望在五年甚至十年之后，大家在回忆计算机学院的时候，除了想起CO、OO、OS，还能记起这样一个阳光明媚的下午，想起这样一场具有6系特色的团建\n                                                       -团建筹办团队", type:"Activity"),
    Article(id: 3, image: "News4-20Big", title: "奋进新征程，扬帆再起航", date: "2022.10.26",stars: 5, isStared: false, context: "    2022年10月16日，计算机学院各学生支部组织集中收看党的二十大开幕会，部分代表赴晨兴音乐厅观看，其余同志在各支部分会场集中观看。计算机学院全体党支部认真做好学习宣传贯彻党的二十大精神各项工作，组织全体成员认真学习习近平总书记在大会上所作的报告，深入开展学习交流研讨，学院迅速兴起学习宣传贯彻党的二十大精神热潮。", type:"Party"),
    Article(id: 4, image: "News5-Chairman", title: "计算机学院2022年学生代表大会召开", date: "2022.11.09",stars: 3, isStared: false, context: "2022 年11月9日下午，北京航空航天大学计算机学院2022 年学生代表大会在新主楼G849胜利召开，大会圆满完成了各项任务。计算机学院党委副书记冯维成老师、计算机学院分团委书记王婧仪、校学生会代表王浦航、兄弟学院学生会代表出席会议。计算机学院学生代表102人参加会议，代表学院七百余名本科生行使民主权利，参与学院民主建设。\n此次大会听取《北京航空航天大学计算机学院 2022年代表资格审查报告》、《北京航空航天大学计算机学院2022年学生会工作述职报告》；听取、审议并表决《北京航空航天大学计算机学院学生会章程（草案）》、《北京航空航天大学计算机学院 2022年学生代表大会主席团选举办法》；选举产生了计算机学院2022年学生会主席团。", type: "Activity"),
    
]

var FoodTypes = ["Pizza","Drinks","Tacos","Burger","Fries","Top"]
var articleTypes = ["Activity","Teacher","Party"]

