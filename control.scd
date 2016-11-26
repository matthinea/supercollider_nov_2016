
(
~bellsAmp = Bus.control(s, 1);
~dustRatio = Bus.control(s, 1);
)

(
w = Window(bounds: Rect(1000, 450, 200, 550))
.front
.alwaysOnTop_(true);
StaticText(w, Rect(20, 20, 150, 30)).string_("Bells");
Slider(w, Rect(20, 60, 30, 380)).background_(Color.rand)
.value_(0.01)
.action_({
	arg arg1;
	var newAmp;
	newAmp = arg1.value.linlin(0,1,0,1.5).postln;
	~bellsAmp.set(newAmp);
});
StaticText(w, Rect(80, 20, 150, 30)).string_("Dust Bandwidth");
Slider(w, Rect(80, 60, 30, 380)).background_(Color.rand)
.value_(0.0001)
.action_({
	arg newVal;
	var scaledVal = newVal.value.linlin(0,1,0.0001, 0.002);
  scaledVal.postln;
	~dustRatio.set(scaledVal);
});
)
