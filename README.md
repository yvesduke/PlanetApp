# Planet App


#### Intro :
This is a small app that fetches planet data from an API EndPoint and displays a list of planet name with their diameters. 
The app also allows users to click on any of the planet to view planet description. 
The app is implemented following clean architecture with SwiftUI and async await for service call to ensure a clear separation of concerns.

#### Quick start :
Using either a real device or a simulator, lunch the app and you will be presented with a list of Planets and their diameters. 
You can scroll up and down to see a full list of planets. If you click on one of the planet displayed on the list, 
you will be presented with a detail page containing planet tittle and planet description.

#### Status :
- The app is currently using SwiftUI to create user Interface. It is build using Clean architecture with Testcases and it uses async await to fetch data from the API.
- Implemented an API call using URLSession to retrieve the necessary data, parse Json data using JSONDecoder, and display it in the app's user interface.
- The app currenlty supports different iOS screen sizes and targets iOS 13 and above
- Writen unit tests for the network layer using XCTest.
- Implemented Error handling
- uses Coredata to save and  fetch data saved on the database for offline capabilities

#### What's included :
- View Layer: This layer contains the app's UI, which is planetListView, planetCell, planetDetailView and the ViewModel. The presentation layer is
responsible for displaying the data to the user and handling the user's interactions.
- Usecase Layer: This layer contains the business logic and use cases of the app. The domain layer is responsible for defining the app's requirements and translating them into application-specific operations.
- Data Layer: This layer is responsible for handling the fetching planet data. It contains repositories and data sources, and it is interacting with the Api endpoint.
- Used dependency injection to connect the layers ensuring that they are independent of each other. This allowed me swap out dependencies without affecting other parts of the app and this is shown where I used MockedNetworkManager to test my network layer without using the real Network manager.
- used repository pattern to further decouple our cod

#### Features :
- Display a list of Planets with their diameters,
- Click on any planet to display a detail view of that specific planet
- checks if we have dota in the database and displys it otherwise goes and fetches data from an api endpoind

#### Recommendations for future features and improvements :
 - GraphQl
 - Coordinator pattern
 - UItesting and BDD
 - Static Code analyser

#### Screen shots
<img width="329" alt="Screenshot 2023-05-15 at 15 34 20" src="https://github.com/yvesduke/PlanetApp/assets/8191486/157a96cf-5cdc-44f4-ad14-9641083ec0a0">

<img width="329" alt="Screenshot 2023-05-15 at 15 35 43" src="https://github.com/yvesduke/PlanetApp/assets/8191486/3db3c830-87f8-4ad3-9b46-9cbc9ba5e012">



