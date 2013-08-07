Message.destroy_all
User.destroy_all

u1 = User.create(name: "Chas.", email: "chas@munat.com")

u2 = User.create(name: "Bono", email: "bono@u2.com")

t1 = Topic.create(
  topic: "Testing",
  content: "Let's test this mutha!",
  author: u1,
  recipient: u2
)

t1r1 = Reply.new(
  content: "Hell, yeah!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

t1.replies << t1r1

t1r1r1 = Reply.new(
  content: "Get on it!",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

t1r1.replies << t1r1r1

t1r1r2 = Reply.new(
  content: "Oh, noes!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

t1r1.replies << t1r1r2

t1r2 = Reply.new(
  content: "Wait! Maybe not.",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

t1.replies << t1r2

t1r2r1 = Reply.new(
  content: "Don't be a coward!",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

t1r2.replies << t1r2r1

t1r2r1r1 = Reply.new(
  content: "OK, fine!",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

t1r2r1.replies << t1r2r1r1



t2 = Topic.create(
  topic: "Lunch",
  content: "On second thought, let's go to lunch.",
  author: u2,
  recipient: u1
)

t2r1 = Reply.new(
  content: "How about that Thai restaurant on Santa Monica Boulevard?",
  user_id: u1._id,
  user_name: u1.name,
  user_email: u1.email
)

t2.replies << t2r1

t2r1r1 = Reply.new(
  content: "Deal.",
  user_id: u2._id,
  user_name: u2.name,
  user_email: u2.email
)

t2r1.replies << t2r1r1