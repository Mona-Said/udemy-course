 abstract class CounterStates {}

 class CounterInitialState extends CounterStates{}

 class CounterMinusState extends CounterStates
 {
   int item ;

  CounterMinusState(this.item);

 }

 class CounterPlusState extends CounterStates
 {
  int item ;

  CounterPlusState(this.item);

 }