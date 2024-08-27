(require "automation")

(defsystem "cref"
  :description "Code ref generator"
  :author      "Denes Cselovszki <denes.cselovszki@gmail.com>"
  :version     "0.21b"
  :depends-on  ("ccom" "cl-ppcre")
 :serial      t
  :components  ((:file "package")
                (:file "fli-templates")
                (:file "cref")))
