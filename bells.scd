(
 SynthDef(\bells, {
	arg outBus = 0, scale;

	var specs, freqs, amps, rings, pan, out, env,
	numRes = 5, bells = 20;
	env = EnvGen.kr(Env.new([0, 1], [9]));

	out = Mix.fill(bells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(scale.choose)});
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

~scale = [48, 60, 62, 64, 67, 69];
~scale2 = ~scale - 6;
~scale3 = ~scale - 18;
~bells = Synth(\bells, [scale: ~scale])
~bells.free;
~bells2 = Synth(\bells, [scale: ~scale2])
~bells3 = Synth(\bells, [scale: ~scale3])
