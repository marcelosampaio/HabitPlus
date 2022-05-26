//
//  RemoteDataSource.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 26/05/22.
//

import Foundation

class RemoteDataSource {
    // Simgleton Pattern
    
    static var shared: RemoteDataSource = RemoteDataSource()
     
    private init() {
        
    }
    
    func login(request: SignInRequest, completion: (SignInResponse?, SignInErrorResponse?) -> Void) {
        
    }
    
}
