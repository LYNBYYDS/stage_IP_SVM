# stage_IP_SVM
<img src="https://upload.wikimedia.org/wikipedia/fr/c/cd/Logo_Sorbonne_Universit%C3%A9.png"  width="30%" height="30%">
<img src="https://sciences.sorbonne-universite.fr/sites/default/files/styles/2400xauto/public/media/2020-09/logo_lip6.png?itok=gizixtll"  width="20%" height="30%">

## Table of Contents

- [stage\_IP\_SVM](#stage_ip_svm)
  - [Table of Contents](#table-of-contents)
  - [Introduction to Internship Experience](#introduction-to-internship-experience)
  - [Getting Started](#getting-started)
    - [Setting Up and Running the Project Locally](#setting-up-and-running-the-project-locally)
      - [Prerequisites](#prerequisites)
      - [Installation](#installation)
        - [Python Part (Training SVM Model):](#python-part-training-svm-model)
        - [VHDL Part (Hardware Design):](#vhdl-part-hardware-design)
  - [Git Repository Directory](#git-repository-directory)
  - [C script usage](#c-script-usage)
  - [Support](#support)
  - [Authors and acknowledgment](#authors-and-acknowledgment)


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
│   │   train.py (First part code)
│   │   Train.xlsx (All the data can be used to train the model)
│
└───C_script
|   |   HELPER_Exponential.c
|   |   HELPER_TOP.c
│   
└───code (All the code for the second parts)
│   │   
│   │   
│   │
│   └───source (Last version of all the source code .hdl)
│   │   │   x
│   │   │   x
│   │   │   ...
│   │
│   └───testbench (Last version of all the testbench code .vhd)
│       │   x
│       │   x
│       │   ...
│      
```
## C script usage
In this project, we provide C scripts that significantly simplifie the generation of VHDL code for various components. The script's primary purpose is to streamline the creation of VHDL files, making it an efficient and error-reducing tool.

__Benefits of the C Script__
Our C script offers several advantages for VHDL code generation:

__Efficiency:__ The exponential block, for instance, involves a vast number of possible inputs. By using our script, you can generate large lookup tables (LUTs) swiftly and accurately. This automation prevents manual errors and ensures precision.

__Flexibility:__ The number of support vectors in machine learning models like SVMs can vary. Instead of modifying VHDL code manually each time, our C script allows you to adjust this parameter effortlessly.

__Ease of Implementation:__ The script simplifies the process of implementing hardware components for your project, making it more accessible to both novice and experienced developers.

__How to Use the C Script__
Follow these steps to utilize the C script for VHDL code generation:

- Navigate to the Script Directory: Open your command-line interface or terminal and go to the directory containing the C script.

    ```cd /gitdir/C_script```
- Compile the Script: Use a C compiler to compile the script. For instance, with GCC, compile the script with the following command:

    ```gcc script_name.c -o script_name```

    Replace script_name.c with the script's actual filename and script_name with your desired executable name.
- Run the Executable: After compilation, execute the script by running the compiled executable:
    
    ```./script_name```

    The script will guide you through the process of generating VHDL files, including any necessary input or parameter adjustments.


## Support
- Email : liyongmb@gmail.com
- Discord : lyyyds

## Authors and acknowledgment

- Authorship : Yong LI - Intern and Project Lead
- Acknowledgments : I extend my sincere gratitude to GRANADO Bertrand, my project guide, for his mentorship, expert guidance, and unwavering support throughout the internship.
