#|(in-package :cref)


;;; ---------------------------------------------------------------


;;; Visszaadja az elsõ és utolsó sort, amelyben VALUE érték található a
;;; WORKSHEET lap TITLE fejlécû oszlopában.
(defun value-rows (worksheet title value)
  (let ((column (xrange worksheet title 2 title (last-row worksheet))))
    (if (typep column 'array)
      (let* ((list   (loop for e across (column->row column) collecting
                           (excel-value-as-number e)))
             (first  (+ 2 (position value list :test #'equalp)))
             (last   (+ 2 (position value list :test #'equalp :from-end t))))
        (values first last))
      (values 2 2))))


;;; Munkalap egy területének kimásolása listák listájaként.
(defun extract-cols (worksheet titles row-start &optional (row-end nil))
  (loop for row from row-start
        for list = (mapcar #'(lambda (title)
                               (?value2 (range worksheet (title-column worksheet title) row))) ; XRANGE !
                           titles)
        until (if row-end
                (> row row-end)
                (null (first list)))
        collect list))


;;; Listák listájának transzponálása.
(defun transpose-tree (tree)
  (loop for i from 0 below (length (first tree)) collecting
        (mapcar #'(lambda (element)
                    (nth i element))
                tree)))


;;; Ürítendõ és magában másolandó adatok.
(defparameter *copies*
  '(("SZK" "SZK")
    ("Bérrendsz. csop név" "Besorolás")
    ("Esélyteremtési illetményrészre" "Esély_jogsz_alap")))


;;; MUNKA lap ürítése.
(defun flush-wip-sheet (workbook)
;  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
  (with-workbook (:use workbook :wsvars (ws-sap ws-wip ws-help))
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
      (dolist (column columns)
        (when column
          (setf (?value2 (range ws-wip column 2 column last-row)) ""))))))


;;; Egyedi SZTSZ-ek másolása a MUNKA lapra.
(defun copy-unique-bns (workbook)
;  (with-workbook (workbook :wsvars (ws-sap ws-wip))
  (with-workbook (:use workbook :wsvars (ws-sap ws-wip))
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


#|(defparameter *sap-it08* '(16 18 30 36))
(defparameter *sap-it14* '(20 22 31 35))|#
(defparameter *sap-it08* '(16 18 31 37 40))  ;   kód   összeg   vége   kezdete   címzetes
(defparameter *sap-it14* '(20 22 32 36 40))  ;   kód   összeg   vége   kezdete   címzetes


;;; Bérelem adatok összegyûjtése az elsõ és utolsó sor között.
(defun collect-fee-data (worksheet row-start row-end)
  (flet ((collect (list row)
           (mapcar #'(lambda (col)
                       (xcell worksheet col row))
                   list)))
    (loop for row from row-start upto row-end
          collecting (collect *sap-it08* row)
          collecting (collect *sap-it14* row))))


;;; Bérelem adatok (összeg, kezdete-vége dátumok) másolása MUNKA lapra.
(defun arrange-fees (workbook)
;  (with-workbook (workbook :wsvars (ws-sap ws-wip ws-help))
  (with-workbook (:use workbook :wsvars (ws-sap ws-wip ws-help))
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
                          (declare (ignore code-v))
                          ;; Copy sum
                          (setf (xcell ws-wip name row) sum-v)
                          (let ((ends-col   (and ends   (resolve-column-designator ends ws-wip)))
                                (starts-col (and starts (resolve-column-designator starts ws-wip))))
                            ;; Copy end date
                            (when (and ends-col ends-v)
                              (setf (xcell ws-wip ends-col row) ends-v))
                            ;; Copy start date
                            (when (and starts-col starts-v)
                              (setf (xcell ws-wip starts-col row) starts-v))))))))))))))


;;; Egyéb megadott adatok másolása a MUNKA lapra (ld. *COPIES* lista.
(defun straight-copy-values (workbook)
;  (with-workbook (workbook :wsvars (ws-sap ws-wip))
  (with-workbook (:use workbook :wsvars (ws-sap ws-wip))
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


#|
;; ENNEK A *CODEREF* KULCSAI KÖZÖTT KÉNE KERESGÉLNIE!
(defun find-key (val list)
  (first
   (find val list :key #'second :test #'string-equal)))
|#


;;; Jogszabályi hivatkozás szövegének generálása.
(defun construct-code-reference (workbook)
;  (with-workbook (workbook :wsvars (ws-sap ws-wip))
  (with-workbook (:use workbook :wsvars (ws-sap ws-wip))
    ;; Iterate on BNs from the WIP sheet
    (loop for row from 2
          for bn = (xcell ws-wip "SZTSZ" row)
          until (null bn)
          doing
          ;; Find BN rows on the SAP sheet
          (multiple-value-bind (start stop)
              (value-rows ws-sap "SZTSZ" bn)
            ;; Collect fee element codes
            (let* ((*coderefs*    *puetv-b1b2b8b9-illetmenyelemek-2025sep*)
                   (*codenames*   *puetv-megnevezes-2025sep*)
                   (*defined-tvs* (if (string= (xcell ws-wip "Besorolás" row) "Gyakornok")
                                    '("1puetv" "2puetv-vhr")
                                    '("1puetv")))
                   (codes         (loop for row from start upto stop
                                        collecting (xcell ws-sap (first *sap-it08*) row)
                                        collecting (xcell ws-sap (first *sap-it14*) row)))
                   ;; Get element records
                   (fees          (fees :codes codes
                                        :ps    (xcell ws-wip "SZK" row)
                                        :lab   (xcell ws-wip "Besorolás" row)
                                        :eila  (xcell ws-wip "Esély_jogsz_alap" row)))
                   ;; Construct text
                   (text          (convert fees)))
              ;; Copy text to the WIP sheet
              (setf (xcell ws-wip "Jogszabályi hivatkozás" row)
                    text))))))


;;; ---------------------------------------------------------------


;;; main();
(defun run ()
  (let ((file (second sys:*line-arguments-list*)))
    (when file
      (with-workbook (:wbook wbook :open file :save t :close t)
        (print "Korábbi adatok törlése")
        (flush-wip-sheet wbook)
        (print "SZTSZ-ek")
        (copy-unique-bns wbook)
        (print "Bérelemek (összeg, érvényesség kezdete, vége)")
        (arrange-fees wbook)
        (print "Személyi kör, besorolás, esélyteremtési illetményrész jogalapja")
        (straight-copy-values wbook)
        (print "Jogszabályi hivatkozás")
        (construct-code-reference wbook)
        )
      (format t "~%Fájl mentve: ~a~%KÉSZ~%" file))))


(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\1.0_Adatbázis táblázat.xlsx")
;(defparameter *f* "c:\\Users\\cselovszkid\\common-lisp\\cref\\1.0_Adatbázis táblázat_22.xlsx")


(defun test ()
  (let ((sys:*line-arguments-list* (list nil *f*)))
    (run)))
|#