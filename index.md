Jacob Panikulam
================

# My Current Projects

## [SubjuGator](http://subjugator.org/)
I was named SubjuGator software lead at the end of August 2015. Since then, we've begun a massive campaign to re-implement all of the legacy code, and build a much more autonomous vehicle. Note: **all** of this work was done by a handful of undergraduate students at UF in the last year.

Current features include:

* An alarm system for sharing alarm states across the various drivers and planners running on the robot.
    * This allows us to detect thruster failures, and adjust the controller/thruster mapper so that the sub remains stable

* An internally implemented underwater dynamics simulator including
    * Simulated [imaging sonar](http://sites.garmin.com/en-US/panoptix/) - We could really use one of these in real life!
    * Simulated [Doppler Velocity Log](http://www.rdinstruments.com/navigator.aspx)
    * Simulated cameras (Passing data over ROS messages, directly from their own framebuffers, sonar works the same way)
    * Underwater dynamics, including simple water resistance
        * Soon-to-be-developed: GPU-estimated surface area estimation for more accurate water resistance
    * Many, many visualization widgets for viewing the behavior of the sub
    * Unit-tests *in* simulation - running physics-only simulation to prove the sub's functionality

* Monte-carlo tools for randomized simulated testing
    * Simulate many thousands of randomized start positions to test a controller
        * Verify the stability of the controller, i.e. after `T` seconds, the sub remains within an n-ball of radius `r`, with less than `epsilon` distance from the targeted point
    * Determine optimal gains in simulation via Monte-Carlo (LQR is not sufficient due to thrust constraints and nonlinear dynamics)
    * And optimize any other item that one might choose

* Stereo-imaging for 3D point cloud generation
    * Used for mapping, obstacle avoidance
    * Used for object recognition and depth estimation
    * Eventually to be integrated into state estimation

* Continuous integration using SemaphoreCI
* Thorough unit-tests (Though, we're not quite at 100% coverage)
* Thruster mapping using sequential-last-squares programming, which we use as a bounded least-squares solver
* ROS-drivers for VideoRay M5 thrusters

* 3D motion planning
* 3D traversability map generated from sensed information, not hard-coded
* [Highly parallel motion planning](http://dspace.mit.edu/openaccess-disseminate/1721.1/81448) using CUDA
* Model-predictive controller using CVXGEN

### Sensing
* Harris donated a Doppler Velocity Log, a sensor that analyzes the Doppler shift in acoustic returns to estimate the sub's velocity w.r.t. the water column
* Two forward-looking stereo cameras, used to estimate 3D information about the world in front of the sub
* One downward-looking camera, used to look at things below the sub, and do velocity estimation via optical flow (much like an optical mouse in 3D).
* One IMU/Gyro/Magnetometer, used for orientation estimation
* These sensors are fused with an Unscented Kalman Filter to produce a final estimate of vehicle pose

### Control
* We use a [RISE controller](http://ncr.mae.ufl.edu/papers/tro14.pdf), soon to be replaced (this week!) by a neural network controller, coupled with a much more sophisticated LQR-based trajectory generator

### Computer Vision
* Particle-filter based object pose estimation from sequences of 2D images from one camera
* Markov-Random-Field based object segmentation
* Spectral Residual saliency detection (Caveat: This never really worked underwater)
* Semi-direct visual odometry for global pose estimation in real-time from a monocular camera
* 3D detection of objects using RANSAC, and a variety of other clever methods
* Oodles of machine learning!
    * SVM for discrimination of HOG features
    * Neural network for wavelet-based dense segmentation of various obstacles
    * SVM for discrimination using a color-range prior and normalized cross-correlation


## Business and Marketing
* Organized a cooperation with the Florida Fish and Wildlife Commission to analyze largemouth Bass populations in Lake Kingsley
* Organized a cooperation with the UF Seahorse Key research lab to search for "ghost traps" (traps left behind by fishermen that are extremely hazardous to wildlife), and a group of us traveled to the Gulf of Mexico with the sub in April
* Negotiated at $20,000 discount on an imaging sonar, a device vital to underwater navigation
* Organized a $10,000 donation to MIL from rotary club members


After my taking the helm, SubjuGator is almost certainly one of the only places at UF where undergraduates will regularly work with graduate topics such as advanced Kalman Filtering (UKF, EKF, particle filtering), computer vision, machine learning, nonlinear control and optimal motion planning, all on a **real** vehicle that competes.


We have many more lofty goals, but won't discuss them until they are in progress with some genuine likelihood to work.

We are proud that all of our code is open source and publicly available with no restrictions at [github.com/uf-mil/Sub8](https://github.com/uf-mil/Sub8)


## [Propagator](http://mil.ufl.edu/propagator/)
Propagator is an autonomous boat that competes in the AUVSI robo-boat competition. Our team will be competing in the Maritime RobotX competition in Hawaii in 2016.


I implemented a constrained nonlinear control allocation method for our boat's azimuth thrusters by adapting [Tor Johansen's method](http://www.fossen.biz/home/papers/tcst04.pdf) to our needs.

I also did some other things:

* Motion planning using kinodynamic RRT* (So far, this works spectacularly)
* Mapping and obstacle detection using a Velodyne puck
* Object tracking using Velodyne-generated pcl data

With more on the queue once these are complete.

We are proud that our code is fully [open source](www.github.com/uf-mil).


## [CVXBind](https://github.com/jpanikulam/cvxbind)
Automatically generate bindings Boost::Python Python bindings for C-code generated by CVXGEN.


## [Oqulus](http://www.oqulus.net/)
I am the principal computer vision engineer at Sentinel Diagnostic Imaging, with our flagship product being Oqulus. Oqulus is the seminal product from Sentinel Diagnostic Imaging, whose goal is to autonomously provide diagnostic data targeting diseases such as diabetic retinopathy, retinitis pigmentosa, and glaucoma, to find hints of these before they have done irrevocable damage.


I developed a 2D wavelet and neural-network based approach to autonomously segmenting images of the retinal fundus. This is widely considered one of the "holy grails" of the medical imaging community, and the accuracy my method gets (~95% on all tested datasets) is competitive or ahead of the state of the art.


I am currently working on a method for extracting the vessel topology, and autonomously distinguishing arteries from veins. The exact methods used are proprietary to the Oqulus technology, and cannot be discussed in great depth on a webpage.


# Consulting Projects
I started an initiative within the University of Florida Machine Intelligence Lab to provide electronics and software consulting services to local companies and student organizations. We lend skilled students to these groups, and offer our expertise at no cost.


## UF Seahorse Key Research lab
Discussed in the SubjuGator section

## Florida FWC
Discussed in the SubjuGator section

## UF FSAE Team
We are developing a camera-based method for determining side-slip angle for a Formula SAE car. The current plan is to use the Sub's SVO implementation.

## Quarter-Scale Tractor Team
We worked with the UF Quarter-Scale Tractor Team to develop tools for computer-aided navigation for obstacle course traversal.


## UF Rocket Team
We are in talks with the UF rocket team to design and develop software for a robot arm. This arm will be used for their competition in May, as they are required to have their rocket be partially autonomously assembled before launch.




# My Past Projects
## [Amazon Picking Challenge](http://amazonpickingchallenge.org/details.shtml)

I competed with Team Georgia Tech in the Amazon Picking challenge using a Schunk robot with two 7-DOF arms. We came in 10th place, internationally (40+ teams qualified, 28 attended). I designed and integrated the majority of the perception stack, including PCL in C++, Image analysis in MATLAB and various vision and logic components in Python. All of this was done using ROS and the various tools it provides, alongside numerous internally developed tools.

I competed as one of four members of Team Georgia Tech out of GT's Robotics and Intelligent Machines laboratory.

Our code is [open source](https://github.com/ehuang3/apc_ros)

#### Implementation details
Image-similarity metrics are generated using symmetrized Kullback-Leibler divergence (Jensen-Shannon) for initial object recognition in the 2D image. The object is segmented in 2D, and that segmentation is projected onto the point cloud - and is then used as a seed for region-growing 3D segmentation. Then, prerejective sample consensus is used to register our known models of the object to the sensed point cloud, which enables our robot to autonomously grasp the object.


## VisAR
VisAR (Visual Intelligence System via Augmented Reality, I didn't pick the name) uses an Oculus rift to display augmented reality to a user.


We use an FPGA to take in frames from two cameras mounted in front of the Rift, apply a barrel distortion to undo the Oculus Rift's lenses' pincushion distortion, and display that information to the user. At the same time, UI frames are being sent to the FPGA by a computer, and these are being overlayed with transparency onto the user's view.


I developed a Vispy/OpenGL based rendering engine called "libVisar" that is designed to make simple Oculus Rift applications very easy to make in Python. The idea is that roboticists or other engineers without an OpenGL/DirectX background, and without access to Unity can create Oculus Rift GUI's and data displays for overlay on camera images.


Soon to be open source.


## IEEE2015 Autonomous Robot "Maverick" [Video of Maverick's Arm](http://youtu.be/6lzLW4y0CQY)
I led a 40 member team of undergraduate student engineers, building an autonomous robot for competition in the IEEE Southeastcon Competition. The goal is to build a fully autonomous robot that can navigate a randomized course to draw the word "IEEE" on an etch-a-sketch, rotate a rubix cube, successfully play ["Simon Says"](http://dalpix.com/images/Simon-Game_l.jpg) and then pick up a card. We found this to be too easy, and decided to implement Chess as well.


We used monocular camera SLAM for navigation, a 4-DOF manipulator arm for acting on the environment (Using a second camera for visual servoing), Mecanum wheels for locomotion, an Intel NUC running Ubuntu and ROS Indigo for high-level control, and an XMega128A1U for low-level control.


All of our code is completely [open source](github.com/ufieeehw/IEEE2015). If you are looking to this for inspiration and can't seem to make something work, please feel free to contact me.


For 2016, I have passed on leadership to Ian Van Stralen, with mechanical lead Stephan Strassle.


## [IEEE2014 Autonomous Robot "Mr. Roboto"](http://youtu.be/b_Ijie9VGrQ)
We built a robot for the SoutheastCon competition in March of 2014. The robot had to autonomously drive to each of three blue blocks, wait three seconds, and then fire a dart into a target. We did not know the position of the blue blocks in advance. Most of the other teams relied on following the white lines (inc. Georgia Tech, Duke, etc). We, instead, scavenged a LIDAR from a Roomba (Well, a [Neato XV-11](https://www.youtube.com/watch?v=KnspWPlBM_o)) and navigated using a particle filter.


I implemented a purely computer-vision method for identifying course objectives and determining the position of a target in the camera's field of view. At the beginning of the video, the robot rotates the turret head to visually identify the blue blocks it must drive to. Then, at each block, it servos to point toward the target based on its estimate of the position. Vision is then used to correct the target position estimate, and fire the dart accurately.


## [UF EFTP Bumper Bots](http://imgur.com/a/TH279)
Brandon Grant and I built and programmed a set of remote-controlled bumper cars using RobotC and Lego NXT. "Bumper Bots" were designed for a UF Shands competition, to design a toy for ailing children at Shands hospital. We ended in the top three teams, and the kids adored our robots.


# Talks Given
* "Robotics, a Love Story" at the ACE's UF-hacks in November of 2014 (50+ attendees)
* "The Oculus Rift and You" at ACE's Oculus Rift workshop (80+ attendees)
* "Machine Learning in Robotics" at ACM's Swamphacks 2016 (30+ attendees)
* "Oculus Rift and OpenGL" at the Gator VR dev club
* One of four panelists at ACM's "Getting involved with undergraduate research" panel


# Coursework
Some particularly interesting coursework

## Nonlinear Controls
I took Dr. Dixon's graduate nonlinear control I course, which was a really cool foray into advanced analytical control my final project was an adaptive controller for the Sub.

## Compute Vision for Autonomous Navigation
A course in computer vision and probabilistic methods for navigation, made available by the Technical University of Munich

## Machine Learning for Computer Vision
Another course in vision, focused on machine learning methods, made available by the Technical University of Munich

## Medical Image Analysis
Graduate CS course at UF in medical image analysis. The course teaches methods behind CT and MRI reconstruction, and methods in medical image segmentation/registration.


## Underactuated Robotics
MIT OCW's graduate Under-actuated Robotics course. I've gained a lot from this course, and have been using tools gained in my daily work.


## Convex Optimization
I am also currently working through (Albeit at a much lower priority) Dr. Stephen Boyd's Convex Optimization lectures from Stanford, at the encouragement of my friend Eric.


If you're coming here from MIL, the other courses I suggest are:

[Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra), Skip everything you already know, it's all a lead-up to the important stuff, which happens in the third lecture set.

[MIT OCW Intro to Algorithms](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/)

[Udacity Intro to AI for robotics](https://www.udacity.com/course/artificial-intelligence-for-robotics--cs373)

I gained a huge amount from these. All are free. Don't let anybody make you pay for knowledge on the internet.


# Interests


Above all, I like jokes and movies about space. On the technical side, I am interested in autonomous systems, with preference to vehicles. Or really anything that you can convince me is a cool enough math/software problem. Key words: Perception, controls, autonomous, Linux, python, linear algebra, motion planning, model-predictive control, simulation, microcontrollers.
