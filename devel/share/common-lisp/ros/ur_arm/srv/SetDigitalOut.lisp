; Auto-generated. Do not edit!


(cl:in-package ur_arm-srv)


;//! \htmlinclude SetDigitalOut-request.msg.html

(cl:defclass <SetDigitalOut-request> (roslisp-msg-protocol:ros-message)
  ((number
    :reader number
    :initarg :number
    :type cl:fixnum
    :initform 0)
   (level
    :reader level
    :initarg :level
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetDigitalOut-request (<SetDigitalOut-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDigitalOut-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDigitalOut-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_arm-srv:<SetDigitalOut-request> is deprecated: use ur_arm-srv:SetDigitalOut-request instead.")))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <SetDigitalOut-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_arm-srv:number-val is deprecated.  Use ur_arm-srv:number instead.")
  (number m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <SetDigitalOut-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_arm-srv:level-val is deprecated.  Use ur_arm-srv:level instead.")
  (level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDigitalOut-request>) ostream)
  "Serializes a message object of type '<SetDigitalOut-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'level) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDigitalOut-request>) istream)
  "Deserializes a message object of type '<SetDigitalOut-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'level) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDigitalOut-request>)))
  "Returns string type for a service object of type '<SetDigitalOut-request>"
  "ur_arm/SetDigitalOutRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDigitalOut-request)))
  "Returns string type for a service object of type 'SetDigitalOut-request"
  "ur_arm/SetDigitalOutRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDigitalOut-request>)))
  "Returns md5sum for a message object of type '<SetDigitalOut-request>"
  "a259c36a856871635403442ff20cd9c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDigitalOut-request)))
  "Returns md5sum for a message object of type 'SetDigitalOut-request"
  "a259c36a856871635403442ff20cd9c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDigitalOut-request>)))
  "Returns full string definition for message of type '<SetDigitalOut-request>"
  (cl:format cl:nil "uint8 number~%bool level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDigitalOut-request)))
  "Returns full string definition for message of type 'SetDigitalOut-request"
  (cl:format cl:nil "uint8 number~%bool level~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDigitalOut-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDigitalOut-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDigitalOut-request
    (cl:cons ':number (number msg))
    (cl:cons ':level (level msg))
))
;//! \htmlinclude SetDigitalOut-response.msg.html

(cl:defclass <SetDigitalOut-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetDigitalOut-response (<SetDigitalOut-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDigitalOut-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDigitalOut-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_arm-srv:<SetDigitalOut-response> is deprecated: use ur_arm-srv:SetDigitalOut-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDigitalOut-response>) ostream)
  "Serializes a message object of type '<SetDigitalOut-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDigitalOut-response>) istream)
  "Deserializes a message object of type '<SetDigitalOut-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDigitalOut-response>)))
  "Returns string type for a service object of type '<SetDigitalOut-response>"
  "ur_arm/SetDigitalOutResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDigitalOut-response)))
  "Returns string type for a service object of type 'SetDigitalOut-response"
  "ur_arm/SetDigitalOutResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDigitalOut-response>)))
  "Returns md5sum for a message object of type '<SetDigitalOut-response>"
  "a259c36a856871635403442ff20cd9c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDigitalOut-response)))
  "Returns md5sum for a message object of type 'SetDigitalOut-response"
  "a259c36a856871635403442ff20cd9c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDigitalOut-response>)))
  "Returns full string definition for message of type '<SetDigitalOut-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDigitalOut-response)))
  "Returns full string definition for message of type 'SetDigitalOut-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDigitalOut-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDigitalOut-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDigitalOut-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetDigitalOut)))
  'SetDigitalOut-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetDigitalOut)))
  'SetDigitalOut-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDigitalOut)))
  "Returns string type for a service object of type '<SetDigitalOut>"
  "ur_arm/SetDigitalOut")