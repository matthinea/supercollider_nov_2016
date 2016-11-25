(
  SynthDef(\dustIntro, {
    arg freq = 220, rate, amp = 0.1, gate, ctrlBus = ~dustCtrlBus;
    var outBus = 0;
    var num = 3;
    var bwratio = In.kr(ctrlBus, 1);
    var out;
    var env = EnvGen.kr(Env.new([0, 1], [0.1]), gate);
    out = Mix.fill(num, { |i|
      Resonz.ar(Dust2.ar(rate), freq * (i + 1), bwratio, 100)
      });
    out = out * amp * num.reciprocal;
    Out.ar(outBus, out!2);
    }).add;
)

(
r = Routine({
  // 1

	x = Synth(\dustIntro, [
      freq: 48.midicps,
      rate: 5,
      amp: 14,
      gate: 1
      ]);
	nil.yield; // hold indefinitely

	// 2
  x.release;
  nil.yield;

	y = Synth(\dustIntro, [
      freq: 60.midicps,
      rate: 5,
      amp: 4,
      gate: 1
      ]);
	nil.yield;


	y.release;
  nil.yield;
});
)
r.next;
