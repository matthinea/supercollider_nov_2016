(
  ~score = Routine({
    "start wind".postln;
    ~windRoutine.next;
    nil.yield;

    "start dust".postln;
    ~dustRoutine.next;
    nil.yield;

    "next dust pitch".postln;
    ~dustRoutine.next;
    nil.yield;

    "start bells".postln;
    ~bells = Synth(\bells);
    nil.yield;

    "change bell and dust chord".postln;
    ~dustRoutine.next;
    ~bells.free;
    ~bells2 = Synth(\bells_2);
    nil.yield;

    "wind fade out".postln;
    loop {
      ~windRoutine.next;
    }
    })
  )

~score.next;
s.quit;
