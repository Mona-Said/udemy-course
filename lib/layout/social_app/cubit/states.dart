abstract class SocialLayoutStates {}

class SocialLayoutInitialState extends SocialLayoutStates {}

class SocialLayoutGetUserDataLoadingState extends SocialLayoutStates {}

class SocialLayoutGetUserDataSuccessState extends SocialLayoutStates {}

class SocialLayoutGetUserDataErrorState extends SocialLayoutStates {}

class SocialChangeBottomNavState extends SocialLayoutStates {}

class SocialAddPostState extends SocialLayoutStates {}

class SocialGetProfileImageSuccessState extends SocialLayoutStates {}

class SocialGetProfileImageErrorState extends SocialLayoutStates {}

class SocialGetCoverImageSuccessState extends SocialLayoutStates {}

class SocialGetCoverImageErrorState extends SocialLayoutStates {}

class SocialUpdateUserDataLoadingState extends SocialLayoutStates {}

class SocialUploadProfileImageErrorState extends SocialLayoutStates {}

class SocialUploadCoverImageErrorState extends SocialLayoutStates {}

class SocialUpdateUserDataErrorState extends SocialLayoutStates {}

// post
class SocialCreatePostLoadingState extends SocialLayoutStates {}

class SocialCreatePostSuccessState extends SocialLayoutStates {}

class SocialCreatePostErrorState extends SocialLayoutStates {}

class SocialGetPostImageSuccessState extends SocialLayoutStates {}

class SocialGetPostImageErrorState extends SocialLayoutStates {}

class SocialDeletePostImageState extends SocialLayoutStates {}

class SocialLayoutGetPostsLoadingState extends SocialLayoutStates {}

class SocialLayoutGetPostsSuccessState extends SocialLayoutStates {}

class SocialLayoutGetPostsErrorState extends SocialLayoutStates {}

class SocialLayoutLikePostsSuccessState extends SocialLayoutStates {}

class SocialLayoutLikePostsErrorState extends SocialLayoutStates {}
