# EnrollHelper
Because when need to enroll/arrange new sem class. Always fuck me up because the time will clash. So i want to an app to help me arrange class.
I use flutter because i want to learn flutter, i know c# is more easy to do these logical shit.
New to flutter. Hope can done this shit. (ง •_•)ง

Basic idea:
  - input class related data.
    - can put it to essentail, not essential, 2,3,4... choose 1 shit to have more dynamic arrange.
  - can save class related data into phone.
  - generate possible schedule.
    - can show in different view, such as:
      - list
      - time table
  - mark specific schedule to wished list.
  - compare time table (2 table stack together)
  - maybe can export?

reminder:
  reminder
    - table can change name by click table name in output page
  design shit:
    - put card/ surface container/ sheet to sepearate part
  db:
    - user
      - id
      - name
      - picture
    - class
      - id
      - class type
      - class code
      - date time
    - input
      - id
      - lecture code
      - lecture name
      - class (id, array)
      - connected (just array of id e.x: id 1(lecture),3(tutor) need to take together)
      - deleted (bool)
    - output
      - id
      - favour (will save in love list)
      - fovour datetime (time click save in love list)
      - class(id, array)
      - feature (late until x.xxpm, have break between each class, 3,4 day only, 之类)

User manual for flutter mobx:
https://github.com/Oskang09/flutter_mobx_cb/blob/master/README.md
