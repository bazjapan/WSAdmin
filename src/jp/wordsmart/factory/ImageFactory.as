package jp.wordsmart.factory
{
	import com.adobe.net.MimeTypeMap;
	
	import jp.wordsmart.WordSmartConstants;
	import jp.wordsmart.dto.WSImage;
	
	import utils.date.now;
	import utils.timestamp.dateToTimeStampUTC;

	public class ImageFactory
	{
		public function ImageFactory()
		{
		}
		
		public function getInstance(url:String,origUrl:String, 
									thumbURl:String, 
									title:String, 
									size:String, 
									fileName:String, 
									isLocal:int, 
									fileExt:String, 
									tags:String, 
									copyright:String = '',
									refererurl:String = '',
									width:String = '0',
									height:String = '0',
									thumbnail_width:String ='0',
									thumbnail_height:String ='0',
									content:String = ''):WSImage
		{
			var image:WSImage = new WSImage()
			image.date_added = dateToTimeStampUTC(now());
			image.title = title;
			image.url = url;
			image.thumbnail_url = image.url;
			image.size = size;
			image.filename = fileName;
			image.isLocal = isLocal;
			image.mimetype = new MimeTypeMap().getMimeType(fileExt);
			image.copyright = copyright;
			image.image_tags = tags
			image.orig_url = origUrl;
			image.refererurl = refererurl;
			image.width = width;
			image.height = height;
			image.width = width;
			image.thumbnail_width = thumbnail_width;
			image.thumbnail_height = thumbnail_height;
			image.content = content;
			
			return image;
		}
	}
}