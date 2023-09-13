# Click 'N Ship 
This is an eCommerce app built with Flutter that allows users to sign in, sign up, browse and view products, add products to the cart, and manage their profile.

## Features
*  ### Sign in and Sign up:

      *  User credentials are cached for easy sign-in.
        * The app verifies user credentials before allowing access to protected screens.
* ### Product Listing Screen:
     * Displays a list of products retrieved from the following endpoint: https://dummyjson.com/products.
     * Each product is displayed with its details and a photo slider or carousel using the carousel_slider package.
* ### Cart:

   * Users can add products to their cart.
   * The cart contains a list of cached products.

* ### Profile Screen:

    * Users can view and manage their profile.
    * Includes a logout button that clears all cached data and redirects the user to the sign-in page.



## Color Reference

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Primary Color| ![#15213D](https://via.placeholder.com/10/15213D]?text=+) #15213D |
|Secondary | ![#f8f8f8](https://via.placeholder.com/10/f8f8f8?text=+) #f8f8f8 |
| Third | ![#006400](https://via.placeholder.com/10/006400?text=+) #006400 |



## Screenshots

![App Screenshot](https://github.com/Moisis/Click_N_Ship/assets/19711568/dfbee7cb-e799-49b9-ae07-c10ac456268b)



## Dependencies
The app uses the following dependencies:

 * carousel_slider: https://pub.dev/packages/carousel_slider
 * curved_navigation_bar: https://pub.dev/packages/curved_navigation_bar
* flutter_rating_bar: https://pub.dev/packages/flutter_rating_bar 
* settings_ui: https://pub.dev/packages/settings_ui
* lottie: https://pub.dev/packages/lottie  
* http: https://pub.dev/packages/http
* firebase_core: https://pub.dev/packages/firebase_core  
* firebase_auth: https://pub.dev/packages/firebase_auth 
* shared_preferences: https://pub.dev/packages/shared_preferences
* fluttertoast: https://pub.dev/packages/fluttertoast



## Acknowledgments
- Flutter - UI toolkit by Google
- carousel_slider - Flutter package for carousel sliders
- curved_navigation_bar: A Flutter package for easy implementation of curved navigation bar.
- flutter_rating_bar: fully customizable rating bar for flutter 
- settings_ui: Build the beautiful settings screen UI in one moment
- lottie: A Flutter plugin to use the Firebase Core API
- http: set of high-level functions and classes that make it easy to consume HTTP resources. 
- firebase_core: A Flutter plugin to use the Firebase Core API
- firebase_auth: A Flutter plugin to use the [Firebase Authentication API](https://firebase.google.com/products/auth/). 
- shared_preferences: Wraps platform-specific persistent storage for simple data 
- fluttertoast: toast library



## Author

- [@Moisis](https://github.com/Moisis)
