abstract class SocialAppStates{}

class SocialAppInitialState extends SocialAppStates{}

class SocialAppLoadingState extends SocialAppStates{}

class SocialAppSuccessState extends SocialAppStates
{
  final String uId;

  SocialAppSuccessState(this.uId);
}

class SocialAppErrorState extends SocialAppStates
{
  final String error;
  SocialAppErrorState(
      this.error,
      );
}

class SocialAppChangeVisibilityState extends SocialAppStates{}
