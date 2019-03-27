# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ur_arm: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iur_arm:/home/zhsyi/vision_servo_zsy/src/ur_arm/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ur_arm_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_custom_target(_ur_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_arm" "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" ""
)

get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_custom_target(_ur_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_arm" "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_arm
)

### Generating Services
_generate_srv_cpp(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_arm
)

### Generating Module File
_generate_module_cpp(ur_arm
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_arm
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ur_arm_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ur_arm_generate_messages ur_arm_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_dependencies(ur_arm_generate_messages_cpp _ur_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_dependencies(ur_arm_generate_messages_cpp _ur_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_arm_gencpp)
add_dependencies(ur_arm_gencpp ur_arm_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_arm_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_arm
)

### Generating Services
_generate_srv_eus(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_arm
)

### Generating Module File
_generate_module_eus(ur_arm
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_arm
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ur_arm_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ur_arm_generate_messages ur_arm_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_dependencies(ur_arm_generate_messages_eus _ur_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_dependencies(ur_arm_generate_messages_eus _ur_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_arm_geneus)
add_dependencies(ur_arm_geneus ur_arm_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_arm_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_arm
)

### Generating Services
_generate_srv_lisp(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_arm
)

### Generating Module File
_generate_module_lisp(ur_arm
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_arm
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ur_arm_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ur_arm_generate_messages ur_arm_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_dependencies(ur_arm_generate_messages_lisp _ur_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_dependencies(ur_arm_generate_messages_lisp _ur_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_arm_genlisp)
add_dependencies(ur_arm_genlisp ur_arm_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_arm_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_arm
)

### Generating Services
_generate_srv_nodejs(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_arm
)

### Generating Module File
_generate_module_nodejs(ur_arm
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_arm
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ur_arm_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ur_arm_generate_messages ur_arm_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_dependencies(ur_arm_generate_messages_nodejs _ur_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_dependencies(ur_arm_generate_messages_nodejs _ur_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_arm_gennodejs)
add_dependencies(ur_arm_gennodejs ur_arm_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_arm_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm
)

### Generating Services
_generate_srv_py(ur_arm
  "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm
)

### Generating Module File
_generate_module_py(ur_arm
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ur_arm_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ur_arm_generate_messages ur_arm_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/srv/SetDigitalOut.srv" NAME_WE)
add_dependencies(ur_arm_generate_messages_py _ur_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhsyi/vision_servo_zsy/src/ur_arm/msg/Joints.msg" NAME_WE)
add_dependencies(ur_arm_generate_messages_py _ur_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_arm_genpy)
add_dependencies(ur_arm_genpy ur_arm_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_arm_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_arm
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ur_arm_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_arm
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ur_arm_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_arm
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ur_arm_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_arm
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ur_arm_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_arm
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ur_arm_generate_messages_py std_msgs_generate_messages_py)
endif()
