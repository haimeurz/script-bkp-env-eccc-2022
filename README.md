  <p align="center">
    project_description
    <br />
    <a href="https://gitlab.science.gc.ca/zak000"><strong>MON COMPTE GITLAB »</strong></a>
    <br />
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
On utilise plusieurs packages dans notre environnement linux qui changent beaucoup de variables. Par exemple,
si j'utilise 'loadsurge' cela change le PYTHONPATH dans mon environnement, car PYTHONPATH était vide. Je voudrais un 
script qui retourne tous les variables changés à leurs variables initiales qui ont été sauvergardé initialement dans un
backup. Ce projet a été fait pour ECCC (Environment and Climate Change Canada) durant mon stage en hiver 2022 (2022-01-21)

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [bash](https://www.gnu.org/software/bash/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started
Pour faire fonctionner le script faire rouler run_bkp.sh
### Prerequisites
* none

### Installation
1. Clone the repo
   ```
   git clone git@gitlab.science.gc.ca:zak000/script_bkp_env.git
   ```
2. checkout
   ```
   git checkout -b "nameOfGitRepo"
   ```
3. permissions to execute the file
   ```
   chmod 755 *.sh
   ```
<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage
Usage: . ~/run_bkp.sh [OPTION]

Keep a copy of your initial environment variables and you are also able to reset your variables after you use some

packages that change your initial variables. Pls backup your environment variables first!!!

[OPTION]

  -backup, backup your environment variables

  -reset,  'unset' your current environment variables and set it to the one with you have in your backup

  --help    display this help and exit
  

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

© Haimeur Zakaria , École de technologie supérieure <haimeurz@gmail.com> 

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Haimeur Zakaria-

*Personal Email:*
    <haimeurz@gmail.com>

*Work Email with ECCC:*
    <Zakaria.Haimeur@ec.gc.ca>

* [Gitlab](https://gitlab.science.gc.ca/zak000)
* [Github](https://github.com/haimeurz)
* [LinkedIn](linkedin.com/in/haimeur-zakaria/)




Project Link: [https://gitlab.science.gc.ca/zak000/script_bkp_env](https://gitlab.science.gc.ca/zak000)

<p align="right">(<a href="#top">back to top</a>)</p>

