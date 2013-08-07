Discussion.destroy_all
User.destroy_all

u1 = User.create(name: "Chas.", email: "chas@munat.com")

u2 = User.create(name: "Bono", email: "bono@u2.com")

d1 = Discussion.create(
  topic: "Testing",
  content: "Let's test this mutha!",
  author: u1,
  recipient: u2
)

d1r1 = Reply.new(
  content: "Hell, yeah!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

d1.replies << d1r1

d1r1r1 = Reply.new(
  content: "Get on it!",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

d1r1.replies << d1r1r1

d1r1r2 = Reply.new(
  content: "Oh, noes!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

d1r1.replies << d1r1r2

d1r2 = Reply.new(
  content: "Wait! Maybe not.",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

d1.replies << d1r2

d1r2r1 = Reply.new(
  content: "Don't be a coward!",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

d1r2.replies << d1r2r1

d1r2r1r1 = Reply.new(
  content: "OK, fine!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

d1r2r1.replies << d1r2r1r1



d2 = Discussion.create(
  topic: "Lunch",
  content: "On second thought, let's go to lunch.",
  author: u2,
  recipient: u1
)

d2r1 = Reply.new(
  content: "How about that Thai restaurant on Santa Monica Boulevard?",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

d2.replies << d2r1

d2r1r1 = Reply.new(
  content: "Deal.",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

d2r1.replies << d2r1r1