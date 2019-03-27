;; Auto-generated. Do not edit!


(when (boundp 'ur_arm::Joints)
  (if (not (find-package "UR_ARM"))
    (make-package "UR_ARM"))
  (shadow 'Joints (find-package "UR_ARM")))
(unless (find-package "UR_ARM::JOINTS")
  (make-package "UR_ARM::JOINTS"))

(in-package "ROS")
;;//! \htmlinclude Joints.msg.html


(defclass ur_arm::Joints
  :super ros::object
  :slots (_base _shoulder _elbow _wrist1 _wrist2 _wrist3 ))

(defmethod ur_arm::Joints
  (:init
   (&key
    ((:base __base) 0.0)
    ((:shoulder __shoulder) 0.0)
    ((:elbow __elbow) 0.0)
    ((:wrist1 __wrist1) 0.0)
    ((:wrist2 __wrist2) 0.0)
    ((:wrist3 __wrist3) 0.0)
    )
   (send-super :init)
   (setq _base (float __base))
   (setq _shoulder (float __shoulder))
   (setq _elbow (float __elbow))
   (setq _wrist1 (float __wrist1))
   (setq _wrist2 (float __wrist2))
   (setq _wrist3 (float __wrist3))
   self)
  (:base
   (&optional __base)
   (if __base (setq _base __base)) _base)
  (:shoulder
   (&optional __shoulder)
   (if __shoulder (setq _shoulder __shoulder)) _shoulder)
  (:elbow
   (&optional __elbow)
   (if __elbow (setq _elbow __elbow)) _elbow)
  (:wrist1
   (&optional __wrist1)
   (if __wrist1 (setq _wrist1 __wrist1)) _wrist1)
  (:wrist2
   (&optional __wrist2)
   (if __wrist2 (setq _wrist2 __wrist2)) _wrist2)
  (:wrist3
   (&optional __wrist3)
   (if __wrist3 (setq _wrist3 __wrist3)) _wrist3)
  (:serialization-length
   ()
   (+
    ;; float64 _base
    8
    ;; float64 _shoulder
    8
    ;; float64 _elbow
    8
    ;; float64 _wrist1
    8
    ;; float64 _wrist2
    8
    ;; float64 _wrist3
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _base
       (sys::poke _base (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _shoulder
       (sys::poke _shoulder (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elbow
       (sys::poke _elbow (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wrist1
       (sys::poke _wrist1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wrist2
       (sys::poke _wrist2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wrist3
       (sys::poke _wrist3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _base
     (setq _base (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _shoulder
     (setq _shoulder (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elbow
     (setq _elbow (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wrist1
     (setq _wrist1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wrist2
     (setq _wrist2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wrist3
     (setq _wrist3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ur_arm::Joints :md5sum-) "281044fc8b02f4a962bd27f7e019cd01")
(setf (get ur_arm::Joints :datatype-) "ur_arm/Joints")
(setf (get ur_arm::Joints :definition-)
      "float64 base
float64 shoulder
float64 elbow
float64 wrist1
float64 wrist2
float64 wrist3

")



(provide :ur_arm/Joints "281044fc8b02f4a962bd27f7e019cd01")


