AUTHOR:

Ryan Rizzo

PURPOSE:

Designed and built an Arduino implementation of sonar, using a device that
sweeps back and forth, measuring the distance between the sensor and the nearest object at each
angle. This information is sent back to the computer where it will be visualized live using
Processing

REQUIRMENTS FOR RECONSTRUCTION:
- Access to a 3D-printer
- Access to a lazer cutter
- Posession of a Ultrasonic Distance Sensor
- Posession of a servo motor
- An arduino uno or other microcontroller

FILES:
- UDSBracket.stl:   3d model for the bracket which mounts the ultrasonic distance sensor to the servo
- lBracket.ai:      2.5d model for the bracket which mounts the ultrasonic distance sensor to the servo
- towerRing.ai:     2.5d model for the ring which is used to construct the tower
- towerBracket.ai:  2.5d model for the bracket that attaches your Arduino to the tower
- scaffold.ino:     Arduino code to move servo and send sonar information to serial monitor
- processing.pde:   Processing script to visualize serial data
