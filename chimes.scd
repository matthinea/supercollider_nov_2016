~chimesAmp = Bus.control(s, 1);
(
w = Window("Chimes Ampitude", Rect(750, 450, 500, 200))
.front
.alwaysOnTop_(true);
StaticText(w, Rect(180, 20, 150, 30)).string_("");
~slider1 = Slider(w, Rect(20, 20, 150, 30)).background_(Color.rand)
.value_(0.01)
.action_({
	arg arg1;
	var newAmp;
	newAmp = arg1.value.linlin(0,1,0,1).postln;
	~chimesAmp.set(newAmp);
});
)

~sample = Buffer.read(s, "/Users/matthewhinea/supercollider/november/inspectorj__wind-chimes-a.wav");

// synth
(
  SynthDef(\playSample, {
    arg pSpeed;
    var mul = In.kr(~chimesAmp, 1);
    var outBus = 0;
    var susLevel = 0.6;
    var attackLvl = 0.01;
    var releaseTime = LFNoise0.kr(400, 1.4, 1.5);
    var startPos = LFNoise2.kr(500, 1, 0.0) * ~sample.numFrames;
    var gate = Line.kr(1, 0, 0.005);
    var env = Linen.kr(gate, attackLvl, susLevel, releaseTime, doneAction: 2);
    var panT= FSinOsc.kr(pSpeed);
    var playBuf = PlayBuf.ar(2, ~sample, 1, 1, startPos: startPos, doneAction: 2);
    Out.ar(outBus, Pan2.ar(playBuf, panT, env * mul));
    }).add
  )

// pattern
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
