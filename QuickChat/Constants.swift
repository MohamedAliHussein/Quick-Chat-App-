//
//  File.swift
//  QuickChat
//
//  Created by Mohamed Ali on 2/24/19.
//  Copyright © 2019 mohamed ali. All rights reserved.
//



// Database Referance
import Foundation
import Firebase

struct Constants
{
    struct refs
    {
       static let databaseRoot = Database.database().reference()
      static let databaseChats = databaseRoot.child("chat")
    }
}
