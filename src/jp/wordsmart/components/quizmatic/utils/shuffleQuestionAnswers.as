package jp.wordsmart.components.quizmatic.utils
{
	import jp.wordsmart.components.quizmatic.QMQuestion;
	
	import utils.array.randomize;

	public function shuffleQuestionAnswers(qmq:QMQuestion):QMQuestion
	{
		var rand:Array = randomize(qmq.answers);
		qmq.answers = rand;
		return qmq;
	}
	
}