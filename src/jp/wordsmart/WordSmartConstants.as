package jp.wordsmart
{
	import jp.wordsmart.assets.FlagLib16;
	import jp.wordsmart.utils.language.Dialect;

	public class WordSmartConstants
	{
			public static const debugging:Boolean = true;
			
			
			
			public static const WEB_URL:String = "www.wordsmart.jp";
			public static const IMAGE_COPYRIGHT_TEXT:String = "WordSmart Image, All rights reserved.";
			public static const AUDIO_COPYRIGHT_TEXT:String = "WordSmart Audio, All rights reserved.";
			public static const MIN_IMAGE_HEIGHT:int = 320;
			public static const MIN_IMAGE_WIDTH:int = 480;
		
			public static const WORDSMART_SERVICE_SUCCESS_STATUS:String = "ok";
			public static const WORDSMART_SERVICE_FAIL_STATUS:String = "fail";
		
			public static const LANG_JAPANESE:String = "ja";
			public static const LANG_ENGLISH:String = "en";
			public static const LANG_CHINESE_SIMPLIFIED:String = "zh-CN";
			public static const DEFAULT_BASE_LANGUAGE:String = LANG_ENGLISH;
			public static const JQUERY_CDN_URL:String = "https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js";
			
			public static const TEMP_SAVE_FOLDER_PATH:String = "word-smart-temp/";
			public static const TEMP_WAV_FILE_NAME:String = "wordsmart_lastRecorded.wav";
			public static const TEMP_MP3_FILE_NAME:String = "wordsmart_lastRecorded.mp3";
			
			public static const IMAGE_BUCKET:String = "wsimages";
			public static const AUDIO_BUCKET:String = "wsaudio";
			
			public static const AMAZON_BASE:String = "s3.amazonaws.com";//"ap-southeast-1.queue.amazonaws.com"//"s3.amazonaws.com";
			
			
			
			public static const amazon_secret_key:String = "QvL8o3sW2SeIMeGDKV7mKkqW4EWigvUqCadQ0LYq"; // Amazon secret key
			public static const amazon_access_key:String = "AKIAIWWT5UZASSBE3AYA"; // Amazon access key
			
			
			public static const audioMoods:Array = ['normal','singing','friendly','cheerful','gloomy','assured ','rejected','ashamed','worried', 'excited', 'nervous' ];
			public static const DEFAULT_AUDIO_MOOD:String = audioMoods[0];
			
			public static const audioTypes:Array = ["undefined","word", "conversation", "pronunciation"];
			public static const DEFAULT_AUDIO_TYPE:String = audioTypes[0];
			

			public static const AUDIO_ORIGIN_USER_RECORDED:String = "AUDIO_ORIGIN_USER_RECORDED";
			public static const AUDIO_ORIGIN_WEB_URL:String = "AUDIO_ORIGIN_WEB_URL";
			public static const AUDIO_ORIGIN_USER_FILE:String = "AUDIO_ORIGIN_USER_FILE";
			public static const AUDIO_BAD_FILE:String = "AUDIO_BAD_FILE";
			
			
			public static const keywordTypes:Array = ["undefined","noun", "adjective", "verb", "fragment", "conversation", "pronunciation"];
			public static const DEFAULT_KEYWORD_TYPE:String = keywordTypes[0];
			
			
			//if there is more tan one dialect for the language change dialect_label from Native!!
			public static const DIALECTS:Array = [new Dialect({"country_label":"United Kingdom", "country_code":"gb","language_code":"en","dialect_label":"British", "language_label":"English", "dialect_code":"en-gb", "dialect_icon":FlagLib16.en}),
				new Dialect({"country_label":"United States", "country_code":"us","language_code":"en","dialect_label":"American", "language_label":"English", "dialect_code":"en-us", "dialect_icon":FlagLib16.us}),
				new Dialect({"country_label":"Australia", "country_code":"au","language_code":"en","dialect_label":"Australian", "language_label":"English", "dialect_code":"en-au", "dialect_icon":FlagLib16.au}),
				new Dialect({"country_label":"Canada", "country_code":"ca","language_code":"en","dialect_label":"Canadian", "language_label":"English", "dialect_code":"en-ca", "dialect_icon":FlagLib16.ca}),
				new Dialect({"country_label":"New Zealand", "country_code":"nz","language_code":"en","dialect_label":"New Zealand", "language_label":"English", "dialect_code":"en-nz", "dialect_icon":FlagLib16.nz}), 
				new Dialect({"country_label":"England", "country_code":"gb-eng","language_code":"en","dialect_label":"British(England)", "language_label":"English", "dialect_code":"en-gb-eng", "dialect_icon":FlagLib16.en}), 
				new Dialect({"country_label":"Scotland", "country_code":"gb-sco","language_code":"en","dialect_label":"British(Scotland)", "language_label":"English", "dialect_code":"en-gb-sco", "dialect_icon":FlagLib16.en}), 
				new Dialect({"country_label":"England", "country_code":"gb-wal","language_code":"en","dialect_label":"British(Wales)", "language_label":"English", "dialect_code":"en-gb-wal", "dialect_icon":FlagLib16.en}), 
				new Dialect({"country_label":"England", "country_code":"gb-ire","language_code":"en","dialect_label":"British(N.Ireland)", "language_label":"English", "dialect_code":"en-gb-ire", "dialect_icon":FlagLib16.en}), 
				new Dialect({"country_label":"Ireland", "country_code":"ie","language_code":"en","dialect_label":"Ireland", "language_label":"English", "dialect_code":"en-ie", "dialect_icon":FlagLib16.ie}), 
				new Dialect({"country_label":"Japan", "country_code":"jp","language_code":"ja","dialect_label":"Native", "language_label":"Japanese", "dialect_code":"ja-jp", "dialect_icon":FlagLib16.ja}),
				new Dialect({"country_label":"China", "country_code":"cn","language_code":"zh-CN","dialect_label":"Native", "language_label":"Chinese(Simplified)", "dialect_code":"zh-cn", "dialect_icon":FlagLib16.zh_cn}),
				new Dialect({"country_label":"Taiwan", "country_code":"tw","language_code":"zh-TW","dialect_label":"Native", "language_label":"Chinese(Traditional)", "dialect_code":"zh-tw", "dialect_icon":FlagLib16.zh_tw}),
				new Dialect({"country_label":"Korea, Republic of", "country_code":"kr","language_code":"ko","dialect_label":"Native", "language_label":"Korean", "dialect_code":"ko-kr", "dialect_icon":FlagLib16.ko}),
				new Dialect({"country_label":"France", "country_code":"fr","language_code":"fr","dialect_label":"Native", "language_label":"French", "dialect_code":"fr-fr", "dialect_icon":FlagLib16.fr}),
				new Dialect({"country_label":"Canada", "country_code":"fr","language_code":"fr","dialect_label":"Canadian", "language_label":"Canadian French", "dialect_code":"fr-ca", "dialect_icon":FlagLib16.ca}),
				new Dialect({"country_label":"Spain", "country_code":"es","language_code":"es","dialect_label":"Native", "language_label":"Spanish", "dialect_code":"es-es", "dialect_icon":FlagLib16.es}),
				new Dialect({"country_label":"United States", "country_code":"es","language_code":"es","dialect_label":"American Spanish", "language_label":"Spanish", "dialect_code":"es-us", "dialect_icon":FlagLib16.us}),
				new Dialect({"country_label":"Portugal", "country_code":"pt","language_code":"pt","dialect_label":"Portuguese", "language_label":"Portuguese", "dialect_code":"pt-pt", "dialect_icon":FlagLib16.pt}),
				new Dialect({"country_label":"Brazil", "country_code":"br","language_code":"pt","dialect_label":"Brazilian", "language_label":"Portuguese", "dialect_code":"pt-br", "dialect_icon":FlagLib16.br}),
				new Dialect({"country_label":"Germany", "country_code":"de","language_code":"de","dialect_label":"Native", "language_label":"German", "dialect_code":"de-de", "dialect_icon":FlagLib16.de}),
				new Dialect({"country_label":"Italy", "country_code":"it","language_code":"it","dialect_label":"Native", "language_label":"Italian", "dialect_code":"it-it", "dialect_icon":FlagLib16.it}),
				new Dialect({"country_label":"Russian Federation", "country_code":"ru","language_code":"ru","dialect_label":"Native", "language_label":"Russian", "dialect_code":"ru-ru", "dialect_icon":FlagLib16.ru}),
				new Dialect({"country_label":"Saudi Arabia", "country_code":"sa","language_code":"ar","dialect_label":"Native", "language_label":"Arabic", "dialect_code":"ar-sa", "dialect_icon":FlagLib16.sa}),
				new Dialect({"country_label":"Bulgaria", "country_code":"bg","language_code":"bg","dialect_label":"Native", "language_label":"Bulgarian", "dialect_code":"bg-bg", "dialect_icon":FlagLib16.bg}),
				new Dialect({"country_label":"Croatia (Hrvatska)", "country_code":"hr","language_code":"hr","dialect_label":"Native", "language_label":"Croatian", "dialect_code":"hr-hr", "dialect_icon":FlagLib16.hr}),
				new Dialect({"country_label":"Czech Republic", "country_code":"cz","language_code":"cs","dialect_label":"Native", "language_label":"Czech", "dialect_code":"cs-cz", "dialect_icon":FlagLib16.cs}),
				new Dialect({"country_label":"Denmark", "country_code":"dk","language_code":"da","dialect_label":"Native", "language_label":"Danish", "dialect_code":"da-dk", "dialect_icon":FlagLib16.da}),
				new Dialect({"country_label":"Netherlands", "country_code":"nl","language_code":"nl","dialect_label":"Native", "language_label":"Dutch", "dialect_code":"nl-nl", "dialect_icon":FlagLib16.nl}),
				new Dialect({"country_label":"Finland", "country_code":"fi","language_code":"fi","dialect_label":"Native", "language_label":"Finnish", "dialect_code":"fi-fi", "dialect_icon":FlagLib16.fi}),
				new Dialect({"country_label":"Greece", "country_code":"gr","language_code":"el","dialect_label":"Native", "language_label":"Greek", "dialect_code":"el-gr", "dialect_icon":FlagLib16.el}),
				new Dialect({"country_label":"India", "country_code":"in","language_code":"hi","dialect_label":"Native", "language_label":"Hindi", "dialect_code":"hi-in", "dialect_icon":FlagLib16.india}),
				new Dialect({"country_label":"Norway", "country_code":"no","language_code":"no","dialect_label":"Native", "language_label":"Norwegian", "dialect_code":"no-no", "dialect_icon":FlagLib16.no}),
				new Dialect({"country_label":"Poland", "country_code":"pl","language_code":"pl","dialect_label":"Native", "language_label":"Polish", "dialect_code":"pl-pl", "dialect_icon":FlagLib16.pl}),
				new Dialect({"country_label":"Sweden", "country_code":"se","language_code":"sv","dialect_label":"Native", "language_label":"Swedish", "dialect_code":"sv-se", "dialect_icon":FlagLib16.sv})
			];
		
			
			//do i need this?
			public static const COUNTRIES:Array = [{"GB":"United Kingdom"},
													{"JP":"Japan"},
													{"US":"United States"},
													{"CA":"Canada"},
													{"AU":"Australia"},
													{"NZ":"New Zealand"},
													{"BR":"Brazil"},
													{"CN":"China"},
													{"KR":"Korea, Republic of"},
													{"AF":"Afghanistan"},
													{"AL":"Albania"},
													{"DZ":"Algeria"},
													{"DS":"American Samoa"},
													{"AD":"Andorra"},
													{"AO":"Angola"},
													{"AI":"Anguilla"},
													{"AQ":"Antarctica"},
													{"AG":"Antigua and/or Barbuda"},
													{"AR":"Argentina"},
													{"AM":"Armenia"},
													{"AW":"Aruba"},
													{"AT":"Austria"},
													{"AZ":"Azerbaijan"},
													{"BS":"Bahamas"},
													{"BH":"Bahrain"},
													{"BD":"Bangladesh"},
													{"BB":"Barbados"},
													{"BY":"Belarus"},
													{"BE":"Belgium"},
													{"BZ":"Belize"},
													{"BJ":"Benin"},
													{"BM":"Bermuda"},
													{"BT":"Bhutan"},
													{"BO":"Bolivia"},
													{"BA":"Bosnia and Herzegovina"},
													{"BW":"Botswana"},
													{"BV":"Bouvet Island"},
													{"IO":"British lndian Ocean Territory"},
													{"BN":"Brunei Darussalam"},
													{"BG":"Bulgaria"},
													{"BF":"Burkina Faso"},
													{"BI":"Burundi"},
													{"KH":"Cambodia"},
													{"CM":"Cameroon"},
													{"CV":"Cape Verde"},
													{"KY":"Cayman Islands"},
													{"CF":"Central African Republic"},
													{"TD":"Chad"},
													{"CL":"Chile"},
													{"CX":"Christmas Island"},
													{"CC":"Cocos (Keeling) Islands"},
													{"CO":"Colombia"},
													{"KM":"Comoros"},
													{"CG":"Congo"},
													{"CK":"Cook Islands"},
													{"CR":"Costa Rica"},
													{"HR":"Croatia (Hrvatska)"},
													{"CU":"Cuba"},
													{"CY":"Cyprus"},
													{"CZ":"Czech Republic"},
													{"DK":"Denmark"},
													{"DJ":"Djibouti"},
													{"DM":"Dominica"},
													{"DO":"Dominican Republic"},
													{"TP":"East Timor"},
													{"EC":"Ecudaor"},
													{"EG":"Egypt"},
													{"SV":"El Salvador"},
													{"GQ":"Equatorial Guinea"},
													{"ER":"Eritrea"},
													{"EE":"Estonia"},
													{"ET":"Ethiopia"},
													{"FK":"Falkland Islands (Malvinas)"},
													{"FO":"Faroe Islands"},
													{"FJ":"Fiji"},
													{"FI":"Finland"},
													{"FR":"France"},
													{"FX":"France, Metropolitan"},
													{"GF":"French Guiana"},
													{"PF":"French Polynesia"},
													{"TF":"French Southern Territories"},
													{"GA":"Gabon"},
													{"GM":"Gambia"},
													{"GE":"Georgia"},
													{"DE":"Germany"},
													{"GH":"Ghana"},
													{"GI":"Gibraltar"},
													{"GR":"Greece"},
													{"GL":"Greenland"},
													{"GD":"Grenada"},
													{"GP":"Guadeloupe"},
													{"GU":"Guam"},
													{"GT":"Guatemala"},
													{"GN":"Guinea"},
													{"GW":"Guinea-Bissau"},
													{"GY":"Guyana"},
													{"HT":"Haiti"},
													{"HM":"Heard and Mc Donald Islands"},
													{"HN":"Honduras"},
													{"HK":"Hong Kong"},
													{"HU":"Hungary"},
													{"IS":"Iceland"},
													{"IN":"India"},
													{"ID":"Indonesia"},
													{"IR":"Iran (Islamic Republic of)"},
													{"IQ":"Iraq"},
													{"IE":"Ireland"},
													{"IL":"Israel"},
													{"IT":"Italy"},
													{"CI":"Ivory Coast"},
													{"JM":"Jamaica"},
													{"JO":"Jordan"},
													{"KZ":"Kazakhstan"},
													{"KE":"Kenya"},
													{"KI":"Kiribati"},
													{"KP":"Korea, Democratic People's Republic of"},
													{"KW":"Kuwait"},
													{"KG":"Kyrgyzstan"},
													{"LA":"Lao People's Democratic Republic"},
													{"LV":"Latvia"},
													{"LB":"Lebanon"},
													{"LS":"Lesotho"},
													{"LR":"Liberia"},
													{"LY":"Libyan Arab Jamahiriya"},
													{"LI":"Liechtenstein"},
													{"LT":"Lithuania"},
													{"LU":"Luxembourg"},
													{"MO":"Macau"},
													{"MK":"Macedonia"},
													{"MG":"Madagascar"},
													{"MW":"Malawi"},
													{"MY":"Malaysia"},
													{"MV":"Maldives"},
													{"ML":"Mali"},
													{"MT":"Malta"},
													{"MH":"Marshall Islands"},
													{"MQ":"Martinique"},
													{"MR":"Mauritania"},
													{"MU":"Mauritius"},
													{"TY":"Mayotte"},
													{"MX":"Mexico"},
													{"FM":"Micronesia, Federated States of"},
													{"MD":"Moldova, Republic of"},
													{"MC":"Monaco"},
													{"MN":"Mongolia"},
													{"MS":"Montserrat"},
													{"MA":"Morocco"},
													{"MZ":"Mozambique"},
													{"MM":"Myanmar"},
													{"NA":"Namibia"},
													{"NR":"Nauru"},
													{"NP":"Nepal"},
													{"NL":"Netherlands"},
													{"AN":"Netherlands Antilles"},
													{"NC":"New Caledonia"},
													{"NI":"Nicaragua"},
													{"NE":"Niger"},
													{"NG":"Nigeria"},
													{"NU":"Niue"},
													{"NF":"Norfork Island"},
													{"MP":"Northern Mariana Islands"},
													{"NO":"Norway"},
													{"OM":"Oman"},
													{"PK":"Pakistan"},
													{"PW":"Palau"},
													{"PA":"Panama"},
													{"PG":"Papua New Guinea"},
													{"PY":"Paraguay"},
													{"PE":"Peru"},
													{"PH":"Philippines"},
													{"PN":"Pitcairn"},
													{"PL":"Poland"},
													{"PT":"Portugal"},
													{"PR":"Puerto Rico"},
													{"QA":"Qatar"},
													{"RE":"Reunion"},
													{"RO":"Romania"},
													{"RU":"Russian Federation"},
													{"RW":"Rwanda"},
													{"KN":"Saint Kitts and Nevis"},
													{"LC":"Saint Lucia"},
													{"VC":"Saint Vincent and the Grenadines"},
													{"WS":"Samoa"},
													{"SM":"San Marino"},
													{"ST":"Sao Tome and Principe"},
													{"SA":"Saudi Arabia"},
													{"SN":"Senegal"},
													{"SC":"Seychelles"},
													{"SL":"Sierra Leone"},
													{"SG":"Singapore"},
													{"SK":"Slovakia"},
													{"SI":"Slovenia"},
													{"SB":"Solomon Islands"},
													{"SO":"Somalia"},
													{"ZA":"South Africa"},
													{"GS":"South Georgia South Sandwich Islands"},
													{"ES":"Spain"},
													{"LK":"Sri Lanka"},
													{"SH":"St. Helena"},
													{"PM":"St. Pierre and Miquelon"},
													{"SD":"Sudan"},
													{"SR":"Suriname"},
													{"SJ":"Svalbarn and Jan Mayen Islands"},
													{"SZ":"Swaziland"},
													{"SE":"Sweden"},
													{"CH":"Switzerland"},
													{"SY":"Syrian Arab Republic"},
													{"TW":"Taiwan"},
													{"TJ":"Tajikistan"},
													{"TZ":"Tanzania, United Republic of"},
													{"TH":"Thailand"},
													{"TG":"Togo"},
													{"TK":"Tokelau"},
													{"TO":"Tonga"},
													{"TT":"Trinidad and Tobago"},
													{"TN":"Tunisia"},
													{"TR":"Turkey"},
													{"TM":"Turkmenistan"},
													{"TC":"Turks and Caicos Islands"},
													{"TV":"Tuvalu"},
													{"UG":"Uganda"},
													{"UA":"Ukraine"},
													{"AE":"United Arab Emirates"},
													{"UY":"Uruguay"},
													{"UZ":"Uzbekistan"},
													{"VU":"Vanuatu"},
													{"VA":"Vatican City State"},
													{"VE":"Venezuela"},
													{"VN":"Vietnam"},
													{"VG":"Virigan Islands (British)"},
													{"VI":"Virgin Islands (U.S.)"},
													{"WF":"Wallis and Futuna Islands"},
													{"EH":"Western Sahara"},
													{"YE":"Yemen"},
													{"YU":"Yugoslavia"},
													{"ZR":"Zaire"},
													{"ZM":"Zambia"},
													{"ZW":"Zimbabwe"}];
	}
}