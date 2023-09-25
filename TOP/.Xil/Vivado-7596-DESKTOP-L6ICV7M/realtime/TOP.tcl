# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/liyon/Desktop/TOP/.Xil/Vivado-7596-DESKTOP-L6ICV7M/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7a35tcpg236-1
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_vhdl -lib xil_defaultlib {
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_1bit.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Adder_Unsigned_2bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_16bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_32bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_44bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_4bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_56bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Adder_Unsigned_8bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Exponential.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Multiplier_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Multiplier_gamma.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Negate_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Square_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Square_Difference.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Subtractor_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Twos_Complement_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Twos_Complement_Inv_28bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/imports/source/Kernel_rbf.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Multiplier_12bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Adder_Unsigned_24bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Multiplier_Signed_12bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Twos_Complement_Inv_12bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Twos_Complement_13bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Adder_Signed_20bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/TOP.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Twos_Complement_Inv_13bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Twos_Complement_20bits.vhd
      C:/Users/liyon/Desktop/TOP/TOP.srcs/sources_1/new/Convertor_Signed_13to20bits.vhd
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top TOP
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter dataflowBusHighlighting false
    rt::set_parameter generateDataflowBusNetlist false
    rt::set_parameter dataFlowViewInElab false
    rt::set_parameter busViewFixBrokenConnections false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "C:/Users/liyon/Desktop/TOP/.Xil/Vivado-7596-DESKTOP-L6ICV7M/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}