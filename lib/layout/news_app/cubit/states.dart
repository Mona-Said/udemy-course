abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsChangeBottomNavBarState extends NewsStates{}

class BusinessGetLoadingState extends NewsStates{}

class BusinessSuccessState extends NewsStates{}

class BusinessErrorState extends NewsStates{
  final String error;
  BusinessErrorState(this.error);
}

class SportsGetLoadingState extends NewsStates{}

class SportsSuccessState extends NewsStates{}

class SportsErrorState extends NewsStates{
  final String error;
  SportsErrorState(this.error);
}

class ScienceGetLoadingState extends NewsStates{}

class ScienceSuccessState extends NewsStates{}

class ScienceErrorState extends NewsStates{
  final String error;
  ScienceErrorState(this.error);
}

class SearchGetLoadingState extends NewsStates{}

class SearchSuccessState extends NewsStates{}

class SearchErrorState extends NewsStates{
  final String error;
  SearchErrorState(this.error);
}