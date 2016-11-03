(
{
var scale, specs, freqs, amps, rings,
	numRes = 5, bells = 20, pan;
	scale = [48, 60, 62, 64, 67, 69].midicps;
	Mix.fill(bells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(scale.choose)});
		amps = Array.fill(numRes, {rrand(0.2, 0.9)});
		rings = Array.fill(numRes, {rrand(3.0, 6.0)});
		specs = [freqs, amps, rings].round(0.01);
		specs.postln;
		pan = (LFNoise0.kr(rrand(2, 3))*2).softclip;
		Pan2.ar(
			Klank.ar(`specs,
				Dust.ar(1/24, 0.08)),
				pan)
	})
}.play;
)


(
{
var scale, specs, freqs, amps, rings,
	numRes = 5, bells = 20, pan;
	scale = [48, 60, 62, 64, 67, 69].midicps;
	Mix.fill(bells, {
		freqs = Array.fill(numRes, {rrand(1, 3)*(scale.choose)});
		amps = Array.fill(numRes, {rrand(0.2, 0.9)});
		rings = Array.fill(numRes, {rrand(3.0, 6.0)});
		specs = [freqs, amps, rings].round(0.01);
		specs.postln;
		/*pan = (LFNoise0.kr(rrand(2, 3))*2).softclip;*/
    pan = 0;
		Pan2.ar(
			Klank.ar(`specs,
				Dust.ar(1/24, 0.08)),
				pan)
	})
}.play;
)
