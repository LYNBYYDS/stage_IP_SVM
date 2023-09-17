# stage_IP_SVM
<img src="https://upload.wikimedia.org/wikipedia/fr/c/cd/Logo_Sorbonne_Universit%C3%A9.png"  width="30%" height="30%">
<img src="https://sciences.sorbonne-universite.fr/sites/default/files/styles/2400xauto/public/media/2020-09/logo_lip6.png?itok=gizixtll"  width="20%" height="30%">

## Table of Contents

1. [Introduction to Internship Experience](#Introduction-to-Internship-Experience)
2. [Getting Started](#Getting-Started)
    - [Setting Up and Running the Project Locally](#Setting-Up-and-Running-the-Project-Locally)
        * [Prerequisites:](#Prerequisites)
        * [Installation](#Installation)
3. [Git Repository Directory](#Git-Repository-Directory)
4. [Authors and acknowledgment](#Authors-and-acknowledgment)
5. [Support](#Support)
6. [Roadmap](#Roadmap)


## Introduction to Internship Experience

During my recent internship, I had the valuable opportunity to immerse myself in the world of hardware design and machine learning. This internship was a pivotal step in my academic and professional journey, allowing me to apply classroom knowledge to real-world projects and gain practical insights into the fields of VHDL (VHSIC Hardware Description Language) and Support Vector Machines (SVMs).Over the course of this internship, I engaged in a multifaceted project that spanned the development of hardware models, the implementation of machine learning algorithms, and the synthesis of hardware components. hrough this internship, I not only honed my technical skills but also gained valuable insights into the synergy between software and hardware in the realm of machine learning. I look forward to sharing the knowledge and experiences I have acquired, with the hope that they will contribute to the broader understanding of these exciting fields.

## Getting Started

### Setting Up and Running the Project Locally

#### Prerequisites
- Python 3.6 or higher installed on your local machine. Also some packages are needed. 
- VHDL Environment: One critical aspect of this project involves working extensively with VHDL code. To effectively handle this aspect, it is imperative to have a well-configured VHDL development environment. For instance, I have employed Xilinx Vivado, a powerful tool for VHDL design and synthesis, to facilitate VHDL coding and testing. However, it's worth noting that there are various other VHDL development environments available, each with its unique features and advantages. Regardless of the specific environment chosen, a robust VHDL setup is fundamental to the successful execution of VHDL-related tasks within the projec
- C Environment(optional) : Some sections of the VHDL code in this project are extensive and complex, making manual coding impractical. To address this challenge, I've leveraged C scripting to automate the generation of certain VHDL code segments. Having a C development environment is beneficial if you wish to explore or modify these scripts. However, if you're not familiar with C or prefer an alternative approach, you can also consider coding and automating these tasks using languages like Python or other programming languages of your choice. This flexibility ensures that contributors with various programming backgrounds can actively participate in the project's VHDL development.
- Git (optional, but recommended for cloning the project repository).

Python packages used : 
- Pandas: For data manipulation and analysis, especially when working with tabular data.

    ```pip install pandas```

- Scikit-Learn (sklearn): For machine learning tasks, including SVMs and other algorithms.

    ```pip install scikit-learn```

#### Installation
##### Python Part (Training SVM Model):

__IDE:__ I recommend using Spyder as your Python IDE for this part.

__Run Training Script:__
- Open Spyder.
- Navigate to the project directory.
- Locate the train.py Python script for training the SVM model.(In the folder python)
- Run the train.py script by executing it.
- Check Output: After running the script, check the generated output files or console output for the results of the SVM model training.

##### VHDL Part (Hardware Design):

__Vivado Installation:__ Ensure that you have Xilinx Vivado installed on your system.

__Project Files:__ The VHDL source files and simulation files are available in the code folder of the project.

__Open Project in Vivado:__
- Launch Vivado.
- Open the project by navigating to the project's top-level directory and selecting the project file (e.g., project_name.xpr).

__Synthesize and Simulate:__

- Within Vivado, synthesize and simulate the VHDL design using the tools and features provided by Vivado.
- Refer to Vivado's documentation or online resources for detailed instructions on synthesis and simulation.

## Git Repository Directory
```
stage_IP_SVM
│   README.md
│   Report of Intership
│   
└───python
│   │   x
│   │   x
│   │
│   └───x
│       │   x
│       │   x
│       │   ...
│   
└───code
│   │   x
│   │   x
│   │
│   └───source
│   │   │   x
│   │   │   x
│   │   │   ...
│   │
│   └───testbench
│       │   x
│       │   x
│       │   ...
│      
```

## Support
- Email : liyongmb@gmail.com
- Discord : lyyyds

## Authors and acknowledgment

- Authorship : Yong LI - Intern and Project Lead
- Acknowledgments : I extend my sincere gratitude to GRANADO Bertrand, my project guide, for his mentorship, expert guidance, and unwavering support throughout the internship.
