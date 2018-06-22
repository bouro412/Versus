#|
  This file is a part of versus project.
|#

(in-package :cl-user)
(defpackage versus-asd
  (:use :cl :asdf))
(in-package :versus-asd)

(defsystem versus
  :version "0.1"
  :author "Keita Watanabe"
  :license ""
  :depends-on (:lispbuilder-sdl :split-sequence :iterate :alexandria :closer-mop)
  :components ((:module "src"
                :components
                ((:file "view")
                 (:file "app"))))
  
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.org"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op versus-test))))
