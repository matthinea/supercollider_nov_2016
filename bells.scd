
~scale = [48, 60, 62, 64, 67, 69];

(
 SynthDef(\bells, {
	arg outBus = 0;

	var specs, freqs, amps, rings, pan, out, env, scale,
  numRes, numBells, mul;

  mul = In.kr(~bellsAmp);
	numRes = 5;
  numBells = 20;
  scale = ~scale;
	env = EnvGen.kr(Env.new([0, 1], [9]));

	out = Mix.fill(numBells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(scale.choose.midicps)});
		amps = Array.fill(numRes, {rrand(0.2, 0.9)});
		rings = Array.fill(numRes, {rrand(3.0, 6.0)});
		specs = [freqs, amps, rings].round(0.01);
		/*specs.postln;*/
		pan = (LFNoise0.kr(rrand(2, 3))*2).softclip;
		Pan2.ar(
			Klank.ar(`specs,
				Dust.ar(1/24, 0.14)),
				pan)
	});
	out = out * env;
	Out.ar(outBus, out * mul);
	}).add
)

( // same as 'bells' synth but lower scale
 SynthDef(\bells_2, {
	arg outBus = 0;

	var specs, freqs, amps, rings, pan, out, env, scale,
  numRes, numBells, mul;

  mul = In.kr(~bellsAmp);
	numRes = 5;
  numBells = 20;
  scale = ~scale - 4;
	env = EnvGen.kr(Env.new([0, 1], [9]));

	out = Mix.fill(numBells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(scale.choose.midicps)});
		amps = Array.fill(numRes, {rrand(0.2, 0.9)});
		rings = Array.fill(numRes, {rrand(3.0, 6.0)});
		specs = [freqs, amps, rings].round(0.01);
		/*specs.postln;*/
		pan = (LFNoise0.kr(rrand(2, 3))*2).softclip;
		Pan2.ar(
			Klank.ar(`specs,
				Dust.ar(1/24, 0.14)),
				pan)
	});
	out = out * env;
	Out.ar(outBus, out * mul);
	}).add
)
