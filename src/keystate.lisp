(in-package :cl-user)
(defpackage versus.keystate
  (:use :cl :lispbuilder-sdl)
  (:import-from :lispbuilder-sdl
   :key=)
  (:import-from :alexandria
   :with-gensyms)
  (:import-from :versus.util
                :nmapslot))

(in-package :versus.keystate)


(defmacro defkeystate (name &rest keymaps)
  (with-gensyms (key key-press key-state)
    `(progn
       (defclass ,name ()
         ,(mapcar (lambda (x) `(,(car x) :initform 0)) keymaps))
       (defmethod update-key-state (,key ,key-press (,key-state ,name))
         (with-slots ,(mapcar #'car keymaps) ,key-state
           (cond ,@(mapcar (lambda (keys)
                             `((sdl:key= ,key ,(cadr keys))
                               (setf ,(car keys) ,key-press)))
                           keymaps))))
       (defmethod next-key-state ((,key-state ,name))
         (nmapslot (lambda (x) (mod x 2)) ,key-state)))))

(defkeystate titechfes-key
    (right :sdl-key-right)
  (left :sdl-key-left)
  (jump :sdl-key-c)
  (down :sdl-key-down)
  (up :sdl-key-up)
  (dash :sdl-key-lshift)
  (shot :sdl-key-x)
  (weapon :sdl-key-z)
  (start :sdl-key-return))
