package jp.wordsmart.components.quizmatic.print
{
	import jp.wordsmart.components.quizmatic.QMAnswer;
	import jp.wordsmart.components.quizmatic.QMQuestion;
	
	import utils.english.getAlphabet;
	import utils.text.newLine;

	public function makePrintableQuestion(qmq:QMQuestion):String
	{
		var theText:String = '';
		theText+= 'Question ('+qmq.order+")  Listen and choose the best answer.";
		theText+= newLine();
		theText+= newLine();
		for (var i:int = 0; i < qmq.answers.length; i++)
		{
			var ans:QMAnswer = qmq.answers[i];
			theText+= getAlphabet()[i]+")  "+ans.text+newLine();
		
		}
		return theText;
	}
	
}