s.boot;

(
~bellsAmp = Bus.control(s, 1);
~dustRatio = Bus.control(s, 1);
)

(
w = Window(bounds: Rect(750, 450, 550, 200))
.front
.alwaysOnTop_(true);
StaticText(w, Rect(420, 20, 150, 30)).string_("Bells");
Slider(w, Rect(20, 20, 380, 30)).background_(Color.rand)
.value_(0.01)
.action_({
	arg arg1;
	var newAmp;
	newAmp = arg1.value.linlin(0,1,0,1).postln;
	~bellsAmp.set(newAmp);
});
StaticText(w, Rect(420, 80, 150, 30)).string_("Dust Bandwidth");
Slider(w, Rect(20, 80, 380, 30)).background_(Color.rand)
.value_(0.0001)
.action_({
	arg newVal;
	var scaledVal = newVal.value.linlin(0,1,0.0001, 0.0009);
  scaledVal.postln;
	~dustRatio.set(scaledVal);
});
)
