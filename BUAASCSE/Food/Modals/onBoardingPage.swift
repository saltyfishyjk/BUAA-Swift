//
//  onBoardingPage.swift
//  BUAASCSE
//

// 欢迎页面滚播图

import Foundation

struct Page : Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

var loadingData = [
    Page(id: 0, image: "entrance1-engineer", title: "快速了解院会动态", descrip: "在这里，你可以获取院会的最新消息，了解正在发生的学院活动、信息公开与工作规划，参与到院会的重大变革当中"),
    Page(id: 1, image: "entrance2-computer", title: "尽情使用院会服务", descrip: "在这里，你可以使用院会提供的各项服务：向志愿权益部发起权益维护申请，向活动实践部发起面向学院学子的有趣活动，向组织部查询你的入党进展...\n各项服务，一站式获取，你的院会就在这里"),
    Page(id: 2, image: "entrance6-computerlogo", title: "向院会提出你的想法", descrip: "在这里，你可以随时向主席团和六个部门表达你的想法。\n院会的下一个重要变革，或许就蕴含在你的灵感巧思当中"),
    Page(id: 3, image: "entrance7-engineerlogo", title: "全心全意 为你而来", descrip: "欢迎来到你的计算机学院\n欢迎来到你的学生会")
]
