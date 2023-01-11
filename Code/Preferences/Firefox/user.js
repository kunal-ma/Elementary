/** Mandatory **/

user_pref("browser.tabs.tabmanager.enabled", false);
user_pref("extensions.blocklist.enabled", false);
user_pref("accessibility.force_disabled", 1);
user_pref("media.hardware-video-decoding.force-enabled", true);
user_pref("gfx.webrender.all", true);
user_pref("media.hardware-video-decoding.force-enabled", true);

/** MaterialFox-Plus **/

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // default is false
user_pref("svg.context-properties.content.enabled", true); 				// default is false
user_pref("browser.tabs.tabClipWidth", 83); 							// default is 140
user_pref("security.insecure_connection_text.enabled", true);           // default is false