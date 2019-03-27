;; Auto-generated. Do not edit!


(when (boundp 'ur_arm::SetDigitalOut)
  (if (not (find-package "UR_ARM"))
    (make-package "UR_ARM"))
  (shadow 'SetDigitalOut (find-package "UR_ARM")))
(unless (find-package "UR_ARM::SETDIGITALOUT")
  (make-package "UR_ARM::SETDIGITALOUT"))
(unless (find-package "UR_ARM::SETDIGITALOUTREQUEST")
  (make-package "UR_ARM::SETDIGITALOUTREQUEST"))
(unless (find-package "UR_ARM::SETDIGITALOUTRESPONSE")
  (make-package "UR_ARM::SETDIGITALOUTRESPONSE"))

(in-package "ROS")





(defclass ur_arm::SetDigitalOutRequest
  :super ros::object
  :slots (_number _level ))

(defmethod ur_arm::SetDigitalOutRequest
  (:init
   (&key
    ((:number __number) 0)
    ((:level __level) nil)
    )
   (send-super :init)
   (setq _number (round __number))
   (setq _level __level)
   self)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:level
   (&optional __level)
   (if __level (setq _level __level)) _level)
  (:serialization-length
   ()
   (+
    ;; uint8 _number
    1
    ;; bool _level
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _number
       (write-byte _number s)
     ;; bool _level
       (if _level (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _number
     (setq _number (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _level
     (setq _level (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ur_arm::SetDigitalOutResponse
  :super ros::object
  :slots ())

(defmethod ur_arm::SetDigitalOutResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ur_arm::SetDigitalOut
  :super ros::object
  :slots ())

(setf (get ur_arm::SetDigitalOut :md5sum-) "a259c36a856871635403442ff20cd9c6")
(setf (get ur_arm::SetDigitalOut :datatype-) "ur_arm/SetDigitalOut")
(setf (get ur_arm::SetDigitalOut :request) ur_arm::SetDigitalOutRequest)
(setf (get ur_arm::SetDigitalOut :response) ur_arm::SetDigitalOutResponse)

(defmethod ur_arm::SetDigitalOutRequest
  (:response () (instance ur_arm::SetDigitalOutResponse :init)))

(setf (get ur_arm::SetDigitalOutRequest :md5sum-) "a259c36a856871635403442ff20cd9c6")
(setf (get ur_arm::SetDigitalOutRequest :datatype-) "ur_arm/SetDigitalOutRequest")
(setf (get ur_arm::SetDigitalOutRequest :definition-)
      "uint8 number
bool level
---

")

(setf (get ur_arm::SetDigitalOutResponse :md5sum-) "a259c36a856871635403442ff20cd9c6")
(setf (get ur_arm::SetDigitalOutResponse :datatype-) "ur_arm/SetDigitalOutResponse")
(setf (get ur_arm::SetDigitalOutResponse :definition-)
      "uint8 number
bool level
---

")



(provide :ur_arm/SetDigitalOut "a259c36a856871635403442ff20cd9c6")


