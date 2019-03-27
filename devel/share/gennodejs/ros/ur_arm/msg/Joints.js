// Auto-generated. Do not edit!

// (in-package ur_arm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Joints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.base = null;
      this.shoulder = null;
      this.elbow = null;
      this.wrist1 = null;
      this.wrist2 = null;
      this.wrist3 = null;
    }
    else {
      if (initObj.hasOwnProperty('base')) {
        this.base = initObj.base
      }
      else {
        this.base = 0.0;
      }
      if (initObj.hasOwnProperty('shoulder')) {
        this.shoulder = initObj.shoulder
      }
      else {
        this.shoulder = 0.0;
      }
      if (initObj.hasOwnProperty('elbow')) {
        this.elbow = initObj.elbow
      }
      else {
        this.elbow = 0.0;
      }
      if (initObj.hasOwnProperty('wrist1')) {
        this.wrist1 = initObj.wrist1
      }
      else {
        this.wrist1 = 0.0;
      }
      if (initObj.hasOwnProperty('wrist2')) {
        this.wrist2 = initObj.wrist2
      }
      else {
        this.wrist2 = 0.0;
      }
      if (initObj.hasOwnProperty('wrist3')) {
        this.wrist3 = initObj.wrist3
      }
      else {
        this.wrist3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Joints
    // Serialize message field [base]
    bufferOffset = _serializer.float64(obj.base, buffer, bufferOffset);
    // Serialize message field [shoulder]
    bufferOffset = _serializer.float64(obj.shoulder, buffer, bufferOffset);
    // Serialize message field [elbow]
    bufferOffset = _serializer.float64(obj.elbow, buffer, bufferOffset);
    // Serialize message field [wrist1]
    bufferOffset = _serializer.float64(obj.wrist1, buffer, bufferOffset);
    // Serialize message field [wrist2]
    bufferOffset = _serializer.float64(obj.wrist2, buffer, bufferOffset);
    // Serialize message field [wrist3]
    bufferOffset = _serializer.float64(obj.wrist3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Joints
    let len;
    let data = new Joints(null);
    // Deserialize message field [base]
    data.base = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [shoulder]
    data.shoulder = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elbow]
    data.elbow = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wrist1]
    data.wrist1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wrist2]
    data.wrist2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wrist3]
    data.wrist3 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ur_arm/Joints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '281044fc8b02f4a962bd27f7e019cd01';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 base
    float64 shoulder
    float64 elbow
    float64 wrist1
    float64 wrist2
    float64 wrist3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Joints(null);
    if (msg.base !== undefined) {
      resolved.base = msg.base;
    }
    else {
      resolved.base = 0.0
    }

    if (msg.shoulder !== undefined) {
      resolved.shoulder = msg.shoulder;
    }
    else {
      resolved.shoulder = 0.0
    }

    if (msg.elbow !== undefined) {
      resolved.elbow = msg.elbow;
    }
    else {
      resolved.elbow = 0.0
    }

    if (msg.wrist1 !== undefined) {
      resolved.wrist1 = msg.wrist1;
    }
    else {
      resolved.wrist1 = 0.0
    }

    if (msg.wrist2 !== undefined) {
      resolved.wrist2 = msg.wrist2;
    }
    else {
      resolved.wrist2 = 0.0
    }

    if (msg.wrist3 !== undefined) {
      resolved.wrist3 = msg.wrist3;
    }
    else {
      resolved.wrist3 = 0.0
    }

    return resolved;
    }
};

module.exports = Joints;
