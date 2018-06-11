#|
  This file is a part of versus project.
|#

(in-package :cl-user)
(defpackage versus-test-asd
  (:use :cl :asdf))
(in-package :versus-test-asd)

(defsystem versus-test
  :author ""
  :license ""
  :depends-on (:versus
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "versus"))))
  :description "Test system for versus"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
