~dustCtrlBus = Bus.control(s, 1);
~dustCtrlBus.set(0.0001);

(
w = Window.new("Dust BWRatio", Rect(400, 400, 200, 300)).front;
Slider(w)
.value_(0.0001)
.action_({
	arg newVal;
	var scaledVal = newVal.value.linlin(0,1,0.0001, 0.0009);
  scaledVal.postln;
	~dustCtrlBus.set(scaledVal);
});
)
