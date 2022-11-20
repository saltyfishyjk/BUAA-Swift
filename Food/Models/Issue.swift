//
//  Issue.swift
//  BUAASCSE
//

import Foundation
struct Issue:Hashable, Codable, Identifiable {
    var id:Int
    var type:Int    //  1 2 3 4 对应tab2的四个button
    
    //type1
    var title:String
    var content:String

    
    
    //type2
    //title
    var target : String
    var money:Int
    //content
    
    //type3
    //title
    var department:String
    //content
    
    //type4
    var stuId:String
    var stuName:String
    
    var progress:Int
    
    init(id:Int,type:Int,title:String,content:String){
        self.id=id
        self.type=type
        self.title=title
        self.content=content
        
        self.target=""
        self.money=0
        
        self.department=""
        
        self.stuId=""
        self.stuName=""
        
        self.progress=0
        
    }
    
    init(id:Int,type:Int,title:String,target:String,money:Int,content:String){
        self.id=id
        self.type=type
        self.title=title
        self.content=content
        
        self.target=target
        self.money=money
        
        self.department=""
        
        self.stuId=""
        self.stuName=""
        self.progress=0
        
    }
    
    init(id:Int,type:Int,title:String,department:String,content:String){
        self.id=id
        self.type=type
        self.title=title
        self.content=content
        
        self.target=""
        self.money=0
        
        self.department=department
        
        self.stuId=""
        self.stuName=""
        self.progress=0
    }
    
    init(id:Int,type:Int,stuId:String,stuName:String){
        self.id=id
        self.type=type
        self.title=""
        self.content=""
        
        self.target=""
        self.money=0
        
        self.department=""
        
        self.stuId=stuId
        self.stuName=stuName
        self.progress=0
    }
    
    
}
