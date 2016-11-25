~scale = [48, 60, 62, 64, 67, 69];

s.boot;
(
 SynthDef(\bells, {
	arg outBus = 0, scale = ~scale;

	var specs, freqs, amps, rings, pan, out, env,
	numRes = 5, bells = 20;
	env = EnvGen.kr(Env.new([0, 1], [9]));

	out = Mix.fill(bells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(~scale.choose.midicps)});
		amps = Array.fill(numRes, {rrand(0.2, 0.9)});
		rings = Array.fill(numRes, {rrand(3.0, 6.0)});
		specs = [freqs, amps, rings].round(0.01);
		specs.postln;
		pan = (LFNoise0.kr(rrand(2, 3))*2).softclip;
		Pan2.ar(
			Klank.ar(`specs,
				Dust.ar(1/24, 0.14)),
				pan)
	});
	out = out * env;
	Out.ar(outBus, out);
	}).add
)

~bells = Synth(\bells, [scale: ~scale])
~bells.set(\mul, 1);
~bells.free;
