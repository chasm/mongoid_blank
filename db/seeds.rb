Design.destroy_all

e1 = Expectation.new(
  behavior: "Be cool."
)

e2 = Expectation.new(
  behavior: "Don't be a fool."
)

e3 = Expectation.new(
  behavior: "Stay in school."
)

p1 = Period.new(
  name: "First Period",
  activity: "Goofing off",
  starts_at: "09:30",
  ends_at: "11:00",
  expectations: [e1, e2, e3]
)

p2 = Period.new(
  name: "Second Period",
  activity: "Getting ready",
  starts_at: "11:15",
  ends_at: "12:30",
  expectations: [e1, e2, e3]
)

p3 = Period.new(
  name: "Third Period",
  activity: "Doing something",
  starts_at: "14:00",
  ends_at: "17:30",
  expectations: [e1, e2, e3]
)

f1 = Design.create(
  title: "Fun and Games",
  periods: [p1, p2, p3]
)

p4 = Period.new(
  name: "Period 1",
  activity: "Running in circles",
  starts_at: "09:30",
  ends_at: "12:30",
  expectations: [e1, e2, e3]
)

p5 = Period.new(
  name: "Period B",
  activity: "Doing back flips",
  starts_at: "14:00",
  ends_at: "17:30",
  expectations: [e1, e2, e3]
)

f2 = Design.create(
  title: "Them Crazy Kids",
  periods: [p4, p5]
)