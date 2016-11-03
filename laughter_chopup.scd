~sample = Buffer.read(s, "/Users/matthewhinea/supercollider/buffer_files/female_laughter.wav");
(
  SynthDef(\playSample, {
    var outBus = 0;
    var susLevel = LFNoise0.kr();
    var releaseTime = LFNoise0.kr();
    var startPos = LFNoise2.kr() * ~sample.numFrames;
    var gate = Line.kr(1, 0, 0.005);
    var amp = Linen.kr(gate, 0.01, susLevel, releaseTime, 2);
    var playBuf = PlayBuf.ar(2, ~sample, 1, 1, startPos: startPos, doneAction: 2);
    Out.ar(outBus, playBuf * amp);
    }).add
  )
~synths = 19.do{Synth(\playSample)}

~synths;

(10..200)/1000
// random sequence of durations
(
d = Pxrand(
  [10, 20, 30, 50, 80, 90, 120, 140, 150, 180, 200]/1000, inf).asStream;
w = Pxrand(
  [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1500, 2000]/100,
   inf).asStream;
t = Task({
	loop({
    var thisD = d.value;
		x = Synth(\playSample, [
      /*susLevel: 5,
      releaseTime: 10*/
      ]);
    thisD.wait;
	});
});
t.start;
)
