~sample = Buffer.read(s, "/Users/matthewhinea/supercollider/buffer_files/inspectorj__wind-chimes-a.wav");

(
  SynthDef(\playSample, {
    arg pSpeed;
    var outBus = 0;
    /*var susLevel = LFNoise0.kr(40);*/
    var susLevel = 0.6;
    var releaseTime = LFNoise0.kr(400, 1.4, 1.5);
    var startPos = LFNoise2.kr(500, 1, 0.0) * ~sample.numFrames;
    var gate = Line.kr(1, 0, 0.005);
    var amp = Linen.kr(gate, 0.01, susLevel, releaseTime, 2);
    var panT= FSinOsc.kr(pSpeed);
    var playBuf = PlayBuf.ar(2, ~sample, 1, 1, startPos: startPos, doneAction: 2);
    Out.ar(outBus, Pan2.ar(playBuf, panT, amp));
    }).add
  )


// consider refactoring for bursts of chimes

(
~durations = Array.fill(18, {|i| i * 10 / 1000});
d = Pxrand(
  ~durations, inf).asStream;
t = Task({
	loop({
		x = Synth(\playSample);
    d.value.wait;
	});
});
t.start;
)

Pbind(\instrument, \playSample, \buf, ~sample, \dur, Pseq([Pseries(0.01, 1.1707, 20), Pgeom(0.01, 0.93, 20)], 1), \rel, 1.9, \pSpeed, 0.9).play;
