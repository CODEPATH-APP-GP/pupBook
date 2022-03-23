Unit 8: Group Milestone - 

# PupBook

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
The app will allow two profiles (The Pet Owner and The Pet Sitter). The feed on the application will consist of information about pets inputed by a Pet Owner. The Pet Sitter will  be able to the Pet Owner to question about the pet.  Could be potentially used as a service app for pet sitters.

### App Evaluation
- **Category:** Social Networking / Lifestyle
- **Mobile:** This app would be developed for mobile devices. Users may be able to acesss the application from other devices. However, at the moment,it will be developed for mobile devices.
- **Story:** Allows users to post information about their pets, and connects them to pet sitters. Based on the information displayed on the feed, a user (pet sitter) can choose what pet they want. 
- **Market:** Anyone with an interest relating to pets can use this app.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how urgent they require the service. 
- **Scope:** First we would start with encouraging both Pet Owners and Pet Sitters to sign up to populate the feed of our application.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previous posts and comments
* two types of users client and petsitter.
* pet sitters can comment the pictures that the clients post.
* Profile pages for each user
* [X]logout and login for both user types (Completed)

**Optional Nice-to-have Stories**

* send a notification to the client when a pet sitter reponds to a post
* profile screen

### 2. Screen Archetypes 

* Login / Signup
   * User enters credentails app makes sure to know if the user is a registered client or pet sitter
* Feed Screen 
   * client will post pictures of their dogs and petsitters will comment about availability.
* Profile Screen
   * general information about client/petsitter and history of posts/comments.

### 3. Navigation


**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available.
* Feed -> client posts pictures and pet sitters comment.
* Profile -> Text field to be modified. (type information about themselves like instagram bio)


## Wireframes
<img src="https://i.imgur.com/kmmebha.jpg" width=800><br>

### Schema


| Property | Type | Description |
| :------- |:---------| :-----|
| objectId | String | unique id for the user post (default field) |
| author | Pointer to User | image author |
| image | File | image that cleint posts |
| bio | String | medium length paragraph that contains personal information about client/pet sitter |
| commentsCount | Number | number of pet sitter comments |
| postedAt | DateTime | date when post is created |
| commentedAt | DateTime | date when petsitter comments |

### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
 
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user/petsitter  profile image
 

	
