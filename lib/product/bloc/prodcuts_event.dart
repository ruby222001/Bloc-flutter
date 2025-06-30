abstract class ProductEvent {}

/*
 1) Events describe what happens in your app
Think of events as inputs: user actions or app triggers (e.g., “LoadProducts”, “AddToCart”).

Events tell the BLoC: “Hey! Something happened! Please handle it.”*/
class LoadProducts extends ProductEvent {}
