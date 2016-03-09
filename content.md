Jacob Panikulam
================

# My Current Projects

## [Subjugator](http://subjugator.org/)
I was named Subjugator software lead at the end of August 2015. Since then, we've begun a massive campaign to re-implement all of the existing code, which has a few target tasks:

Current features include:

* An alarm system for sharing alarm states across the various drivers and planners running on the robot.
* An internally implemented underwater dynamics simulator including
    * Simulated [imaging sonar](http://sites.garmin.com/en-US/panoptix/) - We could really use one of these in real life!
    * Simulated [Doppler Velocity Log](http://www.rdinstruments.com/navigator.aspx)
    * Simulated cameras (Passing data over ROS messages, directly from their own framebuffers, sonar works the same way)
    * Underwater dynamics, including simple water resistance
        * Soon-to-be-developed: GPU-estimated surface area estimation for more accurate water resistance
    * Many, many visualization widgets for viewing the behavior of the sub
    * Unit-tests *in* simulation - running physics-only simulation to prove the sub's functionality

* A monte-carlo tool for randomized simulated testing
    * Simulate many thousands of randomized start positions to test a controller
        * Verify the stability of the controller, i.e. after `T` seconds, the sub remains within an n-ball of radius `r`, with less than `epsilon` distance from the targeted point
    * Deterine optimal gains in simulation via Monte-Carlo (LQR is not sufficient due to thrust constraints and nonlinear dynamics)
    * And optimize any other item that one might choose

* Continuous integration using SemaphoreCI
* Thorough unit-tests (Though, we're not quite at 100% coverage)
* Thruster mapping using slsqp, which we use as a bounded least-squares solver
* ROS-drivers for VideoRay M5 thrusters

Some current projects include:
* 3D motion planning
* 3D traversability map generated from sensed information, not hardcoded
* [Highly parallel motion planning](http://dspace.mit.edu/openaccess-disseminate/1721.1/81448) using CUDA
* Model-predictive controller using CVXGEN

We have many more, but won't discuss them until they are in progress.

## [Propagator](http://mil.ufl.edu/propagator/)
Propagator is an autonomous boat that competes in the AUVSI robo-boat competition. Our team will be competing in the Maritime RobotX competition in Hawaii in 2016.


I implemented a constrained nonlinear control allocation method for our boat's azimuth thrusters by adapting [Tor Johansen's method](http://www.fossen.biz/home/papers/tcst04.pdf) to our needs.

There are a few current projects I am working on or managing, in parallel:

* Motion planning using kinodynamic RRT* (So far, this works spectacularly)
* Mapping and obstacle detection using a Velodyne puck (We finally got out Velodyne about two weeks ago)
* Object tracking using Velodyne-generated pcl data

With more on the queue once these are complete.

Our code is fully [open source](www.github.com/uf-mil).


## [CVXBind](https://github.com/jpanikulam/cvxbind)
Automatically generate bindings Boost::Python Python bindings for C-code generated by CVXGEN.


## [Oqulus](http://www.oqulus.net/)
I am the principle computer vision engineer at Sentinel Diagnostic Imaging, with our flagship product being Oqulus. Oqulus is the seminal product from Sentinel Diagnostic Imaging, whose goal is to autonomously provide diagnostic data targeting diseases such as diabetic retinopathy, retinitis pigmentosa, and glaucoma, to find hints of these before they have done irrevocable damage.


I developed a 2D wavelet and neural-network based approach to autonomously segmenting images of the retinal fundus.


I am currently working on a method for extracting the vessel topology, and autonomously distinguishing arteries from veins. The exact methods used are proprietary to the Oqulus technology, and cannot be discussed in great depth on a webpage.


# Consulting Projects
I started an initiative within the University of Florida IEEE student section to provide electronics and software consulting services to local companies and student organizations. We lend skilled students to these groups, and offer our expertise at no cost.


## Quarter-Scale Tractor Team
We are working with the UF Quarter-Scale Tractor Team to develop tools for computer-aided navigation for obstacle course traversal.


## UF Rocket Team
We are in talks with the UF rocket team to design and develop software for a robot arm. This arm will be used for their competition in May, as they are required to have their rocket be partially autonomously assembled before launch.


# My Past Projects
## [Amazon Picking Challenge](http://amazonpickingchallenge.org/details.shtml)

I competed with Team Georgia Tech in the Amazon Picking challenge using a Schunk robot with two 7-DOF arms. We came in 10th place, internationally (40+ teams qualified, 28 attended). I designed and integrated the majority of the perception stack, including PCL in C++, Image analysis in MATLAB and various vision and logic components in Python. All of this was done using ROS and the various tools it provides, alongside numerous internally developed tools.

I competed as one of four members of Team Georgia Tech out of GT's Robotics and Intelligent Machines laboratory.

Our code is [open source](https://github.com/ehuang3/apc_ros)

#### Implementation details
Image-similarity metrics are generated using symmetrized Kullbeck-Leibler divergence (Jensen-Shannon) for initial object recognition in the 2D image. The object is segmented in 2D, and that segmentation is projected onto the point cloud - and is then used as a seed for region-growing 3D segmentation. Then, prerejective sample consensus is used to register our known models of the object to the sensed point cloud, which enables our robot to autonomously grasp the object.


## VisAR
VisAR (Visual Intelligence System via Augmented Reality, I didn't pick the name) uses an Oculus rift to display augmented reality to a user.


We use an FPGA to take in frames from two cameras mounted in front of the Rift, apply a barrel distortion to undo the Oculus Rift's lenses' pincushion distortion, and display that information to the user. At the same time, UI frames are being sent to the FPGA by a computer, and these are being overlayed with transparency onto the user's view.


I developed a Vispy/OpenGL based rendering engine called "libVisar" that is designed to make simple Oculus Rift applications very easy to make in Python. The idea is that roboticists or other engineers without an OpenGL/DirectX background, and without access to Unity can create Oculus Rift GUI's and data displays for overlay on camera images.


Soon to be open source.


## IEEE2015 Autonomous Robot "Maverick" [Video of Maverick's Arm](http://youtu.be/6lzLW4y0CQY)
I led a 40 member team of undergraduate student engineers, building an autonomous robot for competition in the IEEE Southeastcon Competition. The goal is to build a fully autonomous robot that can navigate a randomized course to draw the word "IEEE" on an etch-a-sketch, rotate a rubix cube, successfully play ["Simon Says"](http://dalpix.com/images/Simon-Game_l.jpg) and then pick up a card. We found this to be too easy, and decided to implement Chess as well.


We used monocular camera SLAM for navigation, a 4-DOF manipulator arm for acting on the environment (Using a second camera for visual servoing), mecanum wheels for locomotion, an Intel NUC running Ubuntu and ROS Indigo for high-level control, and an XMega128A1U for low-level control.


All of our code is completely [open source](github.com/ufieeehw/IEEE2015). If you are looking to this for inspiration and can't seem to make something work, please feel free to contact me.


For 2016, I have passed on leadership to Ian Van Stralen, with mechanical lead Stephan Strassle.


## [IEEE2014 Autonomous Robot "Mr. Roboto"](http://youtu.be/b_Ijie9VGrQ)
We built a robot for the SoutheastCon competition in March of 2014. The robot had to autonomously drive to each of three blue blocks, wait three seconds, and then fire a dart into a target. We did not know the position of the blue blocks in advance. Most of the other teams relied on following the white lines (inc. Georgia Tech, Duke, etc). We, instead, scavenged a LIDAR from a Roomba (Well, a [Neato XV-11](https://www.youtube.com/watch?v=KnspWPlBM_o)) and navigated using a particle filter.


I implemented a purely computer-vision method for identifying course objectives and determining the position of a target in the camera's field of view. At the beginning of the video, the robot rotates the turret head to visually identify the blue blocks it must drive to. Then, at each block, it servos to point toward the target based on its estimate of the position. Vision is then used to correct the target position estimate, and fire the dart accurately.


## [UF EFTP Bumper Bots](http://imgur.com/a/TH279)
Brandon Grant and I built and programmed a set of remote-controlled bumper cars using RobotC and Lego NXT. "Bumper Bots" were designed for a UF Shands competition, to design a toy for ailing children at Shands hospital. We ended in the top three teams, and the kids adored our robots.


# Coursework

## Nonlinear Controls
I am currently taking Dr. Warren Dixon's graduate nonlinear controls course. So far, it has been largely a review of Tedrake's underactuated robotics.

## Medical Image Analysis
Graduate CS course at UF in medical image analysis. The course teaches methods behind CT and MRI reconstruction, and methods in medical image segmentation/registration.


## Underactuated Robotics
MIT OCW's graduate Underactuated Robotics course. I've gained a lot from this course, and have been using tools gained in my daily work.


## Convex Optimization
I am also currently working through (Albeit at a much lower priority) Dr. Stephen Boyd's Convex Optimization lectures from Stanford, at the encouragement of my friend Eric.


If you're coming here from MIL, the other courses I suggest are:

[Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra), Skip everything you already know, it's all a lead-up to the important stuff, which happens in the third lecture set.

[MIT OCW Intro to Algorithms](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/)

[Udacity Intro to AI for robotics](https://www.udacity.com/course/artificial-intelligence-for-robotics--cs373)

I gained a huge amount from these. All are free. Don't let anybody make you pay for knowledge on the internet.


# Interests


Above all, I like jokes and movies about space. On the technical side, I am interested in autonomous systems, with preference to vehicles. Or really anything that you can convince me is a cool enough math/software problem. Key words: Perception, controls, autonomous, Linux, python, linear algebra, motion planning, model-predictive control, simulation, microcontrollers.