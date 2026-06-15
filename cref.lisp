(in-package :cref)


;;; ---------------------------------------------------------------
;;; Globális változók


#|(defparameter *puetv-b1b2b8b9-illetmenyelemek-current*
  *puetv-b1b2b8b9-illetmenyelemek-2026jan*)

(defparameter *puetv-megnevezes-current*
  *puetv-megnevezes-2026jan*)

(defparameter *puetv-b1b2b8b9-illetmenyelemek-current-sorrend*
  *puetv-b1b2b8b9-illetmenyelemek-2026jan-sorrend*)|#


;(defparameter *coderefs*    '())
(defparameter *codenames*   '())
(defparameter *defined-tvs* '())
(defparameter *output*      nil)


;;; ---------------------------------------------------------------
;;; DEPRECATED


;; LIST bérelemek szûrése kód, személyi kör (ps), besorolás (lab) és esélyt.ill.alap (eila) szerint.
(defun filter-fees% (list &key (code nil) (ps nil) (lab nil) (eila nil) (titl nil)); (pvs nil))
  (let ((results '())
        (codev code) (psv ps) (labv lab) (eilav eila) (titlv titl)); (pvsv pvs))
    (dolist (record list)
      (destructuring-bind (&key code ps lab eila titl); pvs)
          (getf record :meta)
        (when (and (or (null code) (member codev code :test #'string=))
                   (or (null ps)   (member psv   ps   :test #'string=))
                   (or (null lab)  (member labv  lab  :test #'string=))
                   (or (null eila) (member eilav eila :test #'string=))
                   (or (null titl) (member titlv titl :test #'string=))
;                   (or (null pvs)  (member pvsv  pvs  :test #'string=))
                   )
          (push (getf record :id) results))))
    (nreverse results)))

;; Egy adott személyi kör/beosztás/esélyt.ill.alapra érvényes,
;; a CODES által azonosított bérelemek összegyûjtése.
(defun fees% (&key (codes '()) (ps nil) (lab nil) (eila nil) (titl nil)); (pvs nil))
  (apply #'append
         (mapcar #'(lambda (code)
                     (filter-fees% *coderefs* :code code :ps ps :lab lab :eila eila :titl titl)); :pvs pvs))
                 codes)))


;;; ---------------------------------------------------------------
;;; Bérelemek keresése, szûrése


;; Bérelem adatai azonosító alapján.
(defun fee-by-key (key list)
  (let ((pos (position-if #'(lambda (record)
                              (eq (getf record :id) key))
                          list)))
    (if pos
      (let ((found (nth pos list)))
        (values (getf found :refs)
                key
                (getf found :meta)))
      (error "Nem definiált bérelem: ~a" key))))


;; Felsorolt bérelemek jogsz.hivatkozásainak listába gyûjtése.
(defun collect-fees (keys list)
  (let ((result '()))
    (dolist (key keys)
      (push (fee-by-key key list)
            result))
    (apply #'append
           (nreverse 
            (remove nil result)))))


(defun plist-keys (plist)
  (loop for key in plist by #'cddr collecting key))


(defun filter-fees (coderefs &rest selectors)
  "Collect :IDs of every row whose :META either contains exact value for a certain key or none at all."
  (let ((results '())
        (skeys   (plist-keys selectors)))
    (dolist (record coderefs)
      (let* ((meta      (getf record :meta))
             (mkeys     (plist-keys meta))
             (all-keys  (remove-duplicates (append skeys mkeys)))
             (selection (loop for key in all-keys
                              for valset = (getf meta key)
                              for sval   = (getf selectors key)
                              collecting
                              (or (null valset)
                                  (member sval valset :test #'string=)))))
        (when (every #'identity selection)
          (push (getf record :id) results))))
    (nreverse results)))


(defun fees (coderefs &rest selectors)
  "Generate a list of :IDs based on a :CODES list (a :CODE is a more general form of an :ID) and additional selectors."
  (let ((codes (getf selectors :codes))
        (selectors% (loop for (key val) on selectors by #'cddr
                          unless (eq key :codes)
                          collect (list key val) into results
                          finally (return (apply #'nconc results)))))
    (apply #'append
           (mapcar #'(lambda (code)
                       (apply #'filter-fees coderefs :code code selectors%))
                   codes))))


;;; ---------------------------------------------------------------
;;; Jogszabályi hivatkozások összehasonlítása és rendezése


;; A két plist kulcs/elem párjai megegyeznek?
(defun plist-equalp (plist1 plist2)
  (flet ((p1-covers-p2-p (p1 p2)
           (loop for (key val) on p1 by #'cddr
                 always (equalp (getf p2 key) val))))
    (and (p1-covers-p2-p plist1 plist2)
         (p1-covers-p2-p plist2 plist1))))


;; Összetett paragrafus- és bekezdésnevek dekonstruálása, pl.:
;;   "95/A" -> 95, "A"
;;   "6a"   -> 6, "a"
(defun decons-parbek (parbek)
  (destructuring-bind (main sub)
      (multiple-value-bind (full subs)
          (cl-ppcre:scan-to-strings "(\\d*)/*(\\D*)" parbek)
        (declare (ignore full))
        (coerce subs 'list))
    (values
     (read-from-string main)
     sub)))


;; Segédmakró paragrafus-bekezdés kombinációk összehasonlításához.
(defmacro parbek (pb1 pb2 pb1-main pb1-sub pb2-main pb2-sub &body body)
  `(multiple-value-bind (,pb1-main ,pb1-sub)
      (decons-parbek ,pb1)
    (multiple-value-bind (,pb2-main ,pb2-sub)
        (decons-parbek ,pb2)
      ,@body)))


;; PB1 korábbi paragrafus-bekezdés mint PB2?
(defun parbek< (pb1 pb2)
  (parbek pb1 pb2 pb1m pb1s pb2m pb2s
      (or (< pb1m pb2m)
          (and (= pb1m pb2m)
               (string-lessp pb1s pb2s)))))


;; PB1 és PB2 ugynaz a paragrafus-bekezdés?
(defun parbek= (pb1 pb2)
  (parbek pb1 pb2 pb1m pb1s pb2m pb2s
    (and (= pb1m pb2m)
         (string-equal pb1s pb2s))))


;; Segédtábla jogszabályi hivatkozások összehasonlításához.
(defparameter *rec-comp*
  `(:tv   (,#'string-equal ,#'string-lessp nil)
    :par  (,#'parbek=      ,#'parbek<      nil)
    :bek  (,#'parbek=      ,#'parbek<      nil)
    :mell (,#'parbek=      ,#'parbek<      t)
    :pont (,#'string-equal ,#'string-lessp t)))


;; REC1 jogsz.hiv. megelõzi-e REC2-t.
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
;;; Jogsz. hivatkozási pontok összegyûjtése illetményelemek adott listája alapján.


;; Jogsz.hiv. elemeinek sorrendje.
(defun key-order ()
;  (loop for (key value) on *rec-comp* by #'cddr collecting
  (loop for (key nil) on *rec-comp* by #'cddr collecting
        key))


;; Jogsz.hiv. elemek eltávolítása PLIST-bõl KEY-jel kezdõdõen, pl.:
;;   (:tv "2puetv-vhr" :par "90" :bek "6"), :par  ->  (:TV "2puetv-vhr")
(defun remove-branches (plist key)
  (let* ((keys  (key-order))
         (start (position key keys))
         (drops (subseq keys start))
         (copy  (copy-list plist)))
    (dolist (key drops)
      (remf copy key))
    copy))


;; PLIST KEY elõtti része megtalálható-e LIST-ben?
(defun point-covered-p (plist list key)
  (when (find key plist)
    (let ((pruned (remove-branches plist key)))
      (find pruned list :test #'plist-equalp))))


;; Eltávolítani azokat a beágyazott plist-eket, amelyek KEY elõtti része
;; plist-ként már megtalálható a listában.
(defun remove-covered-sub (list key)
  (remove-if #'(lambda (element)
                 (point-covered-p element list key))
             list))


;; Végigmegy a KEYS-en, és minden így kapott kulccsal meghívja
;; a REMOVE-COVERED-SUB függvényt.
(defun remove-covered-subs (list &optional (keys '(:pont)))
  (if (null keys)
    list
    (remove-covered-subs
     (remove-covered-sub list (first keys))
     (rest keys))))


;; Jogsz.hiv. plist-ek rendezett listázása a megadott illetményrészekhez úgy,
;; hogy minden jogszabályi pont csak egyszer legyen hivatkozva. Pl.:
;;   (:egyes-tantrgy-illnov :eselyteremt-illr-feladat)
;; ->
;;   ((:TV "1puetv" :PAR "98" :BEK "5" :PONT "b")
;;    (:TV "2puetv-vhr" :PAR "88" :BEK "4")
;;    (:TV "2puetv-vhr" :PAR "88" :BEK "5")
;;    (:TV "2puetv-vhr" :PAR "88" :BEK "6")
;;    (:TV "2puetv-vhr" :PAR "95/A" :BEK "2")
;;    (:TV "2puetv-vhr" :PAR "95/A" :BEK "4"))
(defun generate-refs (keys coderefs)
  (sort
   (remove-covered-subs 
    (remove-duplicates 
     (collect-fees keys coderefs)
     :test #'plist-equalp)
    '(:pont))
   #'<-records))


;;; ---------------------------------------------------------------
;;; Törvények és jogszabályi hivatkozási elemek nyomtatott formája.


;; Megkeresni a PLIST-ben lévõ :tv törvényt a *defined-tvs* listában.
;; (Ez jelzi, hogy a törvény teljes megnevezése szerepelt-e már korábban.)
;; Ha szerepel, visszaadni a rövid nevét, egyébként a teljes nevét.
(defun rule-desc (plist)
  (let* ((tv    (getf plist :tv))
         (found (find-if #'(lambda (code)
                             (let ((id (getf code :tv)))
                               (and id (string= id tv))))
                         *codenames*)))
;    (push *codenames* wax::g)
    (when found
      (if (position tv *defined-tvs* :test #'string=)
        (getf found :short)
        (getf found :full)))))


;; A jogszabályi hivatkozás elemeinek alap nyomtatott formája.
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


;; A jogszabályi hivatkozási elemhez tartozó kiíró függvény.
(defun dispfn (key)
  (getf *key-forms* key))


;;; ---------------------------------------------------------------
;;; Jogsz.hivatkozások egyszerûsítése és nyomtatott formára alakítása.


;; PLIST több kulcs-érték párt tartalmaz?
(defun p-branch-p (plist)
  (destructuring-bind (&optional key val &rest rest)
      plist
    (declare (ignore val))
    (and (keywordp key)
         rest)))


;; PLIST csak 1 kulcs-érték párt tartalmaz?
(defun p-leaf-p (plist)
  (and (keywordp (first plist))
       (not (cddr plist))))


;; LIST-ben lévõ plist-ek elsõ kulcs-érték párját megtartani,
;; a többit eldobni.
(defun top-branches (list)
  (remove-duplicates
   (mapcar #'(lambda (plist)
               (list (first plist)
                     (second plist)))
           list)
   :test #'plist-equalp))


;; LIST-ben lévõ plist-ek közül csak azokat megtartani, amelyek
;; tartalmazzák a TOP-ban lévõ kulcs-érték párt.
(defun select-branches (list top)
  (destructuring-bind (key val)
      top
    (mapcar #'cddr
            (remove-if-not #'(lambda (plist)
                               (equalp val (getf plist key)))
                           list))))


;; A PLIST-ben lévõ KEY-hez tartozó függvénnyel elküldeni
;; a hivatkozási elem nyomtatott formáját az *OUTPUT* által
;; jelölt streamre.
(defun display (plist key)
  (let ((fn (dispfn key))) 
    (when fn
      (funcall fn plist))))


#|
(defun reset-crumbs (crumbs key)
  (let* ((ordered (key-order))
         (from    (position key ordered))
         (rest    (subseq ordered from))
         (copy    (copy-list crumbs)))
    (dolist (key rest)
      (remf copy key))
    copy))
|#


;; Visszaadni a LIST I-indexû elemét, ha I a listán belül van,
;; különben NIL-t.
(defun offset (list i)
  (let ((len (length list)))
    (when (<= i (1- len))
      (nth i list))))


;; A LIST-ben lévõ jogszabályi hivatkozások felesleges részeit eldobni, a
;; maradékból pedig nyomtatott formát gyártani. Pl.:
;;    ((:TV "1puetv" :PAR "98" :BEK "5" :PONT "b")
;;     (:TV "2puetv-vhr" :PAR "88" :BEK "4")
;;     (:TV "2puetv-vhr" :PAR "88" :BEK "5")
;;     (:TV "2puetv-vhr" :PAR "88" :BEK "6")
;;     (:TV "2puetv-vhr" :PAR "95/A" :BEK "2")
;;     (:TV "2puetv-vhr" :PAR "95/A" :BEK "4"))
;; ->
;;    ("pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.) "
;;     "98. § " "(5) bekezdésének " "b) pontja, "
;;     "pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.) "
;;     "88. § " "(4) bekezdése, " "(5) bekezdése, " "(6) bekezdése, " "95/A. § "
;;     "(2) bekezdése, " "(4) bekezdése, ")
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


;;; ---------------------------------------------------------------
;;; Spot korrekciók elvégzése a nyomtatott hivatkozási elemeken.


;;;;;;;;;;;;;;; Van a LIST-nek olyan beágyazott listája, ami tartalmazza a STRING-et?
;; Van a LIST-ben olyan sztring, ami része a STRING-nek?
(defun contains-p% (string list)
  (let ((results '()))
    (loop for sub in list doing
          (push (search sub string :test #'string-equal) results))
    (position-if-not #'null (nreverse results))))
(defun contains-p (string list)
  (loop for emb in list
        collecting (search emb string :test #'string-equal) into results
        finally return (some #'identity results)))


;; A LIST hány POS utáni sztringjében található meg a SUBS valamelyik eleme?
(defun count-rest (list pos subs)
  (loop for elem in (subseq list pos)
        counting (contains-p elem subs)))


;; A LIST hány POS utáni sztringjében található meg a SUB?
(defun count-conseq% (list pos sub)
  (let ((count 0))
    (loop for i from pos below (length list) doing
          (let ((current (nth i list)))
            (if (contains-p current (list sub))
              (incf count)
              (loop-finish))))
    count))
(defun count-conseq (list pos sub)
  (loop for elem in (subseq list pos)
        counting (search sub elem :test #'string-equal)))


;; Az OLD összes elõfordulását NEW-ra cserélni a STRING-ben.
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


;; Spot healing függvények.
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

   ;; Két egymás utáni § esetén az elsõ után legyen "-a, "
   #'(lambda (list)
       (let ((copy (copy-list list)))
         (loop for i from 0 below (length list) doing
               (let ((current (nth i list))
                     (next    (offset list (1+ i))))
                 (when (and (find #\§ current)
                            (find #\§ next))
                   (setf (nth i copy)
                         (replace-substring current "§ " "§-a, ")))))
         copy))

   ;; Záró § esetén §-a, és megelõzõ vesszõ cseréje és-re
   #'(lambda (list)
       (let ((copy (copy-list list))
             (len  (length list)))
         (when (find #\§ (nth (1- len) list))
           (setf (nth (1- len) copy)
                 (replace-substring (nth (1- len) copy)
                                    "§ " "§-a, "))
           (when (find #\, (nth (- len 2) list))
             (setf (nth (- len 2) copy)
                   (replace-substring (nth (- len 2) copy)
                                      "," " és"))))
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


;; A *REWRITES*-ban felsorolt függvények meghívása a LIST-re. Pl.:
;;   ("pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.) "
;;    "98. § " "(5) bekezdésének " "b) pontja, "
;;    "pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.) "
;;    "88. § " "(4) bekezdése, " "(5) bekezdése, " "(6) bekezdése, " "95/A. § " "(2) bekezdése, "
;;    "(4) bekezdése, ")
;; ->
;;   "a pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.) 98. § (5) bekezdésének b) pontja, valamint a pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.) 88. § (4), (5) és (6) bekezdése, 95/A. § (2) és (4) bekezdése"
(defun rewrite (list &optional (rewrites *rewrites*))
  (when list
    (if rewrites
      (rewrite (funcall (first rewrites) list)
               (rest rewrites))
      (apply #'concatenate 'string list))))


;;; ---------------------------------------------------------------
;;; A teljes mûvelet egy függvényben.


;; Illetményelem-kódok szöveges hivakozássá alakítása. Pl.:
;;   (:egyes-tantrgy-illnov :eselyteremt-illr-feladat)
;; ->
;;   "a pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.) 98. § (5) bekezdésének b) pontja, valamint a pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.) 88. § (4), (5) és (6) bekezdése, 95/A. § (2) és (4) bekezdése"
(defun convert (keys coderefs codenames defined-tvs)
  (let ((*codenames* codenames)
        (*defined-tvs* defined-tvs))
    (rewrite
     (traverse
      (generate-refs keys coderefs)))))












#|(defun tg ()
  (let ((cref::*coderefs*  cref::*puetv-b1b2b8b9-illetmenyelemek-2025sep*)
        (cref::*codenames* cref::*puetv-megnevezes-2025sep*)
        (cref::*defined-tvs* '("1puetv")))
    (let ((g '(:TER-ILLEMELES-PED :MESTERFOK-ILLNOV :ESELYTEREMT-ILLR-FELADAT :EGYES-TANTRGY-ILLNOV :IG-H :HAVI-ILL-PED1-KUTATO)))
      (format t "~a~%~%" (generate-refs g))
;      (traverse (generate-refs g))
;      (format t "~a~%~%" (traverse (generate-refs g)))
      (format t "~a~%~%" (rewrite (traverse (generate-refs g))))
      
      )))|#
