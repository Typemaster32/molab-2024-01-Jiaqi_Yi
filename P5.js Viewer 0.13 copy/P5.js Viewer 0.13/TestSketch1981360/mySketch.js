t = f = 0
draw =_=> {
  f++ || (createCanvas(1280, 720), noFill(), strokeWeight(.2))
  background("")
	t += .01
  f = .01
  for (i = 628; i--; )
    arc(
      640 + 160 * sin(t + i * f),
      360 + 160 * cos(t + i * f),
      a = 90 + 87 * sin(19.7 * sin(t) * sin(i * f)),
      a,
      0,
      6.28 
		);
}