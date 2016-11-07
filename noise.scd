(
  SynthDef(\wind, {
    arg freq = 380, mul = 1, outBus = 0;
    var env = EnvGen.kr(Env.new([0, 1], [9]));
    var out = BPF.ar(BrownNoise.ar(0.1.dup), freq, 0.2);
    out = out * env * mul;
    Out.ar(outBus, out);
  }).add;
)

~wind = Synth(\wind, [\mul, 0.7]);
