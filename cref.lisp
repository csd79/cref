(in-package :cref)


;;; ---------------------------------------------------------------


(defparameter *illetmeny*
  '(
    (:havi-ill-gyakornok
     ((:b2) () () "Havi illetmény - Gyakornok")
;     (:tv "1puetv" :par "98" :bek "2")
     (:tv "1puetv" :par "98" :bek "1")
     (:tv "2puetv-vhr" :par "88" :bek "1"))

    (:havi-ill-ped1-kutato
     ((:b2) () () "Havi illetmény - Pedagógus I. - Kutatótanár")
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88/A" :bek "1"))

    (:mesterfok-illnov
     ((:b2 :b8) () () "Mesterfokozatért járó illetménynövekedés")
     (:tv "2puetv-vhr" :par "95/A" :bek "1"))

    (:egyes-tantrgy-illnov
     ((:b2) () () "Egyes tantárgyak után járó illetménynövekedés")
     (:tv "2puetv-vhr" :par "95/A" :bek "2")
     (:tv "2puetv-vhr" :par "95/A" :bek "4"))

    (:eselyteremt-illr-terulet
     ((:b2) () () "Területi alapon járó esélyteremtési illetményrész")
     (:tv "1puetv" :par "98" :bek "5" :pont "a")
     (:tv "2puetv-vhr" :par "88" :bek "3")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "6")
;     (:tv "2puetv-vhr" :par "131" :bek "4")
     )

    (:eselyteremt-illr-feladat
     ((:b2) () () "Feladatalapon járó esélyteremtési illetményrész")
     (:tv "1puetv" :par "98" :bek "5" :pont "b")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "5")
     (:tv "2puetv-vhr" :par "88" :bek "6")
;     (:tv "2puetv-vhr" :par "131" :bek "4")
     )

    (:gyogyped-potl
     ((:b2 :b8 :b9) () () "Gyógypedagógiai pótlék")
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr" :par "90" :bek "3")
     (:tv "2puetv-vhr" :par "90" :bek "4a"))

    (:diabetesz-ellat
     ((:b2 :b8 :b9) () () "Diabétesz ellátási pótlék")
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr"  :par "90" :bek "4")
     (:tv "3koznev-2011-cxc" :par "62" :bek "1b"))

    (:nemzetisegi-potl
     ((:b2) () () "Nemzetiségi pótlék")
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr" :par "90" :bek "2")
     (:tv "2puetv-vhr" :par "90" :bek "4a"))

    (:aj-thgond-prg
     ((:b2) () () "Arany János Tehetséggondozó Program pótléka")
     (:tv "2puetv-vhr" :par "90" :bek "7")
     (:tv "4emmi-20-2012-viii31" :par "176" :bek "8"))

    (:ofo-megbiz
     ((:b2) () () "Osztályfõnöki megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90"  :bek "6")
     (:tv "2puetv-vhr" :par "90"  :bek "6a"))

    (:koll-csopvez
     ((:b2) () () "Kollégiumi csoportvezetõi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:tanszakvez
     ((:b2) () () "Tanszakvezetõi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:mkkoz-vez
     ((:b2) () () "Munkaközösség-vezetõi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "c")
     (:tv "2puetv-vhr" :par "90" :bek "5")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:ig
     ((:b2) () () "Igazgatói megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2"))
    
    (:foig
     ((:b2) () () "Fõigazgatói megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2"))
    
    (:ig-h
     ((:b2) () () "Igazgató-helyettesi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "a"))
    
    (:foig-h
     ((:b2) () () "Fõigazgató-helyettesi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2" :pont "a"))
    
    (:tagint-ig
     ((:b2) () () "Tagintézmény-igazgatói megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "4"))
    
    (:integys-vez
     ((:b2) () () "Intézményegység-vezetõi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "4"))
    
    (:tagint-ig-h
     ((:b2) () () "Tagintézményigazgató-helyettesi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "5"))
    
    (:integys-vez-h
     ((:b2) () () "Intézményegységvezetõ-helyettesi megbízási díj")
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "5"))
  
    (:pnoks-havi-ill-gyakornok
     ((:b8) () () "Havi illetmény - Gyakornok")
     (:tv "1puetv" :par "96" :bek "1")
     (:tv "1puetv" :par "96" :bek "2" :pont "a")
;     (:tv "1puetv" :par "98" :bek "2")
     (:tv "1puetv" :par "98" :bek "1")
     (:tv "2puetv-vhr" :par "88" :bek "1"))
    
    (:havi-ill-ped1-2
     ((:b8) () () "Havi illetmény - Pedagógus I. - II.")
     (:tv "1puetv" :par "96" :bek "1")
     (:tv "1puetv" :par "96" :bek "2" :pont "a")
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88/A" :bek "1"))
    
    (:pnoks-noks-eselyt-illr
     ((:b8 :b9) () () "Esélyteremtési illetményrész")
     (:tv "1puetv" :par "99" :bek "2")
     (:tv "1puetv" :par "98" :bek "5" :pont "a")
     (:tv "2puetv-vhr" :par "88" :bek "3")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "6")
;     (:tv "2puetv-vhr" :par "131" :bek "4")
     )
    
    (:pnoks-noks-aj-thgond-prg
     ((:b8 :b9) () () "Arany János Tehetséggondozó Program pótléka")
     (:tv "2puetv-vhr" :par "90" :bek "7")
     (:tv "4emmi-20-2012-viii31" :par "176" :bek "8" :megj "A jogszabályi rendelkezések a pedagógusokra vonatkoznak."))
  
    (:noks-havi-ill
     ((:b9) () () "Havi illetmény")
     (:tv "1puetv" :par "96" :bek "2" :pont "b")
     (:tv "1puetv" :par "99" :bek "1")
     (:tv "2puetv-vhr" :par "88" :bek "7")
     (:tv "2puetv-vhr" :par "95" :bek "1"))

    (:mt-munkaber
     ((:b1) () () "Munkabér")
     ())

    ))
;; Do I need those embedded '(:bx) () ()' things?


(defparameter *illetmeny-map*
  '(
    (:havi-ill-gyakornok       (:b2)         (1)       ("1P00") ())
    (:havi-ill-ped1-kutato     (:b2)         (2 3 4 5) ("1P00") ())
    (:mesterfok-illnov         (:b2 :b8)     ()        ("1116") ())
    (:egyes-tantrgy-illnov     (:b2)         ()        ("1114") ())
    (:eselyteremt-illr-terulet (:b2)         ()        ("1115") (1))
    (:eselyteremt-illr-feladat (:b2)         ()        ("1115") (2))
    (:gyogyped-potl            (:b2 :b8 :b9) ()        ("2587") ())
    (:diabetesz-ellat          (:b2 :b8 :b9) ()        ("2598") ())
    (:nemzetisegi-potl         (:b2)         ()        ("2800") ())
    (:aj-thgond-prg            (:b2)         ()        ("2586") ())
    (:ofo-megbiz               (:b2)         ()        ("2034") ())
    (:koll-csopvez             (:b2)         ()        ("2035") ())
    (:tanszakvez               (:b2)         ()        ("2036") ())
    (:mkkoz-vez                (:b2)         ()        ("2037") ())
    (:ig                       (:b2)         ()        ("2028") ())
    (:foig                     (:b2)         ()        ("2026") ())
    (:ig-h                     (:b2)         ()        ("2029") ())
    (:foig-h                   (:b2)         ()        ("2027") ())
    (:tagint-ig                (:b2)         ()        ("2030") ())
    (:integys-vez              (:b2)         ()        ("2031") ())
    (:tagint-ig-h              (:b2)         ()        ("2032") ())
    (:integys-vez-h            (:b2)         ()        ("2033") ())
    (:pnoks-havi-ill-gyakornok (:b8)         ()        ("1P00") ())
    (:havi-ill-ped1-2          (:b8)         ()        ("1P00") ())
    (:pnoks-noks-eselyt-illr   (:b8 :b9)     ()        ("1115") ())
    (:pnoks-noks-aj-thgond-prg (:b8 :b9)     ()        ("2586") ())
    (:noks-havi-ill            (:b9)         ()        ("1P00") ())
    (:mt-munkaber              (:b1)         ()        ("1100") ())
    ))


(defparameter *roles*
  '((:b1 "B1")
    (:b2 "B2")
    (:b8 "B8")
    (:b9 "B9")))


(defparameter *groups*
  '((01 "Gyakornok")
    (02 "Pedagógus I.")
    (03 "Pedagógus II.")
    (04 "Mesterpedagógus")
    (05 "Kutatótanár")))

(defparameter *pluses*
  '((1 "Kedvezményezett vagy felzárkózó településen történõ feladatellátás")
    (2 "IPR-program keretébe tartozó feladatellátás")))


(defparameter *tv*
  '(("1puetv"
     "Púétv."
     "pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.)")
    ("2puetv-vhr"
     "Púétv. vhr."
     "pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.)")
    ("3koznev-2011-cxc"
     "???"
     "nemzeti köznevelésrõl szóló 2011. évi CXC. törvény")
    ("4emmi-20-2012-viii31"
     "???"
     "nevelési-oktatási intézmények mûködésérõl és a köznevelési intézmények névhasználatáról szóló 20/2012. (VIII. 31.) EMMI rendelet"
     )))


(defparameter *fully-defined-tvs* '())


;;; ---------------------------------------------------------------


(defun fee-by-key (key list)
  (let ((pos (position key list :key #'first)))
    (if pos
      (let ((result (nth pos list)))
        (values (cddr result)
                (first result)
                (second result)))
      (error "Nem definiált bérelem: ~a" key))))


(defun collect-fees (keys list)
  (let ((result '()))
    (dolist (key keys)
      (push (fee-by-key key list)
            result))
    (apply #'append
           (nreverse
            (remove nil result)))))


(defun filter-fees (&key (role nil) (group nil) (code nil) (plus nil))
  (let ((results '()))
    (dolist (fee *illetmeny-map*)
      (destructuring-bind (key roles groups codes pluses)
          fee
        (when
            (and
             (or (null roles)  (member role  roles))
             (or (null groups) (member group groups))
             (or (null codes)  (member code  codes :test #'equalp))
             (or (null pluses) (member plus  pluses)))
          (push key results))))
    (nreverse results)))
#|
    (setf results (nreverse results))
    (or results
        (error "Nem definiált bérelem ~a a következõ csoporthoz: ~a, ~a, ~a," code role group plus))))
|#


(defun fees (&key (role nil) (group nil) (codes '()) (plus nil))
  (apply #'append
         (mapcar #'(lambda (code)
                     (filter-fees :role role :group group
                                  :code code :plus plus))
                 codes)))


;;; ---------------------------------------------------------------


(defun plist-equalp (plist1 plist2)
  (flet ((p1-covers-p2-p (p1 p2)
           (loop for (key val) on p1 by #'cddr
                 always (equalp (getf p2 key) val))))
    (and (p1-covers-p2-p plist1 plist2)
         (p1-covers-p2-p plist2 plist1))))


(defun decons-parbek (parbek)
  (destructuring-bind (main sub)
      (multiple-value-bind (full subs)
          (cl-ppcre:scan-to-strings "(\\d*)/*(\\D*)" parbek)
        (declare (ignore full))
        (coerce subs 'list))
    (values
     (read-from-string main)
     sub)))


(defmacro parbek (pb1 pb2 pb1-main pb1-sub pb2-main pb2-sub &body body)
  `(multiple-value-bind (,pb1-main ,pb1-sub)
      (decons-parbek ,pb1)
    (multiple-value-bind (,pb2-main ,pb2-sub)
        (decons-parbek ,pb2)
      ,@body)))


(defun parbek< (pb1 pb2)
  (parbek pb1 pb2 pb1m pb1s pb2m pb2s
      (or (< pb1m pb2m)
          (and (= pb1m pb2m)
               (string-lessp pb1s pb2s)))))


(defun parbek= (pb1 pb2)
  (parbek pb1 pb2 pb1m pb1s pb2m pb2s
    (and (= pb1m pb2m)
         (string-equal pb1s pb2s))))


(defparameter *rec-comp*
  `(:tv   (,#'string-equal ,#'string-lessp nil)
    :par  (,#'parbek= ,#'parbek< nil)
    :bek  (,#'parbek= ,#'parbek< nil)
    :mell (,#'parbek= ,#'parbek< t)
    :pont (,#'string-equal ,#'string-lessp t)))


(defun <-records (rec1 rec2 &optional (opts *rec-comp*))
  (and opts
       (destructuring-bind (key (same-fn less-fn orientation) &rest rest)
           opts
         (declare (ignore rest))
         (let ((v1 (getf rec1 key))
               (v2 (getf rec2 key)))
           (cond ((not (or v1 v2))        (<-records rec1 rec2 (cddr opts)))
                 ((null v1)               orientation)
                 ((null v2)               (not orientation))
                 ((funcall same-fn v1 v2) (<-records rec1 rec2 (cddr opts)))
                 (t                       (funcall less-fn v1 v2)))))))


;;; ---------------------------------------------------------------


(defun key-order ()
  (loop for (key value) on *rec-comp* by #'cddr collecting
        key))


(defun remove-branches (plist key)
  (let* ((keys (key-order))
         (start (position key keys))
         (drops (subseq keys start))
         (copy (copy-list plist)))
    (dolist (key drops)
      (remf copy key))
    copy))


(defun point-covered-p (plist list key)
  (when (find key plist)
    (let ((pruned (remove-branches plist key)))
      (find pruned list :test #'plist-equalp))))


(defun remove-covered-sub (list key)
  (remove-if #'(lambda (element)
                 (point-covered-p element list key))
             list))


(defun remove-covered-subs (list &optional (keys '(:pont)))
  (if (null keys)
    list
    (remove-covered-subs
     (remove-covered-sub list (first keys))
     (rest keys))))


(defun generate-refs (keys)
  (sort
   (remove-covered-subs 
    (remove-duplicates 
     (collect-fees keys *illetmeny*)
     :test #'plist-equalp)
    '(:pont))
   #'<-records))

;;; ---------------------------------------------------------------


(defun rule-desc (plist)
  (let* ((tv     (getf plist :tv))
         (triple (find tv *tv* :test #'string= :key #'first)))
    (when triple
      (if (position tv *fully-defined-tvs* :test #'string=)
        (second triple)
        (third  triple)))))


(defparameter *output* nil)


(defparameter *key-forms*
  `(:tv   ,#'(lambda (plist)
               (format *output* "~a " (rule-desc plist)))
    :par  ,#'(lambda (plist)
               (destructuring-bind (&key par &allow-other-keys)
                   plist
                 (format *output* "~d. § " par)))
    :bek  ,#'(lambda (plist)  
               (destructuring-bind (&key bek pont &allow-other-keys)
                   plist
                 (let ((text (if pont
                               "bekezdésének "
                               "bekezdése, ")))
                   (format *output* "(~d) ~a" bek text))))
    :mell ,#'(lambda (plist)
               (destructuring-bind (&key mell pont &allow-other-keys)
                   plist
                 (let ((text (if pont
                               "mellékletének "
                               "melléklete, ")))
                   (format *output* "~d. ~a" mell text))))
    :pont ,#'(lambda (plist)
               (format *output* "~a) pontja, " (getf plist :pont)))
    :megj ,#'(lambda (plist)
               (format *output* "(~a)" (getf plist :megj)))))


(defun dispfn (key)
  (getf *key-forms* key))


;;; ---------------------------------------------------------------


(defun p-branch-p (plist)
  (destructuring-bind (&optional key val &rest rest)
      plist
    (declare (ignore val))
    (and (keywordp key)
         rest)))


(defun p-leaf-p (plist)
  (and (keywordp (first plist))
       (not (cddr plist))))


(defun top-branches (list)
  (remove-duplicates
   (mapcar #'(lambda (plist)
               (list (first plist)
                     (second plist)))
           list)
   :test #'plist-equalp))


(defun select-branches (list top)
  (destructuring-bind (key val)
      top
    (mapcar #'cddr
            (remove-if-not #'(lambda (plist)
                               (equalp val (getf plist key)))
                           list))))


(defun display (plist key)
  (let ((fn (dispfn key))) 
    (when fn
      (funcall fn plist))))


(defun reset-crumbs (crumbs key)
  (let* ((ordered (key-order))
         (from    (position key ordered))
         (rest    (subseq ordered from))
         (copy    (copy-list crumbs)))
    (dolist (key rest)
      (remf copy key))
    copy))


(defun offset (list i)
  (let ((len (length list)))
    (when (<= i (1- len))
      (nth i list))))


(defun traverse (list)
  (let ((previous    '())
        (current     '())
        (results     '())
        (*output*    nil)
        (tested-keys '()))
    (loop for i from 0 below (length list) doing
          (setf current (nth i list))
          (loop for i from 0 below (length current) by 2 doing
                (let ((key     (offset current i))
                      (val     (offset current (1+ i)))
                      (nextkey (offset current (+ i 2))))
                  (push (equalp (getf previous key) val) tested-keys)
                  (if (or (position-if #'null tested-keys)
                          (and (eq key :bek)
                               nextkey
                               (eq nextkey :sbek))
                          (and (eq key :par)
                               nextkey
                               (eq nextkey :spar)))
                    (push (display current key) results))))
          (setf previous current)
          (setf tested-keys '()))
    (remove nil (nreverse results))))


(defun contains-p (string list)
  (let ((results '()))
    (loop for sub in list doing
          (push (search sub string :test #'string-equal) results))
    (position-if-not #'null (nreverse results))))


(defun count-rest (list pos subs)
  (loop for elem in (subseq list pos)
        counting (contains-p elem subs)))


(defun count-conseq (list pos sub)
  (let ((count 0))
    (loop for i from pos below (length list) doing
          (let ((current (nth i list)))
            (if (contains-p current (list sub))
              (incf count)
              (loop-finish))))
    count))


(defun replace-substring (string old new &optional (start 0))
  (let ((start (search old string :start2 start)))
    (if start
        (let* ((end    (+ start (length old)))
               (before (subseq string 0 start))
               (after  (subseq string end))
               (constr (concatenate 'string before new after))
               (from   (+ start (length new))))
          (replace-substring constr old new from))
      string)))


(defparameter *rewrites*
  (list
   ;; Törvények, rendeletek neve elõtt elválasztó és névelõ
   #'(lambda (list)
       (let* ((subs   '("tv." "törvény" "rendelet"))
              (wovels '(#\a #\á #\e #\é #\i #\í #\o #\ó #\ö #\õ #\u #\ú #\ü #\û))
              (total  (count-rest list 0 subs))
              (count  total)
              (copy   (copy-list list)))
         (loop for i from 0 below (length list) doing
               (let ((string (nth i list)))
                 (when (contains-p string subs)
                   (let* ((pro  (if (find (elt string 0) wovels)
                                  "az" "a"))
                          (full (format nil
                                        (if (and (> total 1)
                                                 (= count 1))
                                          "valamint ~a ~a" "~a ~a")
                                        pro string)))
                     (setf (nth i copy) full))
                   (decf count))))
         copy))
   ;; Bekezdések, pontok összevonása
   #'(lambda (list)
       (let ((subs '("bekezdése" "pontja"))
             (copy (copy-list list))
             (len  (length list)))
         (loop for i from 0 below len doing
               (let* ((string (nth i list))
                      (corres (contains-p string subs)))
                 (when corres
                   (let* ((found  (nth corres subs))
                          (conseq (count-conseq list (1+ i) found))
                          (new    (cond ((> conseq 1)
                                         (replace-substring string found ""))
                                        ((= conseq 1)
                                         (replace-substring string (concatenate 'string found ",") " és"))
                                        (t string))))
                     (setf (nth i copy) new)))))
         copy))
   ;; Záró vesszõ törlése
   #'(lambda (list)
       (let* ((copy (copy-list list))
              (last (first (last copy)))
              (end  (position-if-not #'(lambda (char)
                                         (and (char/= char #\Space)
                                              (char/= char #\,)))
                                     last :from-end t)))
         (append (butlast copy)
                 (list (subseq last 0 (1- end))))))
   ;; Két egymás utáni § esetén az elsõ után legyen ","
   #'(lambda (list)
       (let ((copy (copy-list list)))
         (loop for i from 0 below (length list) doing
               (let ((current (nth i list))
                     (next    (offset list (1+ i))))
                 (when (and (find #\§ current)
                            (find #\§ next))
                   (setf (nth i copy)
                         (replace-substring current "§ " "§, ")))))
         copy))
   ;; Dupla szóközök cseréje szimpla szóközre.
   #'(lambda (list)
       (let ((copy (copy-list list)))
         (loop for i from 0 below (length list) doing
               (let ((current (nth i list)))
                 (when (search "  " current)
                   (setf (nth i copy)
                         (replace-substring current "  " " ")))))
         copy))
   ;; " , " cseréje ", "-re
   #'(lambda (list)
       (let ((copy (copy-list list)))
         (loop for i from 0 below (length list) doing
               (let ((current (nth i list)))
                 (when (search " , " current)
                   (setf (nth i copy)
                         (replace-substring current " , " ", ")))))
         copy))
   ))
#|
Szükség van a COPY-LIST-ekre???
A LOOP... utáni LET-et be lehetne építeni a LOOP-ba.
A fentiek részei lehetnének egy keretmakrónak.
 |#


(defun rewrite (list &optional (rewrites *rewrites*))
  (when list
    (if rewrites
        (rewrite (funcall (first rewrites) list)
                 (rest rewrites))
      (apply #'concatenate 'string list))))
        

(defun convert (keys)
  (rewrite
   (traverse
    (generate-refs keys))))


;;; ---------------------------------------------------------------


(defun find-key (val list)
  (first
   (find val list :key #'second :test #'string-equal)))


#|(defun value-rows (worksheet title value)
  (format t "   value-rows~%")
  (let ((column (title-column worksheet title))
        (start  nil)
        (end    nil))
    (loop for row from 2
          for val = #p(value2 (range worksheet column row))
          until end doing
          (progn
            (format t "         ~a~%" row)
            (and (equalp val value)
                 (not start)
                 (setf start row))
            (and (not (equalp val value))
                 start
                 (not end)
                 (setf end row))))
    (values start (1- end))))|#


(defun value-rows (worksheet title value)
  (let ((column (xrange worksheet title 2 title (last-row worksheet))))
    (if (typep column 'array)
      (let* ((list   (loop for e across (column->row column) collecting
                           (excel-value-as-number e)))
             (first  (+ 2 (position value list :test #'equalp)))
             (last   (+ 2 (position value list :test #'equalp :from-end t))))
        (values first last))
      (values 2 2))))


(defun extract-cols (worksheet titles row-start &optional (row-end nil))
  (loop for row from row-start
        for list = (mapcar #'(lambda (title)
                               #p(value2 (range worksheet (title-column worksheet title) row)))
                           titles)
        until (if row-end
                (> row row-end)
                (null (first list)))
        collect list))


#|(defun flush-wip-sheet (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
    (let* ((last-row     (last-row ws-wip))
           (fee-elements (extract-cols ws-help '("IeKód" "IeNév" "IeVége") 2))
           (target-columns (append
                            (list "SZTSZ" "Jogszabályi hivatkozás")
                            (mapcar #'second fee-elements)
                            (mapcar #'third  fee-elements)
                            (mapcar #'second *copies*))))
      (loop for row from 2 upto last-row doing
            (dolist (column target-columns)
;              (format t "Before: ~a,~a: ~a~%" column row (xcell ws-wip column row)) 
              (setf (xcell ws-wip column row) "")
;              (format t "After: ~a,~a: ~a~%" column row (xcell ws-wip column row))
              )))))|#


#|(defun flush-wip-sheet (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
    (let* ((fee-elements  (extract-cols ws-help '("IeKód" "IeNév" "IeVége" "IeKezdete") 2))
           ;; Titles of all the columns we will fill in on the WIP sheet
           (column-titles (append (list "SZTSZ" "Jogszabályi hivatkozás")
                                  (mapcar #'second fee-elements)
                                  (mapcar #'third  fee-elements)
                                  (mapcar #'fourth fee-elements)
                                  (mapcar #'second *copies*)))
           ;; Column numbers
           (columns       (mapcar #'(lambda (title)
                                      (title-column ws-wip title))
                                  column-titles))
           (last-row      (last-row ws-wip)))
      ;; Set column ranges to ""
;      (print fee-elements)
      (dolist (column columns)
        (when column
          (setf #p(value2 (range ws-wip column 2 column last-row)) ""))))))|#


(defun transpose-tree (tree)
  (loop for i from 0 below (length (first tree)) collecting
        (mapcar #'(lambda (element)
                    (nth i element))
                tree)))


(defun flush-wip-sheet (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
;    (let* ((fee-elements  (extract-cols ws-help '("IeKód" "IeNév" "IeVége" "IeKezdete") 2))
    (let* ((fee-elements  (extract-cols ws-help '("IeNév" "IeVége" "IeKezdete") 2))
           (fee-headers   (apply #'append (transpose-tree fee-elements)))
           ;; Titles of all the columns we will fill in on the WIP sheet
           (column-titles (append (list "SZTSZ" "Jogszabályi hivatkozás")
                                  fee-headers
                                  (mapcar #'second *copies*)))
           ;; Column numbers
           (columns       (mapcar #'(lambda (title)
                                      (title-column ws-wip title))
                                  (remove nil column-titles)))
           (last-row      (last-row ws-wip)))
      ;; Set column ranges to ""
;      (print fee-headers)
;      (print fee-elements)
      (dolist (column columns)
        (when column
          (setf #p(value2 (range ws-wip column 2 column last-row)) ""))))))


(defun copy-unique-bns (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip))
    ;; Collect BNs from the SAP sheet
    (let* ((query-bns (loop for row from 2 upto (last-row ws-sap)
                            for value = (xcell ws-sap "SZTSZ" row)
                            collecting value
                            doing (setf (xcell ws-sap "SZTSZ" row) value)))
           ;; Keep unique BNs
           (bns       (remove-duplicates query-bns :test #'equalp)))
      ;; Copy BNs into the WIP sheet
      (loop for bn in bns
            for row from 2 doing
            (setf (xcell ws-wip "SZTSZ" row)
                  (format nil "~d" (round (excel-value-as-number bn))))))))


(defparameter *sap-it08* '(16 18 30 36))
(defparameter *sap-it14* '(20 22 31 35))

(defun collect-fee-data (worksheet row-start row-end)
;  (format t "      collect-fee-data starting~%")
  (flet ((collect (list row)
           (mapcar #'(lambda (col)
                       (xcell worksheet col row))
                   list)))
    (loop for row from row-start upto row-end
          collecting (collect *sap-it08* row)
          collecting (collect *sap-it14* row))))


(defun arrange-fees (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
    (let ((destinations (extract-cols ws-help '("IeKód" "IeNév" "IeVége" "IeKezdete") 2)))
      ;; Iterate over BNs on sheet 2
      (loop for row from 2
            for bn = (xcell ws-wip "SZTSZ" row)
            until (null bn) doing
            ;; Find BN rows on sheet 1
            (multiple-value-bind (start end)
                (value-rows ws-sap "SZTSZ" bn)
              ;; Collect all fee data for BN from sheet 1
              (let ((fees (remove-duplicates
                           (collect-fee-data ws-sap start end)
                           :key #'first :test #'equalp)))
                ;; Iterate over all possible fee elements
                (dolist (titles destinations)
                  (destructuring-bind (code name ends starts)
                      titles
                    ;; If element found on sheet 1:
                    (let ((found (find code fees :key #'first :test #'equalp)))
                      (when found
                        (destructuring-bind (code-v sum-v ends-v starts-v)
                            found
#|                          (format t "code-v: ~a   sum-v: ~a   ends-v: ~a   starts-v: ~a~%" code-v sum-v ends-v starts-v)
                          (format t "   ~a: ~a~%" name found)|#
                          ;; Copy sum
                          (setf (xcell ws-wip name row) sum-v)
                          (let ((ends-col   (and ends   (resolve-column-designator ends ws-wip)))
                                (starts-col (and starts (resolve-column-designator starts ws-wip))))
                            ;; Copy end date
                            (when (and ends-col ends-v)
;                              (format t "      ends  ~a  ~a~%" ends-col ends-v)
                              (setf (xcell ws-wip ends-col row) ends-v))
                            ;; Copy start date
                            (when (and starts-col starts-v)
;                              (format t "      starts  ~a  ~a~%" starts-col starts-v)
                              (setf (xcell ws-wip starts-col row) starts-v))))))))))))))


(defparameter *copies*
  '(("SZK" "SZK")
    ("Bérrendsz. csop név" "Besorolás")
    ("Esélyteremtési illetményrészre" "Esély_jogsz_alap")))


(defun straight-copy-values (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip))
    ;; Iterate on BNs on the WIP sheet
    (loop for row-wip from 2
          for bn = (xcell ws-wip "SZTSZ" row-wip)
          until (null bn)
          ;; From the first BN row on the SAP sheet...
          for row-sap = (value-rows ws-sap "SZTSZ" bn)
          ;; ...copy values from designated columns onto the WIP sheet
          doing (loop for (sap wip) in *copies* doing
                      (setf (xcell ws-wip wip row-wip)
                            (xcell ws-sap sap row-sap))))))


(defun construct-code-reference (workbook)
  (with-workbook (workbook :wsvars (ws-sap ws-wip))
    ;; Iterate on BNs from the WIP sheet
    (loop for row from 2
          for bn = (xcell ws-wip "SZTSZ" row)
          until (null bn)
          doing
          ;; Find BN rows on the SAP sheet
          (multiple-value-bind (start stop)
              (value-rows ws-sap "SZTSZ" bn)
            ;; Collect fee element codes
            (let* ((codes (loop for row from start upto stop
                                collecting (xcell ws-sap (first *sap-it08*) row)
                                collecting (xcell ws-sap (first *sap-it14*) row)))
                   ;; Get element records
                   (fees  (fees
                           :role  (find-key (xcell ws-wip "SZK" row) *roles*)
                           :group (find-key (xcell ws-wip "Besorolás" row) *groups*)
                           :plus  (find-key (xcell ws-wip "Esély_jogsz_alap" row) *pluses*)
                           :codes codes))
                   ;; Construct text
                   (*fully-defined-tvs* (if (string= (xcell ws-wip "Besorolás" row) "Gyakornok")
                                          '("1puetv" "2puetv-vhr")
                                          '("1puetv")))
;                   '("1puetv" "2puetv-vhr" "3koznev-2011-cxc" "4emmi-20-2012-viii31")
                   (text  (convert fees)))
;              (format t "~a~%~a~%~a~%~a~%~%~%" codes fees *fully-defined-tvs* text)
              ;; Copy text to the WIP sheet
              (setf (xcell ws-wip "Jogszabályi hivatkozás" row)
;                    text2))))))
                    text))))))


;;; ---------------------------------------------------------------


(defun run ()
  (let ((file (second sys:*line-arguments-list*)))
    (when file
      (with-workbook (wbook :open-file file :save t :close t)
        (print "Korábbi adatok törlése")
        (flush-wip-sheet wbook)
        (print "SZTSZ-ek")
        (copy-unique-bns wbook)
        (print "Bérelemek (összeg, érvényesség kezdete, vége)")
        (arrange-fees wbook)
        (print "Személyi kör, besorolás, esélyteremtési illetményrész jogalapja")
        (straight-copy-values wbook)
        (print "Jogszabályi hivatkozás")
        (construct-code-reference wbook))
      (format t "~%Fájl mentve: ~a~%KÉSZ~%" file)))
;  (read-line))
  )


;(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\Pedagógus_1több_fõ.xlsx")
;(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\Pedagógus_PedNOKS_1több_fõ__.xlsx")

;(defparameter *f* "c:\\Users\\csd79\\common-lisp\\cref\\Pedagógus_PedNOKS_1több_fõ_.xlsx")
;(defparameter *f* "c:\\Users\\csd79\\common-lisp\\cref\\Adatbázis táblázat.xlsx")
;(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\1.Adatbázis táblázat______.xlsx")
;(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\2.0_Adatbázis táblázat_kinev.mód-hoz.xlsx")
(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\1.0_Adatbázis táblázat.xlsx")


(defun test ()
  (let ((sys:*line-arguments-list* (list nil *f*)))
    (run)))


(defun test5 ()
  (with-workbook (wbook :open-file *f* :wsvars (ws1) :save t :close t)
    (print (loop for col from 1 upto 5
                 collecting (xcell ws1 col 1)))
    (loop for row from 2 upto 6
          doing (setf (xcell ws1 1 row) row))
    (print (locate-row ws1 "Név" "BECSEI NÓRA"))
    (setf (xcell ws1 2 '("Név" "BECSEI NÓRA")) "Hihihihihihihihihihihihihihi!")))


(defun test8 ()
  (with-workbook (wbook :open-file *f* :wsvars (ws1) :close t :save t)
;    (setf (xrange ws1 2 2 6 6) (make-array '(4 1) :initial-element "666"))
    (setf (xrange ws1 "SZTSZ" '("Név" "ÁDÁM CSILLA ÁGNES") :f 7) (make-array '(2 2) :initial-element "666"))
    ))


(defun test9 (value)
  (assert (or (numberp value)
              (and (stringp value)
                   (numberp (read-from-string value))))
      (value)
    "Value ~a is not readable as number." value))




(defun testa ()
  (with-workbook (wbook :open-file *ff* :wsvars (ws-sap) :close t)
    (column->row
     (xrange ws-sap "SZTSZ" 2 "SZTSZ" (last-row ws-sap)))))
