//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Firebase
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

/* Creating a reference does not create a connection to the server or begin downloading data. Data is not fetched until a read or write operation is invoked.
*/
var myRootRef = Firebase(url:"https://docs-examples.firebaseio.com/")
var mchenNameRef1 = myRootRef.childByAppendingPath("users/mchen/name")

/* A child node's key cannot be longer than 768 bytes, nor deeper than 32 levels. It can include any unicode characters except for . $ # [ ] / and ASCII control characters 0-31 and 127.
*/

var mchenNameRef2 = Firebase(url:"https://docs-examples.firebaseio.com/web/data/users/mchen/name")

// saving
var ref = Firebase(url: "https://docs-examples.firebaseio.com/web/saving-data/fireblog")

var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]

var usersRef = ref.childByAppendingPath("users")

var users = ["alanisawesome": alanisawesome, "gracehop": gracehop]
usersRef.setValue(users)

var nickname = ["nickname": "Amazing Grace"]

// updating values
var hopperRef = usersRef.childByAppendingPath("gracehop")
hopperRef.updateChildValues(nickname)

var postRef = Firebase(url:"https://docs-examples.firebaseio.com/web/saving-data/fireblog/posts")

//let post3 = ["author": "gracehop", "title": "What it's like to be an admiral"]
//let post3Ref = postRef.childByAutoId()
//post3Ref.setValue(post3)

// Attach a closure to read the data at our posts reference
postRef.observeEventType(.Value, withBlock: { snapshot in
  print(snapshot.value)
  print(snapshot.childrenCount)
  print(snapshot.children)
  }, withCancelBlock: { error in
    print(error.description)
})


