package jp.wordsmart.utils.audio
{
	import com.noteflight.standingwave3.elements.AudioDescriptor;
	import com.noteflight.standingwave3.elements.Sample;
	import com.noteflight.standingwave3.formats.WaveFile;
	import com.noteflight.standingwave3.performance.AudioPerformer;
	import com.noteflight.standingwave3.performance.ListPerformance;
	
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;

	public class ConvertToWAV
	{
		public function ConvertToWAV()
		{
		}
		/**
		 * 
		 * @param sourceData
		 * @param completeCallback returns encoded byte array
		 * @param progressFunction returns percentage done
		 * @param errorFunction NA
		 * 
		 */		
		public function convert(sourceData:ByteArray, completeCallback:Function, progressFunction:Function = null, errorFunction:Function= null):void
		{
			sourceData.position = 0;
			var myWavFile:ByteArray = new ByteArray;//final output;
			var myWavData:ByteArray = new ByteArray;//container to write to;
			var src:Sample = WaveFile.createSample(sourceData) // this is fine
			var sequence:ListPerformance = new ListPerformance()
			sequence.addSourceAt(0, src)
			var ap:AudioPerformer = new AudioPerformer(sequence, new AudioDescriptor())
			renderWav(ap,completeCallback, progressFunction);
			function renderWav(src:AudioPerformer, callback:Function, progressCallback:Function):void
			{
				var innerTimer:Timer = new Timer(10,0)
				var framesPerChunk:uint = 8192;
				
				innerTimer.addEventListener(TimerEvent.TIMER, handleRenderTimer)
				innerTimer.start()
				
				function handleRenderTimer(e:TimerEvent):void
				{
					src.getSample(framesPerChunk).writeWavBytes(myWavData)
					
					var m:Number = Math.min(src.frameCount, src.position + framesPerChunk)
					var n:Number = Math.max(0, m - src.position)
					
					if (n == 0)
					{
						if (src.position > 0) finishRender() else trace("cancel rendering")
						
					} else {
						var perc:Number = Math.floor(src.position * 100 / src.frameCount);
						progressCallback(perc);
					}
				}				
				function finishRender():void
				{
					innerTimer.stop();
					WaveFile.writeBytesToWavFile(myWavFile, myWavData, 44100, 2, 16);
					callback(myWavFile);
					
					
				}			
			};
		}
	}
}