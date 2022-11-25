//
//  OurPicks.swift
//  BUAASCSE
//

import SwiftUI

// 精选内容页
struct OurPicks: View {
    @EnvironmentObject var userData:UserData
    @Binding var card : Article
    //var card : Article
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    
    @State var commentSheet = false
    
    var body: some View {
        VStack {
            //ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Image(card.image)
                        .resizable()
                        .frame(width: self.card.isStared ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.9 , height: self.card.isStared ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                        .cornerRadius(self.card.isStared ? 5 : 20)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .zIndex(5.0)
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
                
                
                HStack{
                    VStack{
                        HStack {
                            Text(card.title)
                                .bold()
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        .padding(.leading, self.card.isStared ? 10 : 20)
                        
                        HStack {
                            Text(card.date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.leading, self.card.isStared ? 20 : 30)
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(0 ..< card.stars) { item in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.subheadline)
                            }
                            Spacer()
                            
                            /*
                             Text(card.price)
                             .font(.subheadline)
                             .bold()*/
                        }
                        .padding(.bottom, 30)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.leading, self.card.isStared ? 10 : 20)
                        .padding(.trailing, self.card.isStared ? 10 : 20)
                        
                    }
                    if (self.card.isStared) {
                        HStack{
                            Spacer()
                            Button(action: {
                                //print("pressssssed")
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    
                                    
                                    self.card.isStared.toggle()
                                    self.hero.toggle()
                                }
                                
                            },label:{
                                
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                                
                                
                            })
                        }.frame(width: 30)
                        
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.trailing,30)
                        
                        
                    }
                }
                
                if self.card.isStared {
                    VStack{
                        HStack {
                            
                                Text("简介")
                                    .font(.title)
                                    .bold()
                                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                            Spacer()
                            
                           /* Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    if(heart == "heart.fill") {heart = "heart"}
                                    else {heart="heart.fill"}
                                }
                            }, label: {
                                Image(systemName: heart)
                                    .font(.title)
                                    .foregroundColor(.red)
                                
                            })
                            .padding(15)*/
                            
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    if self.userData.prefers[self.card.id].likedUserId.contains(self.userData.userId){
                                        let t = self.userData.prefers[self.card.id].likedUserId.firstIndex(where: {$0 == self.userData.userId})!
                                        self.userData.prefers[self.card.id].likedUserId.remove(at: t)
                                        
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                        
                                    } else {
                                        self.userData.prefers[self.card.id].likedUserId.append(self.userData.userId)
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    }}
                            })
                            {
                                        
                                if self.userData.prefers[self.card.id].likedUserId.contains(self.userData.userId) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(Color.red)
                                        .font(.title)
                                } else {
                                    
                                    Image(systemName: "heart").foregroundColor(Color.red).font(.title)}}
                            .padding(9)
                            
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    if self.userData.prefers[self.card.id].staredUserId.contains(self.userData.userId){
                                        let t = self.userData.prefers[self.card.id].staredUserId.firstIndex(where: {$0 == self.userData.userId})!
                                        self.userData.prefers[self.card.id].staredUserId.remove(at: t)
                                        
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    } else {
                                        self.userData.prefers[self.card.id].staredUserId.append(self.userData.userId)
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    }}
                            })
                            {
                                        
                                if self.userData.prefers[self.card.id].staredUserId.contains(self.userData.userId) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                        .font(.title)
                                } else {
                                    
                                    Image(systemName: "star").foregroundColor(Color.yellow).font(.title)}}
                            .padding(15)
                            
                            
                            
                            
                            
                            Button(action: { self.commentSheet=true }, label: {
                                VStack{
                                    Image(systemName: "bubble.left")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.blue.opacity(0.85))
                                    //.padding(10)
                                    Text("评论")
                                        .foregroundColor(Color.blue.opacity(0.85))
                                        .font(.system(size: 17))
                                }
                            })
                            .padding(.trailing, 30)
                            .sheet(isPresented: self.$commentSheet, content:
                                    {
                                WriteCommentView(card:self.card){ text in
                                            print("\(text)")
                                }
                                    }
                            )
                                
                        }
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(card.context)
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }.frame(height: 100)
                        
                        
                        
                        
                        CommentListView(card:self.card)
                        
                    }
                }
            }
    }
}

struct WriteCommentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData:UserData
    
    @State var card:Article
    
    //@State var titleText=""
    @State var content=""
    @State var secondSheet=false
    @State var getImage = [Image]()
    
    @State var showAlert=false
    
    @State var getUIImage=[UIImage]()
    @State var y=0
    
    @State var releaseAlert = false
    
    let onCommentFinished: (String) -> Void
    
    func loadImageInToCache(str:String, uploadImg:UIImage){
        let filename = getDocumentsDirectory().appendingPathComponent(str+".jpg")
        if let data = uploadImg.jpegData(compressionQuality: 0.8) {
            try? data.write(to: filename)
        }
        print("\(filename) has loaded")
    }
    
    func upload(){
        let imgName="comment\(self.userData.comments.count)"
        loadImageInToCache(str: imgName, uploadImg: getUIImage[0])
        let t=Comment(id: self.userData.comments.count, userId: self.userData.userId, articleId: card.id, content: self.content, commentImageName: imgName)
        
        
        self.userData.comments.append(t)
        
        let encoder = JSONEncoder()
        do  {
            // 将player对象encod（编码）
            let data: Data = try encoder.encode(self.userData.comments)
            let filename = getDocumentsDirectory().appendingPathComponent("Comment.json")
            try? data.write(to: filename)
        } catch {
            
        }
        
        self.onCommentFinished(self.content)
        self.presentationMode.wrappedValue.dismiss()
        
    
    }
    
    var body: some View {
        VStack {
            //TextField("标题",text:self.$titleText)
            
            
            Button(action: {
                    self.releaseAlert=true
            }
                   //,label: {Text("提交")}
            ) {
                HStack {
                    Image(systemName: "paperplane").font(.title)
                    Text("提交")
                }
            }
            .alert(isPresented: self.$releaseAlert) {
                
                if(!self.getImage.isEmpty){
                    return Alert(
                        title: Text("确定发布？"),
                        
                        primaryButton: .default(
                            Text("继续编辑")
                            //action: saveWorkoutData
                        ),
                        secondaryButton: .destructive(
                            Text("立即发布"),
                            action: {
                                self.upload()
                            }
                        )
                    )}
                else {
                   return Alert(
                        title: Text("图片不能为空"),
                        message: Text("请添加图片")
                    )
                }
            }
                    
            
            
            
            TextField("评论",text:self.$content)
                .padding(20)
            
            VStack{
                Divider().foregroundColor(Color.gray.opacity(0.5)).padding(5)
                HStack{
                    Image(systemName: "camera.circle")
                        .font(.system(size: 25))
                        .foregroundColor(Color.gray.opacity(0.85))
                        .padding(10)
                    Text("图片")
                        .foregroundColor(Color.gray.opacity(0.85))
                        .font(.system(size: 20))
                    Spacer()}
                
                HStack{
                Button(
                    action: { self.secondSheet = true }, label: {
                        VStack {
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .font(.system(size: 35))
                                .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                            Text("点击上传图片")
                                .foregroundColor(Color.gray.opacity(0.85))
                                .font(.system(size: 17))}
                                .frame(width: 130, height: 130)
                                .background(Color.gray.opacity(0.2))
                                .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top, spacing: 0) {
                            
                            ForEach(0..<getImage.count,id:\.self) { index in
                                
                                self.getImage[index]
                                
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(5)
                                    .padding(5)
                                
                                    .onTapGesture {
                                        self.showAlert=true
                                        self.y=index
                                        
                                    }.alert(isPresented: self.$showAlert) {
                                        Alert(
                                            title: Text("删除此照片？"),
                                            
                                            primaryButton: .default(
                                                Text("取消")
                                                //action: saveWorkoutData
                                            ),
                                            secondaryButton: .destructive(
                                                Text("删除"),
                                                action: {
                                                    
                                                    
                                                    self.getImage.remove(at: self.y)
                                                    self.getUIImage.remove(at: self.y)
                                                    
                                                }
                                            )
                                        )
                                    }
                                
                                
                                
                            }}}
                    .frame(height: 145)
                    .sheet(isPresented: self.$secondSheet,content:
                                { ImagePicker(sourceType: .photoLibrary) { image in
                        if(self.getImage.isEmpty){
                            self.getImage.append(Image(uiImage: image))
                            self.getUIImage.append(image)
                        }else {
                            self.getUIImage[0]=image
                            self.getImage[0]=(Image(uiImage: image))}}})}}
            
        
                
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}



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
/*
 struct OurPicks_Previews: PreviewProvider {
 static var previews: some View {
 OurPicks(card:.constant(articleData[0]), hero:.constant(false))
 }
 }
 */
