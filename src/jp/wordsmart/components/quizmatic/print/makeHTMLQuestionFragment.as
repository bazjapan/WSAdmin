package jp.wordsmart.components.quizmatic.print
{
	import jp.wordsmart.components.quizmatic.QMAnswer;
	import jp.wordsmart.components.quizmatic.QMQuestion;
	
	import utils.english.getAlphabet;
	import utils.html.div;
	import utils.html.p;
	import utils.text.doubleQuote;
	import utils.text.newLine;

	public function makeHTMLQuestionFragment(qmq:QMQuestion, questionText:String):String
		{
			var theText:String = '';
			theText+= div(p('Question ('+qmq.order+')  '+questionText),"question");
			theText+= newLine();
			theText+= newLine();
			theText+="<div class"+doubleQuote()+"answers"+doubleQuote()+">"+newLine();
			//multiple choice
			if(qmq.answers.length>1)
			{
			theText+="<ol>"+newLine();
			for (var i:int = 0; i < qmq.answers.length; i++)
			{
				var ans:QMAnswer = qmq.answers[i];
				theText+= "<li type= "+wrap("a")+" class ="+doubleQuote()+getCorrectAnswerClass(ans.correct)+doubleQuote()+" >"+ans.text+"</li>"+newLine();
				
			}
			theText+="</ol>"+newLine();
			}
			//single choice
			else if(qmq.answers.length==1)
			{
				var ans2:QMAnswer = qmq.answers[0];
				theText+= "<p  class ="+doubleQuote()+getCorrectAnswerClass(true)+doubleQuote()+" >"+ans2.text+"</p>"+newLine();
			}
			else
			{
				//????
			}
			theText+="</div>"+newLine();
			return theText;
			
			function getCorrectAnswerClass(correct:Boolean):String
			{
				if(correct)return "correct";
				return "incorrect";
			}
			
			function wrap(text:String):String
			{
			return doubleQuote()+text+doubleQuote();	
			}
			
		}
	
}