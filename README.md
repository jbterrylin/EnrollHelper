# EnrollHelper
Because when need to enroll/arrange new sem class. Always fuck me up because the time will crash. So i want to create an app to help me arrange class.
I use flutter because i want to learn flutter, i know c# is more easy to do these logical shit.
New to flutter. Hope can done this shit. (ง •_•)ง

flutter packages pub run build_runner build

before done need do:
  - connected cannot 1 - 1, 2 - 2 (same class name)
  - cant accept same subject name
  - arrange subject (have favour time on upside, then arrange by time late)

Basic idea:
  - input class related data.
    - can put it to essentail, not essential, 2,3,4... choose 1 shit to have more dynamic arrange.
  - can save class related data into phone.
  - generate possible schedule.
    - can mark essential class or eclective
    - pick the feature of schedule, but still generate all, but feature that fit user want will show in fronter
      - feature:
        - sembahyang time
        - lunch mummy boi
        - fuck lunch gv me 8 hour straight
        - 4 day pls
        - 3 day pls
        - study, break, study, break
        - back home early
        - back kampung early
        - no 早操
        - 早操boi
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