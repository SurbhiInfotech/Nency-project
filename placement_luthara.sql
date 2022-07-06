-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 11:42 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `placement_luthara`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cid` int(5) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `about` varchar(100) DEFAULT NULL,
  `contactno` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cid`, `cname`, `about`, `contactno`) VALUES
(1, 'sugar', 'ghggffg', '8980535112'),
(2, 'king', 'hfhd', 'ghd');

-- --------------------------------------------------------

--
-- Table structure for table `coodinater`
--

CREATE TABLE `coodinater` (
  `cid` int(5) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coodinater`
--

INSERT INTO `coodinater` (`cid`, `email`, `password`) VALUES
(1, 'luthara@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `hiring`
--

CREATE TABLE `hiring` (
  `hid` int(5) NOT NULL,
  `cid` int(5) NOT NULL,
  `desioffer` varchar(100) DEFAULT NULL,
  `roles` varchar(50) DEFAULT NULL,
  `othrequirement` varchar(50) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `sector` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `jdate` varchar(10) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studadditionalqualification`
--

CREATE TABLE `studadditionalqualification` (
  `aqid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `addqualification` varchar(50) DEFAULT NULL,
  `cmatscore` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` int(5) NOT NULL,
  `enrollno` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `enrollno`, `email`, `password`) VALUES
(1, '123', 'krishna@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `studentapply`
--

CREATE TABLE `studentapply` (
  `applyid` int(5) NOT NULL,
  `cid` int(5) DEFAULT NULL,
  `sid` int(5) DEFAULT NULL,
  `interview` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studextraachievement`
--

CREATE TABLE `studextraachievement` (
  `aid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `exactivity` varchar(20) DEFAULT NULL,
  `specificachieve` varchar(20) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studgraduation`
--

CREATE TABLE `studgraduation` (
  `gid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `gdegree` varchar(20) DEFAULT NULL,
  `specialization` varchar(20) DEFAULT NULL,
  `yearcomplete` varchar(10) DEFAULT NULL,
  `cgpi` varchar(10) DEFAULT NULL,
  `percentage` varchar(10) DEFAULT NULL,
  `gclass` varchar(20) DEFAULT NULL,
  `gcollegename` varchar(30) DEFAULT NULL,
  `gcollegeadd` varchar(100) DEFAULT NULL,
  `gcollegecity` varchar(20) DEFAULT NULL,
  `gcollegepincode` varchar(10) DEFAULT NULL,
  `guniversity` varchar(50) DEFAULT NULL,
  `ganygapp` varchar(10) DEFAULT NULL,
  `ggapyear` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studinternship`
--

CREATE TABLE `studinternship` (
  `itid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `siptitle` int(50) DEFAULT NULL,
  `sipcompany` int(50) DEFAULT NULL,
  `sipcity` int(20) DEFAULT NULL,
  `sippincode` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studpostgraduation`
--

CREATE TABLE `studpostgraduation` (
  `pgid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `mbaspecialization` varchar(20) DEFAULT NULL,
  `semonemark` varchar(10) DEFAULT NULL,
  `semteomark` varchar(10) DEFAULT NULL,
  `semthreemark` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studprofile`
--

CREATE TABLE `studprofile` (
  `eid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `surname` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `gname` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `prino` varchar(10) DEFAULT NULL,
  `alterno` varchar(10) DEFAULT NULL,
  `parentno` varchar(10) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `langeng` varchar(20) DEFAULT NULL,
  `langhindi` varchar(20) DEFAULT NULL,
  `langguj` varchar(20) DEFAULT NULL,
  `langmarathi` varchar(20) DEFAULT NULL,
  `langother` varchar(20) DEFAULT NULL,
  `preadd` varchar(100) DEFAULT NULL,
  `precity` varchar(20) DEFAULT NULL,
  `prepincode` varchar(10) DEFAULT NULL,
  `prestate` varchar(20) DEFAULT NULL,
  `peradd` varchar(100) DEFAULT NULL,
  `percity` varchar(20) DEFAULT NULL,
  `perpincode` varchar(10) DEFAULT NULL,
  `perstate` varchar(20) DEFAULT NULL,
  `pancardno` varchar(20) DEFAULT NULL,
  `adharno` varchar(20) DEFAULT NULL,
  `dlicenceno` varchar(20) DEFAULT NULL,
  `bgroup` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studtendetails`
--

CREATE TABLE `studtendetails` (
  `tid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `tpassingyear` varchar(10) DEFAULT NULL,
  `tcgpi` varchar(10) DEFAULT NULL,
  `tpercentage` varchar(10) DEFAULT NULL,
  `tclass` varchar(20) DEFAULT NULL,
  `tspecialization` varchar(50) DEFAULT NULL,
  `tschoolname` varchar(50) DEFAULT NULL,
  `tschooladd` varchar(100) DEFAULT NULL,
  `tschoolcity` varchar(20) DEFAULT NULL,
  `tschoolpincode` varchar(10) DEFAULT NULL,
  `tboard` varchar(20) DEFAULT NULL,
  `tanygap` varchar(10) DEFAULT NULL,
  `tgapyear` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studtwelvedetails`
--

CREATE TABLE `studtwelvedetails` (
  `twid` int(5) NOT NULL,
  `sid` int(5) NOT NULL,
  `twepassingyear` varchar(10) DEFAULT NULL,
  `twecgpi` varchar(10) DEFAULT NULL,
  `twepercentage` varchar(10) DEFAULT NULL,
  `tweclass` varchar(10) DEFAULT NULL,
  `twespecialization` varchar(50) DEFAULT NULL,
  `tweschoolname` varchar(50) DEFAULT NULL,
  `tweschooladd` varchar(100) DEFAULT NULL,
  `tweschoolcity` varchar(20) DEFAULT NULL,
  `tweschoolpincode` varchar(10) DEFAULT NULL,
  `tweboard` varchar(50) DEFAULT NULL,
  `tweanygap` varchar(10) DEFAULT NULL,
  `twegapyear` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studworkexp`
--

CREATE TABLE `studworkexp` (
  `wid` int(5) NOT NULL,
  `sid` int(5) DEFAULT NULL,
  `totalworkexp` varchar(10) DEFAULT NULL,
  `lastsalary` varchar(10) DEFAULT NULL,
  `firstorgname` varchar(50) DEFAULT NULL,
  `firstdesignation` varchar(50) DEFAULT NULL,
  `firstduration` varchar(20) DEFAULT NULL,
  `secorgname` varchar(50) DEFAULT NULL,
  `secdesignation` varchar(50) DEFAULT NULL,
  `secduration` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `coodinater`
--
ALTER TABLE `coodinater`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `hiring`
--
ALTER TABLE `hiring`
  ADD PRIMARY KEY (`hid`),
  ADD KEY `fkcidhiring` (`cid`);

--
-- Indexes for table `studadditionalqualification`
--
ALTER TABLE `studadditionalqualification`
  ADD PRIMARY KEY (`aqid`),
  ADD KEY `fksidadditionalqualification` (`sid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `enrollno` (`enrollno`);

--
-- Indexes for table `studentapply`
--
ALTER TABLE `studentapply`
  ADD PRIMARY KEY (`applyid`),
  ADD KEY `fkcidcompany` (`cid`),
  ADD KEY `fksidstud` (`sid`);

--
-- Indexes for table `studextraachievement`
--
ALTER TABLE `studextraachievement`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `fksidextraachievement` (`sid`);

--
-- Indexes for table `studgraduation`
--
ALTER TABLE `studgraduation`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `fksidgraduation` (`sid`);

--
-- Indexes for table `studinternship`
--
ALTER TABLE `studinternship`
  ADD PRIMARY KEY (`itid`),
  ADD KEY `fksidinternship` (`sid`);

--
-- Indexes for table `studpostgraduation`
--
ALTER TABLE `studpostgraduation`
  ADD PRIMARY KEY (`pgid`),
  ADD KEY `fksidpostgraduation` (`sid`);

--
-- Indexes for table `studprofile`
--
ALTER TABLE `studprofile`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `fksidstudprofile` (`sid`);

--
-- Indexes for table `studtendetails`
--
ALTER TABLE `studtendetails`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `fksidtendetails` (`sid`);

--
-- Indexes for table `studtwelvedetails`
--
ALTER TABLE `studtwelvedetails`
  ADD PRIMARY KEY (`twid`),
  ADD KEY `fksidtwelvedetails` (`sid`);

--
-- Indexes for table `studworkexp`
--
ALTER TABLE `studworkexp`
  ADD PRIMARY KEY (`wid`),
  ADD KEY `fksidstudent` (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coodinater`
--
ALTER TABLE `coodinater`
  MODIFY `cid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hiring`
--
ALTER TABLE `hiring`
  MODIFY `hid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studadditionalqualification`
--
ALTER TABLE `studadditionalqualification`
  MODIFY `aqid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `studentapply`
--
ALTER TABLE `studentapply`
  MODIFY `applyid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studextraachievement`
--
ALTER TABLE `studextraachievement`
  MODIFY `aid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studgraduation`
--
ALTER TABLE `studgraduation`
  MODIFY `gid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studinternship`
--
ALTER TABLE `studinternship`
  MODIFY `itid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studpostgraduation`
--
ALTER TABLE `studpostgraduation`
  MODIFY `pgid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studprofile`
--
ALTER TABLE `studprofile`
  MODIFY `eid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `studtendetails`
--
ALTER TABLE `studtendetails`
  MODIFY `tid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studtwelvedetails`
--
ALTER TABLE `studtwelvedetails`
  MODIFY `twid` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studworkexp`
--
ALTER TABLE `studworkexp`
  MODIFY `wid` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hiring`
--
ALTER TABLE `hiring`
  ADD CONSTRAINT `fkcidhiring` FOREIGN KEY (`cid`) REFERENCES `company` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentapply`
--
ALTER TABLE `studentapply`
  ADD CONSTRAINT `fkcidcompany` FOREIGN KEY (`cid`) REFERENCES `company` (`cid`),
  ADD CONSTRAINT `fksidstud` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `studprofile`
--
ALTER TABLE `studprofile`
  ADD CONSTRAINT `fksidstudprofile` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
