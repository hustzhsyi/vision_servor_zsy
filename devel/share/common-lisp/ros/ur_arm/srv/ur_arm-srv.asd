
(cl:in-package :asdf)

(defsystem "ur_arm-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetDigitalOut" :depends-on ("_package_SetDigitalOut"))
    (:file "_package_SetDigitalOut" :depends-on ("_package"))
  ))