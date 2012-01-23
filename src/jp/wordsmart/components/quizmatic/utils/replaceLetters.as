package jp.wordsmart.components.quizmatic.utils
{
	import utils.range.randomRangeInt;
	import utils.string.replace;

	public function replaceLetters(theText:String, numberLettersToReplace:int, replacementLetter:String):String
	{
		
		if(numberLettersToReplace<=0)return theText;
		var num_tries:int = theText.length;
		var changes_made:int = 0;
		for (var i:int = 0; i < 100; i++)
		{
		
		var start:int = 0;
		var end:int = theText.length-1;
		var randomNumber:int = randomRangeInt(start,end);
		if(changeLetter(randomNumber))
			{
			changes_made++;
			}
		if(changes_made == numberLettersToReplace)
		{
			return theText;
		}
		}
		function changeLetter(index:int):Boolean
		{
			var letterToChange:String = theText.charAt(index);
			trace("letterToChange "+letterToChange)
			if(letterToChange != " " && letterToChange != replacementLetter)
			{
				theText = theText.substr(0,index) + replacementLetter + theText.substr(index + 1);
				return true;
			}	
			return false;
		}
		
		
		return theText;
		
	}
	
}