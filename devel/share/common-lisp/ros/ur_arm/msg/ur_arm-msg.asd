
(cl:in-package :asdf)

(defsystem "ur_arm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Joints" :depends-on ("_package_Joints"))
    (:file "_package_Joints" :depends-on ("_package"))
  ))