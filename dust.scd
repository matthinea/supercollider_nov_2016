(
  SynthDef(\dust, {
    arg freq = 220, rate, amp = 0.1, gate, ratioBus;
    var outBus = 0;
    var num = 3;
    var bwratio = In.kr(ratioBus, 1);
    var out;
    var env = EnvGen.kr(Env.asr(), gate);
    out = Mix.fill(num, { |i|
      Resonz.ar(Dust2.ar(rate), freq * (i + 1), bwratio, 100)
      });
    out = out * amp * env * num.reciprocal;
    Out.ar(outBus, out!2);
    }).add;
)

(
~dustRoutine = Routine({

  // 1
	x = Synth(\dust, [
      freq: 48.midicps,
      rate: 5,
      amp: 14,
      gate: 1,
      ratioBus: ~dustRatio
      ]);
  x.get(\freq, {arg f; f.postln});
	nil.yield; // hold indefinitely

  // 2
  y = Synth(\dust, [
    freq: 60.midicps,
    rate: 5,
    amp: 14,
    gate: 1,
    ratioBus: ~dustRatio
    ]);
  y.get(\freq, {arg f; f.postln});
  nil.yield;

  // 3
  x.release;
  y.release;
  nil.yield;

  // 4
	x = Synth(\dust, [
      freq: 44.midicps,
      rate: 5,
      amp: 14,
      gate: 1,
      ratioBus: ~dustRatio
      ]);
  x.get(\freq, {arg f; f.postln});
	nil.yield;

  // 5
  y = Synth(\dust, [
    freq: 56.midicps,
    rate: 5,
    amp: 14,
    gate: 1,
    ratioBus: ~dustRatio
    ]);
  y.get(\freq, {arg f; f.postln});
  nil.yield;

  // 6
  "releasing".postln;
	x.release;
  y.release;
  nil.yield;
});
)
