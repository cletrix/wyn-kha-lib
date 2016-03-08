#include <WynAdmobKore.h>
#include <WynAdmobBannerDelegateVC.h>
#include <WynAdmobInterstitialDelegateVC.h>
#include <GoogleMobileAds/GoogleMobileAds.h>
#include <hxcpp.h>
#include "WynAdmobCallbacks.h"

namespace WynAdmobKore
{
    // class WynAdmobCallbacks
    // {
    // public:
    //     static Dynamic adViewDidReceiveAdCB;
    //     static Dynamic didFailToReceiveAdWithErrorCB;
    //     static Dynamic adViewWillPresentScreenCB;
    //     static Dynamic adViewWillDismissScreenCB;
    //     static Dynamic adViewDidDismissScreenCB;
    //     static Dynamic adViewWillLeaveApplicationCB;
        
    //     static void setBannerCallbacks (Dynamic adViewDidReceiveAd, Dynamic didFailToReceiveAdWithError, Dynamic adViewWillPresentScreen, Dynamic adViewWillDismissScreen, Dynamic adViewDidDismissScreen, Dynamic adViewWillLeaveApplication)
    //     {
    //         adViewDidReceiveAdCB = adViewDidReceiveAd;
    //         didFailToReceiveAdWithErrorCB = didFailToReceiveAdWithError;
    //         adViewWillPresentScreenCB = adViewWillPresentScreen;
    //         adViewWillDismissScreenCB = adViewWillDismissScreen;
    //         adViewDidDismissScreenCB = adViewDidDismissScreen;
    //         adViewWillLeaveApplicationCB = adViewWillLeaveApplication;
    //     }
    // };
    
    
    
	NSMutableDictionary *bannerDict;
	GADRequest *adReq;
    GADInterstitial *interstitial;
	WynAdmobBannerDelegateVC *bvc;
	WynAdmobInterstitialDelegateVC *ivc;
    WynAdmobCallbacks *callbacks;

	Dynamic adViewDidReceiveAdCB;
	Dynamic didFailToReceiveAdWithErrorCB;
	Dynamic adViewWillPresentScreenCB;
	Dynamic adViewWillDismissScreenCB;
	Dynamic adViewDidDismissScreenCB;
	Dynamic adViewWillLeaveApplicationCB;

	Dynamic interstitialDidReceiveAdCB;
	Dynamic didFailToReceiveAdWithError2CB;
	Dynamic interstitialWillPresentScreenCB;
	Dynamic interstitialWillDismissScreenCB;
	Dynamic interstitialDidDismissScreenCB;
	Dynamic interstitialWillLeaveApplicationCB;

	void init ()
	{
		NSLog(@"WynAdmobKore init");

		adReq = [GADRequest request];
		adReq.testDevices = @[@"41313f93301a2cbc2ddf5c5e1a3a2ef4b0761618"]; // LWY's ipad
		bannerDict = [[NSMutableDictionary alloc] initWithCapacity:10];

		bvc = [WynAdmobBannerDelegateVC new];
		ivc = [WynAdmobInterstitialDelegateVC new];
        callbacks = new WynAdmobCallbacks();
	}

	void setBannerCallbacks (Dynamic adViewDidReceiveAd, Dynamic didFailToReceiveAdWithError, Dynamic adViewWillPresentScreen, Dynamic adViewWillDismissScreen, Dynamic adViewDidDismissScreen, Dynamic adViewWillLeaveApplication)
	{
        iOsType *callbacks = new iOsType();
        //callbacks->adViewDidReceiveAdCB = adViewDidReceiveAd();
        //[bvc setCallbacks:<#(iOsType *)#>]
        
		// adViewDidReceiveAdCB = adViewDidReceiveAd;
		// didFailToReceiveAdWithErrorCB = didFailToReceiveAdWithError;
		// adViewWillPresentScreenCB = adViewWillPresentScreen;
		// adViewWillDismissScreenCB = adViewWillDismissScreen;
		// adViewDidDismissScreenCB = adViewDidDismissScreen;
		// adViewWillLeaveApplicationCB = adViewWillLeaveApplication;

		// bvc.adViewDidReceiveAdBlock = ^(GADBannerView* view){
		// 	if (adViewDidReceiveAdCB != null()) {
  //               NSLog(@"### adViewDidReceiveAdCB");
		// 		adViewDidReceiveAdCB().Cast<void>();
		// 	}
		// };

		// bvc.didFailToReceiveAdWithErrorBlock = ^(GADRequestError* error){
		// 	if (didFailToReceiveAdWithErrorCB != null()) {
  //               NSLog(@"### didFailToReceiveAdWithErrorCB");
		// 		//didFailToReceiveAdWithErrorCB((String)error.localizedDescription).Cast<void>();
		// 	}
		// };

		// bvc.adViewWillPresentScreenBlock = ^(GADBannerView* view){
		// 	if (adViewWillPresentScreenCB != null()) {
		// 		adViewWillPresentScreenCB().Cast<void>();
		// 	}
		// };

		// bvc.adViewWillDismissScreenBlock = ^(GADBannerView* view){
		// 	if (adViewWillDismissScreenCB != null()) {
		// 		adViewWillDismissScreenCB().Cast<void>();
		// 	}
		// };

		// bvc.adViewDidDismissScreenBlock = ^(GADBannerView* view){
		// 	if (adViewDidDismissScreenCB != null()) {
		// 		adViewDidDismissScreenCB().Cast<void>();
		// 	}
		// };

		// bvc.adViewWillLeaveApplicationBlock = ^(GADBannerView* view){
		// 	if (adViewWillLeaveApplicationCB != null()) {
		// 		adViewWillLeaveApplicationCB().Cast<void>();
		// 	}
		// };
	}

	void createBanner (const char* adName, const char* adUnitId, const char* adType, const char* adGravity)
	{
		NSLog(@"WynAdmobKore createBanner : %s %s %s", adName, adType, adGravity);

		NSString *NSadName = [NSString stringWithUTF8String:adName];
		NSString *NSadType = [NSString stringWithUTF8String:adType];
		NSString *NSadGravity = [NSString stringWithUTF8String:adGravity];

		GADAdSize size = kGADAdSizeMediumRectangle;
		if ([NSadType isEqualToString:@"BANNER"]) { size = kGADAdSizeBanner; }
		else if ([NSadType isEqualToString:@"FLUID"]) { size = kGADAdSizeFluid; }
		else if ([NSadType isEqualToString:@"FULL_BANNER"]) { size = kGADAdSizeFullBanner; }
		else if ([NSadType isEqualToString:@"LARGE_BANNER"]) { size = kGADAdSizeLargeBanner; }
		else if ([NSadType isEqualToString:@"LEADERBOARD"]) { size = kGADAdSizeLeaderboard; }
		else if ([NSadType isEqualToString:@"MEDIUM_RECTANGLE"]) { size = kGADAdSizeMediumRectangle; }
		else if ([NSadType isEqualToString:@"SMART_BANNER"]) { size = kGADAdSizeSmartBannerLandscape; }
		else if ([NSadType isEqualToString:@"WIDE_SKYSCRAPER"]) { size = kGADAdSizeSkyscraper; }
		else {
			NSLog(@"WynAdmobKore unhandled adType : %s", adType);
		}

		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		GADBannerView *bannerView = [GADBannerView new];
		bannerView.rootViewController = bvc;
		bannerView.adUnitID = [NSString stringWithUTF8String:adUnitId];
		bannerView.adSize = size;
		bannerView.delegate = bvc;
		[bannerView loadRequest:adReq];
		[window addSubview:bannerView];
		// bannerView.backgroundColor = [UIColor redColor]; // uncomment to see if banner is visible

		if ([NSadGravity isEqualToString:@"TOP"]) {
			bannerView.center = CGPointMake(window.bounds.size.width/2, bannerView.bounds.size.height/2);
		}
		else if ([NSadGravity isEqualToString:@"CENTER"]) {
			bannerView.center = CGPointMake(window.bounds.size.width/2, window.bounds.size.height/2);
		}
		else if ([NSadGravity isEqualToString:@"BOTTOM"]) {
			bannerView.center = CGPointMake(window.bounds.size.width/2, window.bounds.size.height - bannerView.bounds.size.height/2);
		}
		else if ([NSadGravity isEqualToString:@"LEFT"]) {
			bannerView.center = CGPointMake(bannerView.bounds.size.width/2, window.bounds.size.height/2);
		}
		else if ([NSadGravity isEqualToString:@"RIGHT"]) {
			bannerView.center = CGPointMake(window.bounds.size.width - bannerView.bounds.size.width/2, window.bounds.size.height/2);
		}
		else {
			NSLog(@"WynAdmobKore unhandled adGravity : %s", adGravity);
		}

		// Save banner data to dictionary for toggling visibility later
		[bannerDict setObject:bannerView forKey:NSadName];
	}

	void toggleBanner (const char* adName, bool visible)
	{
		NSString *NSadName = [NSString stringWithUTF8String:adName];
		GADBannerView *bannerView = [bannerDict objectForKey:NSadName];
		if (bannerView != nil) {
			bannerView.hidden = !visible;
		}
	}

	void setInterstitialCallbacks (Dynamic interstitialDidReceiveAd, Dynamic didFailToReceiveAdWithError, Dynamic interstitialWillPresentScreen, Dynamic interstitialWillDismissScreen, Dynamic interstitialDidDismissScreen, Dynamic interstitialWillLeaveApplication)
	{
		interstitialDidReceiveAdCB = interstitialDidReceiveAd;
		didFailToReceiveAdWithError2CB = didFailToReceiveAdWithError;
		interstitialWillPresentScreenCB = interstitialWillPresentScreen;
		interstitialWillDismissScreenCB = interstitialWillDismissScreen;
		interstitialDidDismissScreenCB = interstitialDidDismissScreen;
		interstitialWillLeaveApplicationCB = interstitialWillLeaveApplication;

		ivc.interstitialDidReceiveAdBlock = ^(GADInterstitial* view){
			if (interstitialDidReceiveAdCB != null()) {
				interstitialDidReceiveAdCB().Cast<void>();
			}
		};

		ivc.didFailToReceiveAdWithErrorBlock = ^(GADRequestError* error){
			if (didFailToReceiveAdWithError2CB != null()) {
				didFailToReceiveAdWithError2CB((String)error.localizedDescription).Cast<void>();
			}
		};

		ivc.interstitialWillPresentScreenBlock = ^(GADInterstitial* view){
			if (interstitialWillPresentScreenCB != null()) {
				interstitialWillPresentScreenCB().Cast<void>();
			}
		};

		ivc.interstitialWillDismissScreenBlock = ^(GADInterstitial* view){
			if (interstitialWillDismissScreenCB != null()) {
				interstitialWillDismissScreenCB().Cast<void>();
			}
		};

		ivc.interstitialDidDismissScreenBlock = ^(GADInterstitial* view){
			if (interstitialDidDismissScreenCB != null()) {
				interstitialDidDismissScreenCB().Cast<void>();
			}
		};

		ivc.interstitialWillLeaveApplicationBlock = ^(GADInterstitial* view){
			if (interstitialWillLeaveApplicationCB != null()) {
				interstitialWillLeaveApplicationCB().Cast<void>();
			}
		};
	}

	void createInterstitial (const char* adUnitId)
	{
		NSLog(@"WynAdmobKore createInterstitial");

		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		interstitial = [[GADInterstitial alloc] initWithAdUnitID:[NSString stringWithUTF8String:adUnitId]];
		interstitial.delegate = ivc;

		[interstitial loadRequest:adReq];
	}

	void showInterstitial ()
	{
		NSLog(@"WynAdmobKore showInterstitial");
		if (interstitial != nil) {
			if (interstitial.isReady) {
				[interstitial presentFromRootViewController:ivc];
			}
		}
	}
	
}