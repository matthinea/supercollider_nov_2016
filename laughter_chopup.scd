~sample = Buffer.read(s, "/Users/matthewhinea/supercollider/buffer_files/inspectorj__wind-chimes-a.wav");

(
  SynthDef(\playSample, {
    var outBus = 0;
    /*var susLevel = LFNoise0.kr(40);*/
    var susLevel = 0.6;
    var releaseTime = LFNoise0.kr(40, 1, 0.1);
    var startPos = LFNoise2.kr(500, 1, 0.0) * ~sample.numFrames;
    var gate = Line.kr(1, 0, 0.005);
    var amp = Linen.kr(gate, 0.01, susLevel, releaseTime, 2);
    var playBuf = PlayBuf.ar(2, ~sample, 1, 1, startPos: startPos, doneAction: 2);
        playBuf = Pan2.ar(playBuf, LFNoise2.kr());
    Out.ar(outBus, playBuf * amp);
    }).add
  )

(
d = Pxrand(
  [10, 20, 30, 50, 80, 90, 120, 140, 150, 180, 200]/1000, inf).asStream;
t = Task({
	loop({
		x = Synth(\playSample);
    d.value.wait;
	});
});
t.start;
)
