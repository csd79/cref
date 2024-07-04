(ql:quickload "cl-ppcre")


;;; ---------------------------------------------------------------


(defparameter *illetmeny*
  '(
    (:havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88" :bek "1"))

    (:havi-ill-ped1-kutato "Havi illetmény - Pedagógus I. - Kutatótanár"
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88/A" :bek "1"))

    (:mesterfok-illnov "Mesterfokozatért járó illetménynövekedés"
     (:tv "2puetv-vhr" :par "95/A" :bek "1"))

    (:egyes-tantrgy-illnov "Egyes tantárgyak után járó illetménynövekedés"
     (:tv "1puetv" :par "95/A" :bek "2")
     (:tv "1puetv" :par "95/A" :bek "4"))

    (:eselyteremt-illresz-terulet "Területi alapon járó esélyteremtési illetményrész"
     (:tv "1puetv" :par "98" :bek "5" :pont "a")
     (:tv "2puetv-vhr" :par "88" :bek "3")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "6")
     (:tv "2puetv-vhr" :par "131" :bek "4"))

    (:eselyteremt-illresz-feladat "Feladatalapon járó esélyteremtési illetményrész"
     (:tv "1puetv" :par "98" :bek "5" :pont "b")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "5")
     (:tv "2puetv-vhr" :par "88" :bek "6")
     (:tv "2puetv-vhr" :par "131" :bek "4"))

    (:gyogyped-potl "Gyógypedagógiai pótlék"
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr" :par "90" :bek "3")
     (:tv "2puetv-vhr" :par "90" :bek "4a"))

    (:diabetesz-ellat "Diabétesz ellátási pótlék"
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr"  :par "90" :bek "4")
     (:tv "3koznev-2011-cxc"" :par" 62 :bek "1b"))

    (:nemzetisegi-potl "Nemzetiségi pótlék"
     (:tv "1puetv" :par "103" :bek "1")
     (:tv "1puetv" :mell "3" :pont "B")
     (:tv "2puetv-vhr" :par "90" :bek "2")
     (:tv "2puetv-vhr" :par "90" :bek "4a"))

    (:aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:tv "2puetv-vhr" :par "90" :bek "7")
     (:tv "4emmi-20-2012-viii31" :par "176" :bek "8"))

    (:ofo-megbiz "Osztályfõnöki megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90"  :bek "6")
     (:tv "2puetv-vhr" :par "90"  :bek "6a"))

    (:koll-csopvez "Kollégiumi csoportvezetõi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:tanszakvez "Tanszakvezetõi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "b")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:mkkoz-vez "Munkaközösség-vezetõi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "c")
     (:tv "2puetv-vhr" :par "90" :bek "5")
     (:tv "2puetv-vhr" :par "90" :bek "6")
     (:tv "2puetv-vhr" :par "90" :bek "6a"))

    (:cimz-ig "Címzetes igazgatói megbízási díj"
     (:tv "1puetv" :par "73" :bek "12"))
    
    (:cimz-foig "Címzetes fõigazgatói megbízási díj"
     (:tv "1puetv" :par "73" :bek "12"))
    
    (:ig "Igazgatói megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2"))
    
    (:foig "Fõigazgatói megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2"))
    
    (:ig-h "Igazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "3" :pont "a"))
    
    (:foig-h "Fõigazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "2" :pont "a"))
    
    (:tagint-ig "Tagintézmény-igazgatói megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "4"))
    
    (:integys-vez "Intézményegység-vezetõi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "4"))
    
    (:tagint-ig-h "Tagintézményigazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "5"))
    
    (:integys-vez-h "Intézményegységvezetõ-helyettesi megbízási díj"
     (:tv "1puetv" :par "102" :bek "1")
     (:tv "1puetv" :par "102" :bek "5"))
  
    (:pednoks-havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:tv "1puetv" :par "96" :bek "1")
     (:tv "1puetv" :par "96" :bek "2" :pont "a")
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88" :bek "1"))
    
    (:havi-ill-ped1-2 "Havi illetmény - Pedagógus I. - II."
     (:tv "1puetv" :par "96" :bek "1")
     (:tv "1puetv" :par "96" :bek "2" :pont "a")
     (:tv "1puetv" :par "98" :bek "2")
     (:tv "2puetv-vhr" :par "88/A" :bek "1"))
    
    (:pednoks-noks-eselyteremt-illresz "Esélyteremtési illetményrész"
     (:tv "1puetv" :par "99" :bek "2")
     (:tv "1puetv" :par "98" :bek "5" :pont "a")
     (:tv "2puetv-vhr" :par "88" :bek "3")
     (:tv "2puetv-vhr" :par "88" :bek "4")
     (:tv "2puetv-vhr" :par "88" :bek "6")
     (:tv "2puetv-vhr" :par "131" :bek "4"))
    
    (:pednoks-noks-aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:tv "2puetv-vhr" :par "90" :bek "7")
     (:tv "4emmi-20-2012-viii31" :par "176" :bek "8" :megj "A jogszabályi rendelkezések a pedagógusokra vonatkoznak."))
  
    (:noks-havi-ill "Havi illetmény"
     (:tv "1puetv" :par "96" :bek "2" :pont "b")
     (:tv "1puestv" :par "99" :bek "1")
     (:tv "2puetv-vhr" :par "88" :bek "7")
     (:tv "2puetv-vhr" :par "95" :bek "1"))
    ))


;;; ---------------------------------------------------------------


(defun fee-by-key (key list)
  (let ((pos (position key list :key #'first)))
    (when pos
      (let ((result (nth pos list)))
        (values (cddr result)
                (first result)
                (second result))))))


(defun collect-fees (keys list)
  (let ((result '()))
    (dolist (key keys)
      (push (fee-by-key key list)
            result))
    (apply #'append
           (nreverse
            (remove nil result)))))


;;; ---------------------------------------------------------------


(defun plist1-covers-plist2 (plist1 plist2)
  (loop for (key val) on plist1 by #'cddr
        always (equalp (getf plist2 key) val)))


(defun plist-equalp (plist1 plist2)
  (and (plist1-covers-plist2 plist1 plist2)
       (plist1-covers-plist2 plist2 plist1)))


(defun remove-duplicate-plists (list)
  (remove-duplicates list :test #'plist-equalp))


;;; ---------------------------------------------------------------


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


(defun sort-records (list)
  (sort list #'<-records))


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


;;; ---------------------------------------------------------------


(defun generate-refs (keys)
  (sort-records
   (remove-covered-subs
    (remove-duplicate-plists
     (collect-fees keys *illetmeny*))
;    '(:spar :sbek :pont))))
    '(:pont))))


;;; ---------------------------------------------------------------


(defparameter *tv*
  '(("1puetv"               "Púétv.")
    ("2puetv-vhr"           "Púétv. vhr.")
    ("3koznev-2011-cxc"     "nemzeti köznevelésrõl szóló 2011. évi CXC. törvény")
    ("4emmi-20-2012-viii31" "nevelési-oktatási intézmények mûködésérõl és a köznevelési intézmények névhasználatáról szóló 20/2012. (VIII. 31.) EMMI rendelet")))


(defun rule-desc (plist)
  (let* ((tv (getf plist :tv))
         (pair (find tv *tv* :test #'string= :key #'first)))
    (when pair
      (second pair))))


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
      (elt list i))))


(defun traverse (list)
  (let ((previous    '())
        (current     '())
        (results     '())
        (*output*    nil)
        (tested-keys '()))
    (loop for i from 0 below (length list) doing
          (setf current (elt list i))
          (loop for i from 0 below (length current) by 2 doing
                (let ((key     (offset current i))
                      (val     (offset current (1+ i)))
                      (nextkey (offset current (+ i 2))))
                  (push (equalp (getf previous key) val) tested-keys)
;                  (format t "~a  ~a~%" val tested-keys)
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
          (let ((current (elt list i)))
            (if (contains-p current (list sub))
              (incf count)
              (loop-finish))))
    count))


(defun string-replace (string old new)
  (let* ((old-start (search old string :test #'string=))
         (s1-end    (or (position-if-not #'(lambda (char) (char/= char #\Space)) string :from-end t :end old-start)
                        0))
         (s2-end    (when s1-end
                      (+ s1-end (length old)))))
    (concatenate 'string
                 (subseq string 0 s1-end)
                 new
                 (subseq string (1+ s2-end)))))


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
               (let ((string (elt list i)))
                 (when (contains-p string subs)
                   (let* ((pro  (if (find (elt string 0) wovels)
                                  "az" "a"))
                          (full (format nil
                                        (if (and (> total 1)
                                                 (= count 1))
                                          "valamint ~a ~a" "~a ~a")
                                        pro string)))
                     (setf (elt copy i) full))
                   (decf count))))
         copy))
   ;; Bekezdések, pontok összevonása
   #'(lambda (list)
       (let ((subs '("bekezdése" "pontja"))
             (copy (copy-list list))
             (len  (length list)))
         (loop for i from 0 below len doing
               (let* ((string (elt list i))
                      (corres (contains-p string subs)))
                 (when corres
                   (let* ((found  (elt subs corres))
                          (conseq (count-conseq list (1+ i) found))
                          (new    (cond ((> conseq 1)
                                         (string-replace string found ""))
                                        ((= conseq 1)
                                         (string-replace string (concatenate 'string found ",") " és"))
                                        (t string))))
                     (setf (elt copy i) new)))))
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
               (let ((current (elt list i))
                     (next    (offset list (1+ i))))
                 (when (and (find #\§ current)
                            (find #\§ next))
                   (setf (elt copy i)
                         (replace-substring current "§ " "§, ")))))
         copy))
   ))


(defun rewrite (list &optional (rewrites *rewrites*))
  (if rewrites
    (rewrite (funcall (first rewrites) list)
             (rest rewrites))
    (apply #'concatenate 'string list)))
        

;;; ---------------------------------------------------------------


(defun convert (keys)
  (rewrite
   (traverse
    (generate-refs keys))))


(defparameter y '(:ig-h :mkkoz-vez))
(defparameter s '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez))
(defparameter g '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez :nemzetisegi-potl :havi-ill-ped1-2))
