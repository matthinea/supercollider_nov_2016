s.boot;

(
  SynthDef(\wind, {
    arg freq = 380, mul = 1, outBus = 0;
    var env = EnvGen.kr(Env.new([0, 1], [9]));
    var out = BPF.ar(BrownNoise.ar(0.1.dup), freq, 0.2);
    out = out * env * mul;
    Out.ar(outBus, out);
  }).add;
)

// decreases wind vol each call to 'next'
(
  ~windRoutine = Routine({
    ~wind = Synth(\wind, [\mul, 0.7]);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.65);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.6);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.55);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.5);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.45);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.4);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.35);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.3);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.25);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.2);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.15);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.1);
    ~wind.get(\mul, {arg m; m.postln; });
    nil.yield;
    ~wind.set(\mul, 0.05);
    ~wind.get(\mul, {arg m; m.postln; });
    "final yield before release".postln;
    nil.yield;
    ~wind.free;
  })
)
