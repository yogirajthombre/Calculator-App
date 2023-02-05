//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Yogiraj Thombre on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    
    var colorLightGray : Color = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    
    var colorPurple : Color = Color.purple
    
    var colorLightBlack : Color = Color(#colorLiteral(red: 0.2586316478, green: 0.2641284056, blue: 0.2640786745, alpha: 1))
    
    @State var operation : String = "0"
    
    @State var prev_operation : String = ""
    
    var body: some View {
        
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            HStack {
                
                VStack (spacing:20){
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Text(prev_operation)
                            .foregroundColor(colorLightGray)
                            .font(.system(size: 34))
                            .offset(x: -50)
                        
                    }
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        Text(operation)
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 44))
                            .offset(x: -50)
                        
                    }
                    
                    Spacer().frame(height: 20, alignment: .center)
                    
                    HStack (spacing:20){
                        
                        Button("AC"){
                            operation = "0"
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorLightGray))
                        
                        Button {
                            if operation.count != 0 {
                                operation.removeLast()
                            }
                        } label: {
                            Image(systemName: "delete.left.fill")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorLightGray))
                        
                        
                        Button("%"){
                            operation.append("%")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorLightGray))
                        
                        
                        Button ("/"){
                            operation.append("/")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorPurple))
                        
                        
                    }
                    
                    
                    HStack (spacing:20){
                        
                        ForEach(7..<10){ index in
                            
                            Button("\(index)"){
                                
                                if operation.count == 1 && operation == "0"{
                                    operation.removeLast()
                                }
                                
                                operation.append("\(index)")
                                
                            }.font(.system(size: 25))
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80, alignment: .center)
                                .background(Circle().fill(colorLightBlack))
                        }
                        
                        Button {
                            operation.append("x")
                        } label: {
                            Image(systemName: "multiply")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorPurple))
                        
                        
                    }
                    
                    HStack (spacing:20){
                        
                        ForEach(4..<7){ index in
                            
                            Button("\(index)"){
                                
                                if operation.count == 1 && operation == "0"{
                                    operation.removeLast()
                                }
                                
                                operation.append("\(index)")
                                
                            }.font(.system(size: 25))
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80, alignment: .center)
                                .background(Circle().fill(colorLightBlack))
                        }
                        
                        Button("-"){
                            operation.append("-")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorPurple))
                        
                        
                    }
                    
                    HStack (spacing:20){
                        
                        ForEach(1..<4){ index in
                            
                            Button("\(index)"){
                                
                                if operation.count == 1 && operation == "0"{
                                    operation.removeLast()
                                }
                                
                                operation.append("\(index)")
                                
                            }.font(.system(size: 25))
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80, alignment: .center)
                                .background(Circle().fill(colorLightBlack))
                        }
                        
                        Button("+"){
                            operation.append("+")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorPurple))
                        
                        
                    }
                    
                    HStack (spacing:20){
                        
                        Button("0"){
                            operation.append("0")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 170, height: 80, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 50).fill(colorLightBlack))
                        
                        
                        Button("."){
                            operation.append(".")
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorLightBlack))
                        
                        
                        Button("="){
                            
                            let output =  evalutate_operation(operation: operation)
                            
                            prev_operation = operation
                            
                            operation = String(output)
                            
                        }.font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Circle().fill(colorPurple))
                        
                    }.padding(.bottom,40)
                    
                    Spacer().frame(height: 10, alignment: .center)
                    
                }
                
            }
        }
        
    }
    
}

func evalutate_operation(operation:String)->Int{
    
    let _add = operation.split(separator: "+")
    
    let _substract = operation.split(separator:"-")
    
    let _multiply = operation.split(separator: "x")
    
    let _divide = operation.split(separator: "/")
    
    let _remainder = operation.split(separator: "%")
    
    var output = 0
    
    if _add.count == 2 {
        
        for nums in _add {
            output = (Int(nums) ?? 0) + output
        }
        
    }
    
    if _substract.count == 2 {
        
        for nums in _substract {
            if output == 0 {
                output = Int(nums) ?? 0
            }else {
                output = output - (Int(nums) ?? 0)
            }
        }
        
    }
    
    if _multiply.count == 2 {
        
        output = 1
        
        for nums in _multiply {
            output = (Int(nums) ?? 0) * output
        }
        
    }
    
    if _divide.count == 2 {
        
        output = 1
        
        for nums in _divide {
            if output == 1 {
                output = Int(nums) ?? 0
            }else {
                output = output / (Int(nums) ?? 0)
            }
        }
        
    }
    
    if _remainder.count == 2 {
        
        output = 1
        
        for nums in _remainder {
            if output == 1 {
                output = Int(nums) ?? 0
            }else {
                output = output % (Int(nums) ?? 0)
            }
        }
        
    }
    
    print(output)
    
    return output
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
