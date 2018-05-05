import controlP5.*; // import controlP5 library
import themidibus.*;
import oscP5.*;
import netP5.*;
import java.io.File;

// 
ControlP5 controlP5; // controlP5 GUI object
MidiBus bus; // MIDI object
OscP5 oscP5; // OSC object
NetAddress myBroadcastLocation;
PrintWriter paramsToSaveOutput;

// GUI object declarations

// Knob
Knob sliderKnobGet1;
Knob sliderKnobGet2;
Knob sliderKnobGet3;
Knob sliderKnobGet4;
Knob sliderKnobGet5;
Knob sliderKnobGet6;
Knob sliderKnobGet7;
Knob sliderKnobGet8;
Knob sliderKnobGet9;
Knob sliderKnobGet10;
Knob sliderKnobGet11;
Knob sliderKnobGet12;
Knob sliderKnobGet13;
Knob sliderKnobGet14;
Knob sliderKnobGet15;
Knob sliderKnobGet16;

// Droplist
DropdownList midiDevsList;

// Button
Button presetLoadButton;
Button presetSaveButton;

Button helpLink;
Button sourceLink;
Button appsLink;
Button musicLink;

Button resetAllMsgsButton;
Button resetAllCcButton;

// Checkbox

CheckBox modeAll;

CheckBox serverPower; 

CheckBox sliderModeGet1;
CheckBox sliderModeGet2;
CheckBox sliderModeGet3;
CheckBox sliderModeGet4;
CheckBox sliderModeGet5;
CheckBox sliderModeGet6;
CheckBox sliderModeGet7;
CheckBox sliderModeGet8;
CheckBox sliderModeGet9;
CheckBox sliderModeGet10;
CheckBox sliderModeGet11;
CheckBox sliderModeGet12;
CheckBox sliderModeGet13;
CheckBox sliderModeGet14;
CheckBox sliderModeGet15;
CheckBox sliderModeGet16;

// Label
Textlabel linksLabel;

Textlabel oscMsgDisplay;

Textlabel midiMsgDisplay1;
Textlabel midiMsgDisplay2;
Textlabel midiMsgDisplay3;
Textlabel midiMsgDisplay4;
Textlabel midiMsgDisplay5;
Textlabel midiMsgDisplay6;
Textlabel midiMsgDisplay7;
Textlabel midiMsgDisplay8;
Textlabel midiMsgDisplay9;
Textlabel midiMsgDisplay10;
Textlabel midiMsgDisplay11;
Textlabel midiMsgDisplay12;
Textlabel midiMsgDisplay13;
Textlabel midiMsgDisplay14;
Textlabel midiMsgDisplay15;
Textlabel midiMsgDisplay16;

Textlabel oscInMsgDisplay1;
Textlabel oscInMsgDisplay2;
Textlabel oscInMsgDisplay3;
Textlabel oscInMsgDisplay4;
Textlabel oscInMsgDisplay5;
Textlabel oscInMsgDisplay6;
Textlabel oscInMsgDisplay7;
Textlabel oscInMsgDisplay8;
Textlabel oscInMsgDisplay9;
Textlabel oscInMsgDisplay10;
Textlabel oscInMsgDisplay11;
Textlabel oscInMsgDisplay12;
Textlabel oscInMsgDisplay13;
Textlabel oscInMsgDisplay14;
Textlabel oscInMsgDisplay15;
Textlabel oscInMsgDisplay16;

// Numberboxes
Numberbox midiChanAll;

Numberbox midiChanGet1;
Numberbox midiChanGet2;
Numberbox midiChanGet3;
Numberbox midiChanGet4;
Numberbox midiChanGet5;
Numberbox midiChanGet6;
Numberbox midiChanGet7;
Numberbox midiChanGet8;
Numberbox midiChanGet9;
Numberbox midiChanGet10;
Numberbox midiChanGet11;
Numberbox midiChanGet12;
Numberbox midiChanGet13;
Numberbox midiChanGet14;
Numberbox midiChanGet15;
Numberbox midiChanGet16;

Numberbox sliderGetCC1;
Numberbox sliderGetCC2;
Numberbox sliderGetCC3;
Numberbox sliderGetCC4;
Numberbox sliderGetCC5;
Numberbox sliderGetCC6;
Numberbox sliderGetCC7;
Numberbox sliderGetCC8;
Numberbox sliderGetCC9;
Numberbox sliderGetCC10;
Numberbox sliderGetCC11;
Numberbox sliderGetCC12;
Numberbox sliderGetCC13;
Numberbox sliderGetCC14;
Numberbox sliderGetCC15;
Numberbox sliderGetCC16;

// Text Fields

Textfield portGet;

Textfield maxAll;

Textfield prefixMsgGet;

Textfield sliderMaxGet1;
Textfield sliderMaxGet2;
Textfield sliderMaxGet3;
Textfield sliderMaxGet4;
Textfield sliderMaxGet5;
Textfield sliderMaxGet6;
Textfield sliderMaxGet7;
Textfield sliderMaxGet8;
Textfield sliderMaxGet9;
Textfield sliderMaxGet10;
Textfield sliderMaxGet11;
Textfield sliderMaxGet12;
Textfield sliderMaxGet13;
Textfield sliderMaxGet14;
Textfield sliderMaxGet15;
Textfield sliderMaxGet16;

Textfield sliderMsgGet1;
Textfield sliderMsgGet2;
Textfield sliderMsgGet3;
Textfield sliderMsgGet4;
Textfield sliderMsgGet5;
Textfield sliderMsgGet6;
Textfield sliderMsgGet7;
Textfield sliderMsgGet8;
Textfield sliderMsgGet9;
Textfield sliderMsgGet10;
Textfield sliderMsgGet11;
Textfield sliderMsgGet12;
Textfield sliderMsgGet13;
Textfield sliderMsgGet14;
Textfield sliderMsgGet15;
Textfield sliderMsgGet16;

// Primitive variable declarations
int midiDevOut;

int midiChan = 1;

int midiChan1 = 1;
int midiChan2 = 1;
int midiChan3 = 1;
int midiChan4 = 1;
int midiChan5 = 1;
int midiChan6 = 1;
int midiChan7 = 1;
int midiChan8 = 1;
int midiChan9 = 1;
int midiChan10 = 1;
int midiChan11 = 1;
int midiChan12 = 1;
int midiChan13 = 1;
int midiChan14 = 1;
int midiChan15 = 1;
int midiChan16 = 1;

int sliderCC1 = 102;
int sliderCC2 = 103;
int sliderCC3 = 104;
int sliderCC4 = 105;
int sliderCC5 = 106;
int sliderCC6 = 107;
int sliderCC7 = 108;
int sliderCC8 = 109;
int sliderCC9 = 110;
int sliderCC10 = 111;
int sliderCC11 = 112;
int sliderCC12 = 113;
int sliderCC13 = 114;
int sliderCC14 = 115;
int sliderCC15 = 116;
int sliderCC16 = 117;

int sliderMode1 = 0;
int sliderMode2 = 0;
int sliderMode3 = 0;
int sliderMode4 = 0;
int sliderMode5 = 0;
int sliderMode6 = 0;
int sliderMode7 = 0;
int sliderMode8 = 0;
int sliderMode9 = 0;
int sliderMode10 = 0;
int sliderMode11 = 0;
int sliderMode12 = 0;
int sliderMode13 = 0;
int sliderMode14 = 0;
int sliderMode15 = 0;
int sliderMode16 = 0;

int sliderMax1 = 100;
int sliderMax2 = 100;
int sliderMax3 = 100;
int sliderMax4 = 100;
int sliderMax5 = 100;
int sliderMax6 = 100;
int sliderMax7 = 100;
int sliderMax8 = 100;
int sliderMax9 = 100;
int sliderMax10 = 100;
int sliderMax11 = 100;
int sliderMax12 = 100;
int sliderMax13 = 100;
int sliderMax14 = 100;
int sliderMax15 = 100;
int sliderMax16 = 100;

int portData = 9000;

String oscMsgData;

String prefixMsg = "/1/10000/1";

String sliderMsg1 = "/1";
String sliderMsg2 = "/2";
String sliderMsg3 = "/3";
String sliderMsg4 = "/4";
String sliderMsg5 = "/5";
String sliderMsg6 = "/6";
String sliderMsg7 = "/7";
String sliderMsg8 = "/8";
String sliderMsg9 = "/9";
String sliderMsg10 = "/10";
String sliderMsg11 = "/11";
String sliderMsg12 = "/12";
String sliderMsg13 = "/13";
String sliderMsg14 = "/14";
String sliderMsg15 = "/15";
String sliderMsg16 = "/16";

String loadPresetFile;
String savePresetFile;

// Setup
void setup() {
 size(865,420); // Layout size
 surface.setTitle("Pure Chords - OSC-MIDI Server Pro v1.0"); // Layout title
 
 controlP5 = new ControlP5(this); // Initialize GUI class
  midiDevOut = 3;
  midiChan = 1;
  
 linksLabel = controlP5.addTextlabel("Links")
   .setPosition(430,10)
   .setSize(25,20)
   .setText("Pure Chords OSC-MIDI Server Pro")
  ;
  
 helpLink = controlP5.addButton("Help")
     .setPosition(290,25)
     .setSize(100,20)
     ;
  
 appsLink = controlP5.addButton("Apps")
     .setPosition(400,25)
     .setSize(100,20)
     ;
     
 sourceLink = controlP5.addButton("Source")
     .setPosition(510,25)
     .setSize(100,20)
     ;
     
 musicLink = controlP5.addButton("Music")
     .setPosition(620,25)
     .setSize(100,20)
     ;
 
 portGet = controlP5.addTextfield("Port")
     .setPosition(240,55)
     .setSize(40,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("9000")
     ;
     
  oscMsgDisplay = controlP5.addTextlabel("Osc Msg")
   .setPosition(10,35)
   .setSize(25,20)
   .setText("Incoming OSC Message: ")
  ;
  
  prefixMsgGet = controlP5.addTextfield("Prefix")
     .setPosition(300,55)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/1/10000/1")
     ;
  
  presetLoadButton = controlP5.addButton("Load Preset")
     .setPosition(15,55)
     .setSize(100,20)
     ;
   
  presetSaveButton = controlP5.addButton("Save Preset")
     .setPosition(125,55)
     .setSize(100,20)
     ;
     
  resetAllMsgsButton = controlP5.addButton("Reset Msgs")
     .setPosition(410,55)
     .setSize(100,20)
     ;  
     
  resetAllCcButton = controlP5.addButton("Reset CC")
     .setPosition(520,55)
     .setSize(100,20)
     ;  
     
  midiChanAll = controlP5.addNumberbox("Chan All")
     .setPosition(630,55)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
  modeAll = controlP5.addCheckBox("checkBoxModeAll")
                .setPosition(660, 55)
                .setSize(15, 15)
                .addItem("Int32 All", 0)
                ;
                
  maxAll = controlP5.addTextfield("Max All")
     .setPosition(720,55)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
                ;
  
// Slider 1 Controls

  sliderMsgGet1 = controlP5.addTextfield("Msg1")
     .setPosition(15,95)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/1")
     ;
     
  sliderModeGet1 = controlP5.addCheckBox("checkBoxMode1")
                .setPosition(120, 95)
                .setSize(15, 15)
                .addItem("Int32 1", 0)
                ;
     
   sliderMaxGet1 = controlP5.addTextfield("Max1")
     .setPosition(175,95)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
   
  sliderGetCC1 = controlP5.addNumberbox("CC1")
     .setPosition(210,95)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet1 = controlP5.addNumberbox("Chan1")
     .setPosition(240,95)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet1 = controlP5.addKnob("knob1")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,95)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay1 = controlP5.addTextlabel("OSC InMsg1")
   .setPosition(300,95)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay1 = controlP5.addTextlabel("Midi Msg1")
   .setPosition(300,115)
   .setSize(25,20)
   .setText("Midi Value:")
  ;
  
 // Slider 2 Controls

  sliderMsgGet2 = controlP5.addTextfield("Msg2")
     .setPosition(15,135)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/2")
     ;
     
  sliderModeGet2 = controlP5.addCheckBox("checkBoxMode2")
                .setPosition(120, 135)
                .setSize(15, 15)
                .addItem("Int32 2", 0)
                ;
     
   sliderMaxGet2 = controlP5.addTextfield("Max2")
     .setPosition(175,135)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
    
  sliderGetCC2 = controlP5.addNumberbox("CC2")
     .setPosition(210,135)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet2 = controlP5.addNumberbox("Chan2")
     .setPosition(240,135)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet2 = controlP5.addKnob("knob2")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,135)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay2 = controlP5.addTextlabel("OSC InMsg2")
   .setPosition(300,135)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay2 = controlP5.addTextlabel("Midi Msg2")
   .setPosition(300,155)
   .setSize(25,20)
   .setText("Midi Value:")
  ;
  
// Slider 3 Controls

  sliderMsgGet3 = controlP5.addTextfield("Msg3")
     .setPosition(15,175)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/3")
     ;
     
  sliderModeGet3 = controlP5.addCheckBox("checkBoxMode3")
                .setPosition(120, 175)
                .setSize(15, 15)
                .addItem("Int32 3", 0)
                ;
     
   sliderMaxGet3 = controlP5.addTextfield("Max3")
     .setPosition(175,175)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC3 = controlP5.addNumberbox("CC3")
     .setPosition(210,175)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet3 = controlP5.addNumberbox("Chan3")
     .setPosition(240,175)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet3 = controlP5.addKnob("knob3")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,175)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay3 = controlP5.addTextlabel("OSC InMsg3")
   .setPosition(300,175)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay3 = controlP5.addTextlabel("Midi Msg3")
   .setPosition(300,195)
   .setSize(25,20)
   .setText("Midi Value:")
  ;  

// Slider 4 Controls

  sliderMsgGet4 = controlP5.addTextfield("Msg4")
     .setPosition(15,215)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/4")
     ;
     
  sliderModeGet4 = controlP5.addCheckBox("checkBoxMode4")
                .setPosition(120, 215)
                .setSize(15, 15)
                .addItem("Int32 4", 0)
                ;
     
   sliderMaxGet4 = controlP5.addTextfield("Max4")
     .setPosition(175,215)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
    
  sliderGetCC4 = controlP5.addNumberbox("CC4")
     .setPosition(210,215)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet4 = controlP5.addNumberbox("Chan4")
     .setPosition(240,215)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet4 = controlP5.addKnob("knob4")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,215)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay4 = controlP5.addTextlabel("OSC InMsg4")
   .setPosition(300,215)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay4 = controlP5.addTextlabel("Midi Msg4")
   .setPosition(300,235)
   .setSize(25,20)
   .setText("Midi Value:")
  ;
  
// Slider 5 Controls

  sliderMsgGet5 = controlP5.addTextfield("Msg5")
     .setPosition(15,255)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/5")
     ;
     
  sliderModeGet5 = controlP5.addCheckBox("checkBoxMode5")
                .setPosition(120, 255)
                .setSize(15, 15)
                .addItem("Int32 5", 0)
                ;
     
   sliderMaxGet5 = controlP5.addTextfield("Max5")
     .setPosition(175,255)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ; 
  
  sliderGetCC5 = controlP5.addNumberbox("CC5")
     .setPosition(210,255)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet5 = controlP5.addNumberbox("Chan5")
     .setPosition(240,255)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet5 = controlP5.addKnob("knob5")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,255)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay5 = controlP5.addTextlabel("OSC InMsg5")
   .setPosition(300,255)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay5 = controlP5.addTextlabel("Midi Msg5")
   .setPosition(300,275)
   .setSize(25,20)
   .setText("Midi Value:")
  ;  

// Slider 6 Controls

  sliderMsgGet6 = controlP5.addTextfield("Msg6")
     .setPosition(15,295)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/6")
     ;
     
  sliderModeGet6 = controlP5.addCheckBox("checkBoxMode6")
                .setPosition(120, 295)
                .setSize(15, 15)
                .addItem("Int32 6", 0)
                ;
     
   sliderMaxGet6 = controlP5.addTextfield("Max6")
     .setPosition(175,295)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC6 = controlP5.addNumberbox("CC6")
     .setPosition(210,295)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet6 = controlP5.addNumberbox("Chan6")
     .setPosition(240,295)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet6 = controlP5.addKnob("knob6")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,295)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay6 = controlP5.addTextlabel("OSC InMsg6")
   .setPosition(300,295)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay6 = controlP5.addTextlabel("Midi Msg6")
   .setPosition(300,315)
   .setSize(25,20)
   .setText("Midi Value:")
  ;  

// Slider 7 Controls

  sliderMsgGet7 = controlP5.addTextfield("Msg7")
     .setPosition(15,335)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/7")
     ;
     
  sliderModeGet7 = controlP5.addCheckBox("checkBoxMode7")
                .setPosition(120, 335)
                .setSize(15, 15)
                .addItem("Int32 7", 0)
                ;
     
   sliderMaxGet7 = controlP5.addTextfield("Max7")
     .setPosition(175,335)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,335))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC7 = controlP5.addNumberbox("CC7")
     .setPosition(210,335)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet7 = controlP5.addNumberbox("Chan7")
     .setPosition(240,335)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet7 = controlP5.addKnob("knob7")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,335)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay7 = controlP5.addTextlabel("OSC InMsg7")
   .setPosition(300,335)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay7 = controlP5.addTextlabel("Midi Msg7")
   .setPosition(300,355)
   .setSize(25,20)
   .setText("Midi Value:")
  ;  
  
// Slider 8 Controls

  sliderMsgGet8 = controlP5.addTextfield("Msg8")
     .setPosition(15,375)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/8")
     ;
     
  sliderModeGet8 = controlP5.addCheckBox("checkBoxMode8")
                .setPosition(120, 375)
                .setSize(15, 15)
                .addItem("Int32 8", 0)
                ;
     
   sliderMaxGet8 = controlP5.addTextfield("Max8")
     .setPosition(175,375)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC8 = controlP5.addNumberbox("CC8")
     .setPosition(210,375)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet8 = controlP5.addNumberbox("Chan8")
     .setPosition(240,375)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet8 = controlP5.addKnob("knob8")
               .setRange(0,127)
               .setValue(50)
               .setPosition(270,375)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay8 = controlP5.addTextlabel("OSC InMsg8")
   .setPosition(300,375)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay8 = controlP5.addTextlabel("Midi Msg8")
   .setPosition(300,395)
   .setSize(25,20)
   .setText("Midi Value:")
  ;    
  
// Slider 9 Controls

  sliderMsgGet9 = controlP5.addTextfield("Msg9")
     .setPosition(430,95)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/9")
     ;
     
  sliderModeGet9 = controlP5.addCheckBox("checkBoxMode9")
                .setPosition(535, 95)
                .setSize(15, 15)
                .addItem("Int32 9", 0)
                ;
     
   sliderMaxGet9 = controlP5.addTextfield("Max9")
     .setPosition(590,95)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC9 = controlP5.addNumberbox("CC9")
     .setPosition(625,95)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet9 = controlP5.addNumberbox("Chan9")
     .setPosition(660,95)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet9 = controlP5.addKnob("knob9")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,95)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay9 = controlP5.addTextlabel("OSC InMsg9")
   .setPosition(720,95)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay9 = controlP5.addTextlabel("Midi Msg9")
   .setPosition(720,115)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      

// Slider 10 Controls

  sliderMsgGet10 = controlP5.addTextfield("Msg10")
     .setPosition(430,135)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/10")
     ;
     
  sliderModeGet10 = controlP5.addCheckBox("checkBoxMode10")
                .setPosition(535, 135)
                .setSize(15, 15)
                .addItem("Int32 10", 0)
                ;
     
   sliderMaxGet10 = controlP5.addTextfield("Max10")
     .setPosition(590,135)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC10 = controlP5.addNumberbox("CC10")
     .setPosition(625,135)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet10 = controlP5.addNumberbox("Chan10")
     .setPosition(660,135)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet10 = controlP5.addKnob("knob10")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,135)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay10 = controlP5.addTextlabel("OSC InMsg10")
   .setPosition(720,135)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay10 = controlP5.addTextlabel("Midi Msg10")
   .setPosition(720,155)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      

// Slider 11 Controls

  sliderMsgGet11 = controlP5.addTextfield("Msg11")
     .setPosition(430,175)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/11")
     ;
     
  sliderModeGet11 = controlP5.addCheckBox("checkBoxMode11")
                .setPosition(535, 175)
                .setSize(15, 15)
                .addItem("Int32 11", 0)
                ;
     
   sliderMaxGet11 = controlP5.addTextfield("Max11")
     .setPosition(590,175)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC11 = controlP5.addNumberbox("CC11")
     .setPosition(625,175)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet11 = controlP5.addNumberbox("Chan11")
     .setPosition(660,175)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet11 = controlP5.addKnob("knob11")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,175)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay11 = controlP5.addTextlabel("OSC InMsg11")
   .setPosition(720,175)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay11 = controlP5.addTextlabel("Midi Msg11")
   .setPosition(720,195)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      
  
// Slider 12 Controls

  sliderMsgGet12 = controlP5.addTextfield("Msg12")
     .setPosition(430,215)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/12")
     ;
     
  sliderModeGet12 = controlP5.addCheckBox("checkBoxMode12")
                .setPosition(535, 215)
                .setSize(15, 15)
                .addItem("Int32 12", 0)
                ;
     
   sliderMaxGet12 = controlP5.addTextfield("Max12")
     .setPosition(590,215)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC12 = controlP5.addNumberbox("CC12")
     .setPosition(625,215)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet12 = controlP5.addNumberbox("Chan12")
     .setPosition(660,215)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet12 = controlP5.addKnob("knob12")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,215)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay12 = controlP5.addTextlabel("OSC InMsg12")
   .setPosition(720,215)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay12 = controlP5.addTextlabel("Midi Msg12")
   .setPosition(720,235)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      
  
  // Slider 13 Controls

  sliderMsgGet13 = controlP5.addTextfield("Msg13")
     .setPosition(430,255)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/13")
     ;
     
  sliderModeGet13 = controlP5.addCheckBox("checkBoxMode13")
                .setPosition(535, 255)
                .setSize(15, 15)
                .addItem("Int32 13", 0)
                ;
     
   sliderMaxGet13 = controlP5.addTextfield("Max13")
     .setPosition(590,255)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
 
  sliderGetCC13 = controlP5.addNumberbox("CC13")
     .setPosition(625,255)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet13 = controlP5.addNumberbox("Chan13")
     .setPosition(660,255)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet13 = controlP5.addKnob("knob13")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,255)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay13 = controlP5.addTextlabel("OSC InMsg13")
   .setPosition(720,255)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay13 = controlP5.addTextlabel("Midi Msg13")
   .setPosition(720,275)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      
  
// Slider 14 Controls

  sliderMsgGet14 = controlP5.addTextfield("Msg14")
     .setPosition(430,295)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/14")
     ;
     
  sliderModeGet14 = controlP5.addCheckBox("checkBoxMode14")
                .setPosition(535, 295)
                .setSize(15, 15)
                .addItem("Int32 14", 0)
                ;
     
   sliderMaxGet14 = controlP5.addTextfield("Max14")
     .setPosition(590,295)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;
  
  sliderGetCC14 = controlP5.addNumberbox("CC14")
     .setPosition(625,295)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet14 = controlP5.addNumberbox("Chan14")
     .setPosition(660,295)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet14 = controlP5.addKnob("knob14")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,295)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay14 = controlP5.addTextlabel("OSC InMsg14")
   .setPosition(720,295)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay14 = controlP5.addTextlabel("Midi Msg14")
   .setPosition(720,315)
   .setSize(25,20)
   .setText("Midi Value:")
  ;        

// Slider 15 Controls

  sliderMsgGet15 = controlP5.addTextfield("Msg15")
     .setPosition(430,335)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/15")
     ;
     
  sliderModeGet15 = controlP5.addCheckBox("checkBoxMode15")
                .setPosition(535, 335)
                .setSize(15, 15)
                .addItem("Int32 15", 0)
                ;
     
   sliderMaxGet15 = controlP5.addTextfield("Max15")
     .setPosition(590,335)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;

  sliderGetCC15 = controlP5.addNumberbox("CC15")
     .setPosition(625,335)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet15 = controlP5.addNumberbox("Chan15")
     .setPosition(660,335)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet15 = controlP5.addKnob("knob15")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,335)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay15 = controlP5.addTextlabel("OSC InMsg15")
   .setPosition(720,335)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay15 = controlP5.addTextlabel("Midi Msg15")
   .setPosition(720,355)
   .setSize(25,20)
   .setText("Midi Value:")
  ;      
  
// Slider 16 Controls

  sliderMsgGet16 = controlP5.addTextfield("Msg16")
     .setPosition(430,375)
     .setSize(100,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("/16")
     ;
     
  sliderModeGet16 = controlP5.addCheckBox("checkBoxMode16")
                .setPosition(535, 375)
                .setSize(15, 15)
                .addItem("Int32 16", 0)
                ;
     
   sliderMaxGet16 = controlP5.addTextfield("Max16")
     .setPosition(590,375)
     .setSize(30,20)
     .setFocus(true)
     .setColor(color(255,255,255))
     .setAutoClear(false)
     .setText("100")
     ;

  sliderGetCC16 = controlP5.addNumberbox("CC16")
     .setPosition(625,375)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(0)
     .setMax(127) 
     .setValue(50)
     ;
     
  midiChanGet16 = controlP5.addNumberbox("Chan16")
     .setPosition(660,375)
     .setSize(25,20)
     .setScrollSensitivity(1.1)
     .setDecimalPrecision(0)
     .setMin(1)
     .setMax(16) 
     .setValue(1)
     ;
     
 sliderKnobGet16 = controlP5.addKnob("knob16")
               .setRange(0,127)
               .setValue(50)
               .setPosition(690,375)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .setSize(25,25)
               .lock()
               .setLabelVisible(false)
               ;   
     
  oscInMsgDisplay16 = controlP5.addTextlabel("OSC InMsg16")
   .setPosition(720,375)
   .setSize(25,20)
   .setText("OSC Value:")
  ;
  
  midiMsgDisplay16 = controlP5.addTextlabel("Midi Msg16")
   .setPosition(720,395)
   .setSize(25,20)
   .setText("Midi Value:")
  ;        
  
  // Initialize MIDI bus
  midiDevsList = controlP5.addDropdownList("MIDI Device",55,10,150,120); 
  serverPower = controlP5.addCheckBox("checkBox")
                .setPosition(15, 10)
                .setSize(15, 15)
                .addItem("On", 0)
                ;
                
  saveStrings("data/midi.txt", MidiBus.availableOutputs());
  customizeMidi(midiDevsList);
  
  bus = new MidiBus();
  bus.clearAll();
  
  }
  
  // Draw layout background
  void draw() { 
  
  // Background color
  background(40);
  
  // Pure Chords logo
  PImage img;
  img = loadImage("/data/assets/pclogo.png");
  img.resize(99, 81);
  image(img, 755, 5);
  
  // Pure Chords icon
  PImage icon = loadImage("/data/assets/pclogoIcon.png");
  surface.setIcon(icon);
  
  // Screw gfx
  img = loadImage("/data/assets/screwSil.png");
  img.resize(7,7);
  image(img, 2, 2);
  
  image(img, 855, 2);
  
  image(img, 2, 410);
  
  image(img, 855, 410);
  
    }
 
 // Fill Dropdown MIDI devices list
void customizeMidi(DropdownList ddl) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.setOpen(false);
  ddl.addItems(loadStrings("data/midi.txt"));
  ddl.setColorActive(color(255,128));
}

// GUI Listeners

void controlEvent(ControlEvent theEvent) {

  // Apps link button listener
  if (theEvent.isFrom(appsLink)) {
   link("https://play.google.com/store/apps/dev?id=7246657026449504748");
  } // end apps link listener
  
  // Help link button listener
  if (theEvent.isFrom(helpLink)) {
   link("http://faxinadu.net/purechords/app/pure_chords_osc_midi_pro_manual.pdf");
  } // end help link listener
  
  // Source link button listener
  if (theEvent.isFrom(sourceLink)) {
   link("https://github.com/faxinadu");
  } // end source link listener
  
  // Music link button listener
  if (theEvent.isFrom(musicLink)) {
   link("https://faxinadu.bandcamp.com/");
  } // end music link listener
  
  // Preset load button listener
  if (theEvent.isFrom(presetLoadButton)) {
   selectInput("Load Preset", "fileSelectedLoad");
  } // end preset load listener
  
  // Preset save button listener
  if (theEvent.isFrom(presetSaveButton)) {
   selectInput("Save Preset", "fileSelectedSave");
  } // end preset save listener
  
  // Mode all listener
   if (theEvent.isFrom(modeAll)) {
    if (modeAll.getState(0) == false) {
      
        if (sliderModeGet1.getState(0) == true)
        {
         sliderModeGet1.toggle(0);
         sliderModeGet1.setValue(0);
         sliderMode1 = 0;
        }
        
        if (sliderModeGet2.getState(0) == true)
        {
         sliderModeGet2.toggle(0);
         sliderModeGet2.setValue(0);
         sliderMode2 = 0;
        }
        
        if (sliderModeGet3.getState(0) == true)
        {
         sliderModeGet3.toggle(0);
         sliderModeGet3.setValue(0);
         sliderMode3 = 0;
        }
        
        if (sliderModeGet4.getState(0) == true)
        {
         sliderModeGet4.toggle(0);
         sliderModeGet4.setValue(0);
         sliderMode4 = 0;
        }
        
        if (sliderModeGet5.getState(0) == true)
        {
         sliderModeGet5.toggle(0);
         sliderModeGet5.setValue(0);
         sliderMode5 = 0;
        }
        
        if (sliderModeGet6.getState(0) == true)
        {
         sliderModeGet6.toggle(0);
         sliderModeGet6.setValue(0);
         sliderMode6 = 0;
        }
        
        if (sliderModeGet7.getState(0) == true)
        {
         sliderModeGet7.toggle(0);
         sliderModeGet7.setValue(0);
         sliderMode7 = 0;
        }
        
        if (sliderModeGet8.getState(0) == true)
        {
         sliderModeGet8.toggle(0);
         sliderModeGet8.setValue(0);
         sliderMode8 = 0;
        }
        
        if (sliderModeGet9.getState(0) == true)
        {
         sliderModeGet9.toggle(0);
         sliderModeGet9.setValue(0);
         sliderMode9 = 0;
        }
        
        if (sliderModeGet10.getState(0) == true)
        {
         sliderModeGet10.toggle(0);
         sliderModeGet10.setValue(0);
         sliderMode10 = 0;
        }
        
        if (sliderModeGet11.getState(0) == true)
        {
         sliderModeGet11.toggle(0);
         sliderModeGet11.setValue(0);
         sliderMode11 = 0;
        }
        
        if (sliderModeGet12.getState(0) == true)
        {
         sliderModeGet12.toggle(0);
         sliderModeGet12.setValue(0);
         sliderMode12 = 0;
        }
        
        if (sliderModeGet13.getState(0) == true)
        {
         sliderModeGet13.toggle(0);
         sliderModeGet13.setValue(0);
         sliderMode13 = 0;
        }
        
        if (sliderModeGet14.getState(0) == true)
        {
         sliderModeGet14.toggle(0);
         sliderModeGet14.setValue(0);
         sliderMode14 = 0;
        }
        
        if (sliderModeGet15.getState(0) == true)
        {
         sliderModeGet15.toggle(0);
         sliderModeGet15.setValue(0);
         sliderMode15 = 0;
        }
        
        if (sliderModeGet16.getState(0) == true)
        {
         sliderModeGet16.toggle(0);
         sliderModeGet16.setValue(0);
         sliderMode16 = 0;
        }
      }
   
    if (modeAll.getState(0) == true) {
      
        if (sliderModeGet1.getState(0) == false)
        {
        sliderModeGet1.toggle(0);
        sliderModeGet1.setValue(1);
        sliderMode1 = 1;
        }
        
        if (sliderModeGet2.getState(0) == false)
        {
        sliderModeGet2.toggle(0);
        sliderModeGet2.setValue(1);
        sliderMode2 = 1;
        }
        
        if (sliderModeGet3.getState(0) == false)
        {
        sliderModeGet3.toggle(0);
        sliderModeGet3.setValue(1);
        sliderMode3 = 1;
        }
        
        if (sliderModeGet4.getState(0) == false)
        {
        sliderModeGet4.toggle(0);
        sliderModeGet4.setValue(1);
        sliderMode4 = 1;
        }
        
        if (sliderModeGet5.getState(0) == false)
        {
        sliderModeGet5.toggle(0);
        sliderModeGet5.setValue(1);
        sliderMode5 = 1;
        }
        
        if (sliderModeGet6.getState(0) == false)
        {
        sliderModeGet6.toggle(0);
        sliderModeGet6.setValue(1);
        sliderMode6 = 1;
        }
        
        if (sliderModeGet7.getState(0) == false)
        {
        sliderModeGet7.toggle(0);
        sliderModeGet7.setValue(1);
        sliderMode7 = 1;
        }
        
        if (sliderModeGet8.getState(0) == false)
        {
        sliderModeGet8.toggle(0);
        sliderModeGet8.setValue(1);
        sliderMode8 = 1;
        }
        
        if (sliderModeGet9.getState(0) == false)
        {
        sliderModeGet9.toggle(0);
        sliderModeGet9.setValue(1);
        sliderMode9 = 1;
        }
        
        if (sliderModeGet10.getState(0) == false)
        {
        sliderModeGet10.toggle(0);
        sliderModeGet10.setValue(1);
        sliderMode10 = 1;
        }
        
        if (sliderModeGet11.getState(0) == false)
        {
        sliderModeGet11.toggle(0);
        sliderModeGet11.setValue(1);
        sliderMode11 = 1;
        }
        
        if (sliderModeGet12.getState(0) == false)
        {
        sliderModeGet12.toggle(0);
        sliderModeGet12.setValue(1);
        sliderMode12 = 1;
        }
        
        if (sliderModeGet13.getState(0) == false)
        {
        sliderModeGet13.toggle(0);
        sliderModeGet13.setValue(1);
        sliderMode13 = 1;
        }
        
        if (sliderModeGet14.getState(0) == false)
        {
        sliderModeGet14.toggle(0);
        sliderModeGet14.setValue(1);
        sliderMode14 = 1;
        } 
        
        if (sliderModeGet15.getState(0) == false)
        {
        sliderModeGet15.toggle(0);
        sliderModeGet15.setValue(1);
        sliderMode15 = 1;
        }
        
        if (sliderModeGet16.getState(0) == false)
        {
        sliderModeGet16.toggle(0);
        sliderModeGet16.setValue(1);
        sliderMode16 = 1;
        }
        
        }
      
  } // end mode all listener
  
  // Midi chan all listener
  if (theEvent.isFrom(midiChanAll)) {
  
    midiChanGet1.setValue(midiChanAll.getValue());
    midiChan1 = (int) midiChanAll.getValue();
    
    midiChanGet2.setValue(midiChanAll.getValue());
    midiChan2 = (int) midiChanAll.getValue();
    
    midiChanGet3.setValue(midiChanAll.getValue());
    midiChan3 = (int) midiChanAll.getValue();
    
    midiChanGet4.setValue(midiChanAll.getValue());
    midiChan4 = (int) midiChanAll.getValue();
    
    midiChanGet5.setValue(midiChanAll.getValue());
    midiChan5 = (int) midiChanAll.getValue();
    
    midiChanGet6.setValue(midiChanAll.getValue());
    midiChan6 = (int) midiChanAll.getValue();
    
    midiChanGet7.setValue(midiChanAll.getValue());
    midiChan7 = (int) midiChanAll.getValue();
    
    midiChanGet8.setValue(midiChanAll.getValue());
    midiChan8 = (int) midiChanAll.getValue();
    
    midiChanGet9.setValue(midiChanAll.getValue());
    midiChan9 = (int) midiChanAll.getValue();
    
    midiChanGet10.setValue(midiChanAll.getValue());
    midiChan10 = (int) midiChanAll.getValue();
    
    midiChanGet11.setValue(midiChanAll.getValue());
    midiChan11 = (int) midiChanAll.getValue();
    
    midiChanGet12.setValue(midiChanAll.getValue());
    midiChan12 = (int) midiChanAll.getValue();
    
    midiChanGet13.setValue(midiChanAll.getValue());
    midiChan13 = (int) midiChanAll.getValue();
    
    midiChanGet14.setValue(midiChanAll.getValue());
    midiChan14 = (int) midiChanAll.getValue();
    
    midiChanGet15.setValue(midiChanAll.getValue());
    midiChan15 = (int) midiChanAll.getValue();
    
    midiChanGet16.setValue(midiChanAll.getValue());
    midiChan16 = (int) midiChanAll.getValue();
    
  } // end midi chan all listener
  
  // Reset cc listener
   if (theEvent.isFrom(resetAllCcButton)) {
    
     sliderGetCC1.setValue(102);
     sliderCC1 = 102;
    
     sliderGetCC2.setValue(103);
     sliderCC2 = 103;
     
     sliderGetCC3.setValue(104);
     sliderCC3 = 104;
     
     sliderGetCC4.setValue(105);
     sliderCC4 = 105;
     
     sliderGetCC5.setValue(106);
     sliderCC5 = 106;
     
     sliderGetCC6.setValue(107);
     sliderCC6 = 107;
     
     sliderGetCC7.setValue(108);
     sliderCC7 = 108;
     
     sliderGetCC8.setValue(109);
     sliderCC8 = 109;
     
     sliderGetCC9.setValue(110);
     sliderCC9 = 110;
     
     sliderGetCC10.setValue(111);
     sliderCC10 = 111;
     
     sliderGetCC11.setValue(112);
     sliderCC11 = 112;
     
     sliderGetCC12.setValue(113);
     sliderCC12 = 113;
     
     sliderGetCC13.setValue(114);
     sliderCC13 = 114;
     
     sliderGetCC14.setValue(115);
     sliderCC14 = 115;
     
     sliderGetCC15.setValue(116);
     sliderCC15 = 116;
     
     sliderGetCC16.setValue(117);
     sliderCC16 = 117;
    
      } // end reset cc listener
     
  // Reset messages listener
  if (theEvent.isFrom(resetAllMsgsButton)) {
   
   sliderMsgGet1.setValue("/1");
   sliderMsg1 = "/1";
   
   sliderMsgGet2.setValue("/2");
   sliderMsg2 = "/2";
   
   sliderMsgGet3.setValue("/3");
   sliderMsg3 = "/3";
   
   sliderMsgGet4.setValue("/4");
   sliderMsg4 = "/4";
   
   sliderMsgGet5.setValue("/5");
   sliderMsg5 = "/5";
   
   sliderMsgGet6.setValue("/6");
   sliderMsg6 = "/6";
   
   sliderMsgGet7.setValue("/7");
   sliderMsg7 = "/7";
   
   sliderMsgGet8.setValue("/8");
   sliderMsg8 = "/8";
   
   sliderMsgGet9.setValue("/9");
   sliderMsg9 = "/9";
   
   sliderMsgGet10.setValue("/10");
   sliderMsg10 = "/10";
   
   sliderMsgGet11.setValue("/11");
   sliderMsg11 = "/11";
   
   sliderMsgGet12.setValue("/12");
   sliderMsg12 = "/12";
   
   sliderMsgGet13.setValue("/13");
   sliderMsg13 = "/13";
   
   sliderMsgGet14.setValue("/14");
   sliderMsg14 = "/14";
   
   sliderMsgGet15.setValue("/15");
   sliderMsg15 = "/15";
   
   sliderMsgGet16.setValue("/16");
   sliderMsg16 = "/16";
   
  } // end reset messages listener
  
  // Slider CC Listeners
       // Slider CC listener 1
       if (theEvent.isFrom(sliderGetCC1))
       {
       sliderCC1 = (int) sliderGetCC1.getValue();
       } // end slider cc listener
       
       // Slider CC listener 2
       if (theEvent.isFrom(sliderGetCC2))
       {
       sliderCC2 = (int) sliderGetCC2.getValue();
       } // end slider cc listener
       
       // Slider CC listener 3
       if (theEvent.isFrom(sliderGetCC3))
       {
       sliderCC3 = (int) sliderGetCC3.getValue();
       } // end slider cc listener
  
      // Slider CC listener 4
       if (theEvent.isFrom(sliderGetCC4))
       {
       sliderCC4 = (int) sliderGetCC4.getValue();
       } // end slider cc listener
  
      // Slider CC listener 5
       if (theEvent.isFrom(sliderGetCC5))
       {
       sliderCC5 = (int) sliderGetCC5.getValue();
       } // end slider cc listener
       
       // Slider CC listener 6
       if (theEvent.isFrom(sliderGetCC6))
       {
       sliderCC6 = (int) sliderGetCC6.getValue();
       } // end slider cc listener
       
       // Slider CC listener 7
       if (theEvent.isFrom(sliderGetCC7))
       {
       sliderCC7 = (int) sliderGetCC7.getValue();
       } // end slider cc listener
  
       // Slider CC listener 8
       if (theEvent.isFrom(sliderGetCC8))
       {
       sliderCC8 = (int) sliderGetCC8.getValue();
       } // end slider cc listener
  
       // Slider CC listener 9
       if (theEvent.isFrom(sliderGetCC9))
       {
       sliderCC9 = (int) sliderGetCC9.getValue();
       } // end slider cc listener
  
       // Slider CC listener 10
       if (theEvent.isFrom(sliderGetCC10))
       {
       sliderCC10 = (int) sliderGetCC10.getValue();
       } // end slider cc listener
  
       // Slider CC listener 11
       if (theEvent.isFrom(sliderGetCC11))
       {
       sliderCC11 = (int) sliderGetCC11.getValue();
       } // end slider cc listener
  
       // Slider CC listener 12
       if (theEvent.isFrom(sliderGetCC12))
       {
       sliderCC12 = (int) sliderGetCC12.getValue();
       } // end slider cc listener
       
       // Slider CC listener 13
       if (theEvent.isFrom(sliderGetCC13))
       {
       sliderCC13 = (int) sliderGetCC13.getValue();
       } // end slider cc listener
       
       // Slider CC listener 14
       if (theEvent.isFrom(sliderGetCC14))
       {
       sliderCC14 = (int) sliderGetCC14.getValue();
       } // end slider cc listener
       
       // Slider CC listener 15
       if (theEvent.isFrom(sliderGetCC15))
       {
       sliderCC15 = (int) sliderGetCC15.getValue();
       } // end slider cc listener
  
       // Slider CC listener 16
       if (theEvent.isFrom(sliderGetCC16))
       {
       sliderCC16 = (int) sliderGetCC16.getValue();
       } // end slider cc listener
  
  // Slider Midi Chan Listeners
       // Slider Midi Chan listener 1
       if (theEvent.isFrom(midiChanGet1))
       {
       midiChan1 = (int) midiChanGet1.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 2
       if (theEvent.isFrom(midiChanGet2))
       {
       midiChan2 = (int) midiChanGet2.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 3
       if (theEvent.isFrom(midiChanGet3))
       {
       midiChan3 = (int) midiChanGet3.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 4
       if (theEvent.isFrom(midiChanGet4))
       {
       midiChan4 = (int) midiChanGet4.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 5
       if (theEvent.isFrom(midiChanGet5))
       {
       midiChan5 = (int) midiChanGet5.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 6
       if (theEvent.isFrom(midiChanGet6))
       {
       midiChan6 = (int) midiChanGet6.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 7
       if (theEvent.isFrom(midiChanGet7))
       {
       midiChan7 = (int) midiChanGet7.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 8
       if (theEvent.isFrom(midiChanGet8))
       {
       midiChan8 = (int) midiChanGet8.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 9
       if (theEvent.isFrom(midiChanGet9))
       {
       midiChan9 = (int) midiChanGet9.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 10
       if (theEvent.isFrom(midiChanGet10))
       {
       midiChan10 = (int) midiChanGet10.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 11
       if (theEvent.isFrom(midiChanGet11))
       {
       midiChan11 = (int) midiChanGet11.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 12
       if (theEvent.isFrom(midiChanGet12))
       {
       midiChan12 = (int) midiChanGet12.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 13
       if (theEvent.isFrom(midiChanGet13))
       {
       midiChan13 = (int) midiChanGet13.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 14
       if (theEvent.isFrom(midiChanGet14))
       {
       midiChan14 = (int) midiChanGet14.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 15
       if (theEvent.isFrom(midiChanGet15))
       {
       midiChan15 = (int) midiChanGet15.getValue();
       } // end midi chan listener
       
       // Slider Midi Chan listener 16
       if (theEvent.isFrom(midiChanGet16))
       {
       midiChan16 = (int) midiChanGet16.getValue();
       } // end midi chan listener
  
  // Power button listener
 if (theEvent.isFrom(serverPower)) {
    if (serverPower.getState(0) == false) {
    oscP5.stop();
    bus.clearAll();
  }
    if (serverPower.getState(0) == true) {
    oscP5 = new OscP5(this, portData);
    bus.addOutput(midiDevOut);
  }
  } // end power button listener
  
  // Slider Mode Button 1
   if (theEvent.isFrom(sliderModeGet1)) {
    if (sliderModeGet1.getState(0) == false) {
    sliderMode1 = 0;
  }
    if (sliderModeGet1.getState(0) == true) {
    sliderMode1 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 2
   if (theEvent.isFrom(sliderModeGet2)) {
    if (sliderModeGet2.getState(0) == false) {
    sliderMode2 = 0;
  }
    if (sliderModeGet2.getState(0) == true) {
    sliderMode2 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 3
   if (theEvent.isFrom(sliderModeGet3)) {
    if (sliderModeGet3.getState(0) == false) {
    sliderMode3 = 0;
  }
    if (sliderModeGet3.getState(0) == true) {
    sliderMode3 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 4
   if (theEvent.isFrom(sliderModeGet4)) {
    if (sliderModeGet4.getState(0) == false) {
    sliderMode4 = 0;
  }
    if (sliderModeGet4.getState(0) == true) {
    sliderMode4 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 5
   if (theEvent.isFrom(sliderModeGet5)) {
    if (sliderModeGet5.getState(0) == false) {
    sliderMode5 = 0;
  }
    if (sliderModeGet5.getState(0) == true) {
    sliderMode5 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 6
   if (theEvent.isFrom(sliderModeGet6)) {
    if (sliderModeGet6.getState(0) == false) {
    sliderMode6 = 0;
  }
    if (sliderModeGet6.getState(0) == true) {
    sliderMode6 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 7
   if (theEvent.isFrom(sliderModeGet7)) {
    if (sliderModeGet7.getState(0) == false) {
    sliderMode7 = 0;
  }
    if (sliderModeGet7.getState(0) == true) {
    sliderMode7 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 8
   if (theEvent.isFrom(sliderModeGet8)) {
    if (sliderModeGet8.getState(0) == false) {
    sliderMode8 = 0;
  }
    if (sliderModeGet8.getState(0) == true) {
    sliderMode8 = 1;
  }
  } //end mode button  
  
  // Slider Mode Button 9
   if (theEvent.isFrom(sliderModeGet9)) {
    if (sliderModeGet9.getState(0) == false) {
    sliderMode9 = 0;
  }
    if (sliderModeGet9.getState(0) == true) {
    sliderMode9 = 1;
  }
  } //end mode button  

  // Slider Mode Button 10
   if (theEvent.isFrom(sliderModeGet10)) {
    if (sliderModeGet10.getState(0) == false) {
    sliderMode10 = 0;
  }
    if (sliderModeGet10.getState(0) == true) {
    sliderMode10 = 1;
  }
  } //end mode button  

  // Slider Mode Button 11
   if (theEvent.isFrom(sliderModeGet11)) {
    if (sliderModeGet11.getState(0) == false) {
    sliderMode11 = 0;
  }
    if (sliderModeGet11.getState(0) == true) {
    sliderMode11 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 12
   if (theEvent.isFrom(sliderModeGet12)) {
    if (sliderModeGet12.getState(0) == false) {
    sliderMode12 = 0;
  }
    if (sliderModeGet12.getState(0) == true) {
    sliderMode12 = 1;
  }
  } //end mode button  
  
  // Slider Mode Button 13
   if (theEvent.isFrom(sliderModeGet13)) {
    if (sliderModeGet13.getState(0) == false) {
    sliderMode13 = 0;
  }
    if (sliderModeGet13.getState(0) == true) {
    sliderMode13 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 14
   if (theEvent.isFrom(sliderModeGet14)) {
    if (sliderModeGet14.getState(0) == false) {
    sliderMode14 = 0;
  }
    if (sliderModeGet14.getState(0) == true) {
    sliderMode14 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 15
   if (theEvent.isFrom(sliderModeGet15)) {
    if (sliderModeGet15.getState(0) == false) {
    sliderMode15 = 0;
  }
    if (sliderModeGet15.getState(0) == true) {
    sliderMode15 = 1;
  }
  } //end mode button
  
  // Slider Mode Button 16
   if (theEvent.isFrom(sliderModeGet16)) {
    if (sliderModeGet16.getState(0) == false) {
    sliderMode16 = 0;
  }
    if (sliderModeGet16.getState(0) == true) {
    sliderMode16 = 1;
  }
  } //end mode button
  
  
  // Unused
  if (theEvent.isGroup()) {
   }
   
   if(theEvent.isController()) { 
 
   // MIDI device dropdown listener
   if(theEvent.getController() == midiDevsList) {
   bus.clearOutputs();
   midiDevOut = (int) midiDevsList.getValue();
   } //end midi device listener
   
   if(theEvent.isAssignableFrom(Textfield.class)) {
     
       // Port listener
       if (theEvent.isFrom(portGet))
       {
       portData = Integer.parseInt(portGet.getText());
          if (serverPower.getState(0) == true) {
            oscP5.stop();
            bus.clearAll();
            oscP5 = new OscP5(this, portData);
            bus.addOutput(midiDevOut);
            }
       } // End port listener
      
      // Max all listener
       if (theEvent.isFrom(maxAll))
       {
        int myMax = Integer.parseInt(maxAll.getText());
       
        sliderMax1 = myMax;
        sliderMaxGet1.setValue(maxAll.getText());
        
        sliderMax2 = myMax;
        sliderMaxGet2.setValue(maxAll.getText());
        
        sliderMax3 = myMax;
        sliderMaxGet3.setValue(maxAll.getText());
        
        sliderMax4 = myMax;
        sliderMaxGet4.setValue(maxAll.getText());
        
        sliderMax5 = myMax;
        sliderMaxGet5.setValue(maxAll.getText());
        
        sliderMax6 = myMax;
        sliderMaxGet6.setValue(maxAll.getText());
        
        sliderMax7 = myMax;
        sliderMaxGet7.setValue(maxAll.getText());
       
        sliderMax8 = myMax;
        sliderMaxGet8.setValue(maxAll.getText());
        
        sliderMax9 = myMax;
        sliderMaxGet9.setValue(maxAll.getText());
        
        sliderMax10 = myMax;
        sliderMaxGet10.setValue(maxAll.getText());
        
        sliderMax11 = myMax;
        sliderMaxGet11.setValue(maxAll.getText());
        
        sliderMax12 = myMax;
        sliderMaxGet12.setValue(maxAll.getText());
        
        sliderMax13 = myMax;
        sliderMaxGet13.setValue(maxAll.getText());
        
        sliderMax14 = myMax;
        sliderMaxGet14.setValue(maxAll.getText());
        
        sliderMax15 = myMax;
        sliderMaxGet15.setValue(maxAll.getText());
        
        sliderMax16 = myMax;
        sliderMaxGet16.setValue(maxAll.getText());
        
       } // end max all listener
      
       // Msg Prefix Listener
       if (theEvent.isFrom(prefixMsgGet))
       {
       prefixMsg = prefixMsgGet.getText();
       } // End prefix listener
    
       // Slider Msg Listeners
       
       // slider msg listener 1
       if (theEvent.isFrom(sliderMsgGet1))
       {
       sliderMsg1 = sliderMsgGet1.getText();
       }  // end msg listener
       
       // slider msg listener 2
       if (theEvent.isFrom(sliderMsgGet2))
       {
       sliderMsg2 = sliderMsgGet2.getText();
       } // end msg listener
       
       // slider msg listener 3
       if (theEvent.isFrom(sliderMsgGet3))
       {
       sliderMsg3 = sliderMsgGet3.getText();
       } // end msg listener
       
       // slider msg listener 4
       if (theEvent.isFrom(sliderMsgGet4))
       {
       sliderMsg4 = sliderMsgGet4.getText();
       } // end msg listener
       
       // slider msg listener 5
       if (theEvent.isFrom(sliderMsgGet5))
       {
       sliderMsg5 = sliderMsgGet5.getText();
       } // end msg listener
       
        // slider msg listener 6
       if (theEvent.isFrom(sliderMsgGet6))
       {
       sliderMsg6 = sliderMsgGet6.getText();
       } // end msg listener
       
        // slider msg listener 7
       if (theEvent.isFrom(sliderMsgGet7))
       {
       sliderMsg7 = sliderMsgGet7.getText();
       } // end msg listener
       
        // slider msg listener 8
       if (theEvent.isFrom(sliderMsgGet8))
       {
       sliderMsg8 = sliderMsgGet8.getText();
       } // end msg listener
       
        // slider msg listener 9
       if (theEvent.isFrom(sliderMsgGet9))
       {
       sliderMsg9 = sliderMsgGet9.getText();
       } // end msg listener
       
        // slider msg listener 10
       if (theEvent.isFrom(sliderMsgGet10))
       {
       sliderMsg10 = sliderMsgGet10.getText();
       } // end msg listener
       
        // slider msg listener 11
       if (theEvent.isFrom(sliderMsgGet11))
       {
       sliderMsg11 = sliderMsgGet11.getText();
       } // end msg listener
       
        // slider msg listener 12
       if (theEvent.isFrom(sliderMsgGet12))
       {
       sliderMsg12 = sliderMsgGet12.getText();
       } // end msg listener
       
        // slider msg listener 13
       if (theEvent.isFrom(sliderMsgGet13))
       {
       sliderMsg13 = sliderMsgGet13.getText();
       } // end msg listener
       
        // slider msg listener 14
       if (theEvent.isFrom(sliderMsgGet14))
       {
       sliderMsg14 = sliderMsgGet14.getText();
       } // end msg listener
       
        // slider msg listener 15
       if (theEvent.isFrom(sliderMsgGet15))
       {
       sliderMsg15 = sliderMsgGet15.getText();
       } // end msg listener
       
        // slider msg listener 16
       if (theEvent.isFrom(sliderMsgGet16))
       {
       sliderMsg16 = sliderMsgGet16.getText();
       } // end msg listener
       
       // Slider maximum listeners
       
       // Slider max listener 1
       if (theEvent.isFrom(sliderMaxGet1))
       {
       sliderMax1 = Integer.parseInt(sliderMaxGet1.getText());
       } // end slider max listener
  
      // Slider max listener 2
      if (theEvent.isFrom(sliderMaxGet2))
       {
       sliderMax2 = Integer.parseInt(sliderMaxGet2.getText());
       } // end slider max listener
       
       // Slider max listener 3
       if (theEvent.isFrom(sliderMaxGet3))
       {
       sliderMax3 = Integer.parseInt(sliderMaxGet3.getText());
       } // end slider max listener
       
       // Slider max listener 4
       if (theEvent.isFrom(sliderMaxGet4))
       {
       sliderMax4 = Integer.parseInt(sliderMaxGet4.getText());
       } // end slider max listener
       
       // Slider max listener 5
       if (theEvent.isFrom(sliderMaxGet5))
       {
       sliderMax5 = Integer.parseInt(sliderMaxGet5.getText());
       } // end slider max listener
       
       // Slider max listener 6
       if (theEvent.isFrom(sliderMaxGet6))
       {
       sliderMax6 = Integer.parseInt(sliderMaxGet6.getText());
       } // end slider max listener
       
       // Slider max listener 7
       if (theEvent.isFrom(sliderMaxGet7))
       {
       sliderMax7 = Integer.parseInt(sliderMaxGet7.getText());
       } // end slider max listener
       
       // Slider max listener 8
       if (theEvent.isFrom(sliderMaxGet8))
       {
       sliderMax8 = Integer.parseInt(sliderMaxGet8.getText());
       } // end slider max listener
       
       // Slider max listener 9
       if (theEvent.isFrom(sliderMaxGet9))
       {
       sliderMax9 = Integer.parseInt(sliderMaxGet9.getText());
       } // end slider max listener
       
       // Slider max listener 10
       if (theEvent.isFrom(sliderMaxGet10))
       {
       sliderMax10 = Integer.parseInt(sliderMaxGet10.getText());
       } // end slider max listener
       
       // Slider max listener 11
       if (theEvent.isFrom(sliderMaxGet11))
       {
       sliderMax11 = Integer.parseInt(sliderMaxGet11.getText());
       } // end slider max listener
       
       // Slider max listener 12
       if (theEvent.isFrom(sliderMaxGet12))
       {
       sliderMax12 = Integer.parseInt(sliderMaxGet12.getText());
       } // end slider max listener
       
       // Slider max listener 13
       if (theEvent.isFrom(sliderMaxGet13))
       {
       sliderMax13 = Integer.parseInt(sliderMaxGet13.getText());
       } // end slider max listener
       
       // Slider max listener 14
       if (theEvent.isFrom(sliderMaxGet14))
       {
       sliderMax14 = Integer.parseInt(sliderMaxGet14.getText());
       } // end slider max listener
       
       // Slider max listener 15
       if (theEvent.isFrom(sliderMaxGet15))
       {
       sliderMax15 = Integer.parseInt(sliderMaxGet15.getText());
       } // end slider max listener
       
       // Slider max listener 16
       if (theEvent.isFrom(sliderMaxGet16))
       {
       sliderMax16 = Integer.parseInt(sliderMaxGet16.getText());
       } // end slider max listener
 }
}
} // end all listener methods

// Perform OSC message to Midi  
void oscEvent(OscMessage theOscMessage) {
   
   // Message type check
         float msgValue = 1.0f;
         // int
         if(theOscMessage.checkTypetag("i")) {
           msgValue = theOscMessage.get(0).intValue();
         }
         // float
         if(theOscMessage.checkTypetag("f")) {
           msgValue = theOscMessage.get(0).floatValue();
         }
        
    // Display incoming OSC Address and message        
        oscMsgDisplay.setText("Incoming OSC Message: " + theOscMessage.addrPattern() + "/" + msgValue + " " + theOscMessage.typetag());
       
// Slider 1    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg1)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode1 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax1) * 127.0f);
           }
           
           // If int32
           if(sliderMode1 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax1) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet1.setValue(msgNorm);
          bus.sendControllerChange (midiChan1, (int) sliderGetCC1.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay1.setText("OSC Value: "+ msgValue);
          midiMsgDisplay1.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider
       
// Slider 2    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg2)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode2 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax2) * 127.0f);
           }
           
           // If int32
           if(sliderMode2 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax2) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet2.setValue(msgNorm);
          bus.sendControllerChange (midiChan2, (int) sliderGetCC2.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay2.setText("OSC Value: "+ msgValue);
          midiMsgDisplay2.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       
       
// Slider 3    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg3)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode3 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax3) * 127.0f);
           }
           
           // If int32
           if(sliderMode3 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax3) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet3.setValue(msgNorm);
          bus.sendControllerChange (midiChan3, (int) sliderGetCC3.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay3.setText("OSC Value: "+ msgValue);
          midiMsgDisplay3.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       
       
// Slider 4 
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg4)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode4 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax4) * 127.0f);
           }
           
           // If int32
           if(sliderMode4 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax4) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet4.setValue(msgNorm);
          bus.sendControllerChange (midiChan4, (int) sliderGetCC4.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay4.setText("OSC Value: "+ msgValue);
          midiMsgDisplay4.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 5    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg5)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode5 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax5) * 127.0f);
           }
           
           // If int32
           if(sliderMode5 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax5) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet5.setValue(msgNorm);
          bus.sendControllerChange (midiChan5, (int) sliderGetCC5.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay5.setText("OSC Value: "+ msgValue);
          midiMsgDisplay5.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 6    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg6)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode6 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax6) * 127.0f);
           }
           
           // If int32
           if(sliderMode6 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax6) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet6.setValue(msgNorm);
          bus.sendControllerChange (midiChan6, (int) sliderGetCC6.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay6.setText("OSC Value: "+ msgValue);
          midiMsgDisplay6.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider

// Slider 7    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg7)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode7 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax7) * 127.0f);
           }
           
           // If int32
           if(sliderMode7 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax7) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet7.setValue(msgNorm);
          bus.sendControllerChange (midiChan7, (int) sliderGetCC7.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay7.setText("OSC Value: "+ msgValue);
          midiMsgDisplay7.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 8    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg8)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode8 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax8) * 127.0f);
           }
           
           // If int32
           if(sliderMode8 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax8) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet8.setValue(msgNorm);
          bus.sendControllerChange (midiChan8, (int) sliderGetCC8.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay8.setText("OSC Value: "+ msgValue);
          midiMsgDisplay8.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider

// Slider 9    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg9)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode9 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax9) * 127.0f);
           }
           
           // If int32
           if(sliderMode9 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax9) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet9.setValue(msgNorm);
          bus.sendControllerChange (midiChan9, (int) sliderGetCC9.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay9.setText("OSC Value: "+ msgValue);
          midiMsgDisplay9.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider

// Slider 10    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg10)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode10 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax10) * 127.0f);
           }
           
           // If int32
           if(sliderMode10 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax10) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet10.setValue(msgNorm);
          bus.sendControllerChange (midiChan10, (int) sliderGetCC10.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay10.setText("OSC Value: "+ msgValue);
          midiMsgDisplay10.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider
       
// Slider 11    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg11)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode11 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax11) * 127.0f);
           }
           
           // If int32
           if(sliderMode11 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax11) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet11.setValue(msgNorm);
          bus.sendControllerChange (midiChan11, (int) sliderGetCC11.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay11.setText("OSC Value: "+ msgValue);
          midiMsgDisplay11.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       
       
// Slider 12    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg12)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode12 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax12) * 127.0f);
           }
           
           // If int32
           if(sliderMode12 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax12) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet12.setValue(msgNorm);
          bus.sendControllerChange (midiChan12, (int) sliderGetCC12.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay12.setText("OSC Value: "+ msgValue);
          midiMsgDisplay12.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 13   
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg13)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode13 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax13) * 127.0f);
           }
           
           // If int32
           if(sliderMode13 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax13) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet13.setValue(msgNorm);
          bus.sendControllerChange (midiChan13, (int) sliderGetCC13.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay13.setText("OSC Value: "+ msgValue);
          midiMsgDisplay13.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 14    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg14)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode14 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax14) * 127.0f);
           }
           
           // If int32
           if(sliderMode14 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax14) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet14.setValue(msgNorm);
          bus.sendControllerChange (midiChan14, (int) sliderGetCC14.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay14.setText("OSC Value: "+ msgValue);
          midiMsgDisplay14.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider       

// Slider 15    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg15)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode15 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax15) * 127.0f);
           }
           
           // If int32
           if(sliderMode15 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax15) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet15.setValue(msgNorm);
          bus.sendControllerChange (midiChan15, (int) sliderGetCC15.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay15.setText("OSC Value: "+ msgValue);
          midiMsgDisplay15.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider

// Slider 16    
       if (theOscMessage.addrPattern().equals(prefixMsg + sliderMsg16)) 
       { 
         int msgNorm = 1;
         
         // If integer
         if(theOscMessage.checkTypetag("i")) 
         {
           int msgI = theOscMessage.get(0).intValue();
           
           // If normal integer
           if(sliderMode16 == 0) 
           {
           msgNorm = round(((float)msgI / sliderMax16) * 127.0f);
           }
           
           // If int32
           if(sliderMode16 == 1) 
           {
           msgNorm = round(((float)msgI / 2147483647) * 127.0f);
           }
         }
         
         // If float
         if(theOscMessage.checkTypetag("f")) 
         {
         float msgF = theOscMessage.get(0).floatValue();
         msgNorm = round((msgF / sliderMax16) * 127.0f);
         }

          // Send the MIDI message over specified channel and CC
          sliderKnobGet16.setValue(msgNorm);
          bus.sendControllerChange (midiChan16, (int) sliderGetCC16.getValue(), msgNorm);
          
          // Display OSC input value and MIDI output value
          oscInMsgDisplay16.setText("OSC Value: "+ msgValue);
          midiMsgDisplay16.setText("MIDI Value: "+ msgNorm);
          
       }   // end inner slider
       
   }      // end osc method
   
   

// load preset call to parsefile method
void fileSelectedLoad(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    loadPresetFile = selection.getAbsolutePath();

    String[] m = match(selection.getAbsolutePath(), "purepre");
    if (m != null)
    {
    parseFile();
      }
  }
} // end loadpreset call method

// save preset method
void fileSelectedSave(File selection) {
  if (selection == null) {
                println("Window was closed or the user hit cancel.");
                } else 
                {
                println("User selected " + selection.getAbsolutePath());
    
    String[] m = match(selection.getAbsolutePath(), "purepre");
    if (m == null)
    {paramsToSaveOutput = createWriter(selection.getAbsolutePath() + ".purepre");}
    if (m != null)
    {
      paramsToSaveOutput = createWriter(selection.getAbsolutePath());
      }
    
    paramsToSaveOutput.println(
    prefixMsg + "\t" +      //0
    sliderMsg1 + "\t" +     //1
    sliderMsg2 + "\t" +     //2
    sliderMsg3 + "\t" +     //3
    sliderMsg4 + "\t" +     //4
    sliderMsg5 + "\t" +     //5
    sliderMsg6 + "\t" +     //6
    sliderMsg7 + "\t" +     //7
    sliderMsg8 + "\t" +     //8
    sliderMsg9 + "\t" +     //9
    sliderMsg10 + "\t" +    //10
    sliderMsg11 + "\t" +    //11
    sliderMsg12 + "\t" +    //12
    sliderMsg13 + "\t" +    //13
    sliderMsg14 + "\t" +    //14
    sliderMsg15 + "\t" +    //15
    sliderMsg16 + "\t" +    //16
    sliderMode1 + "\t" +    //17
    sliderMode2 + "\t" +    //18
    sliderMode3 + "\t" +    //19
    sliderMode4 + "\t" +    //20
    sliderMode5 + "\t" +    //21
    sliderMode6 + "\t" +    //22
    sliderMode7 + "\t" +    //23
    sliderMode8 + "\t" +    //24
    sliderMode9 + "\t" +    //25
    sliderMode10 + "\t" +    //26
    sliderMode11 + "\t" +    //27
    sliderMode12 + "\t" +    //28
    sliderMode13 + "\t" +    //29
    sliderMode14 + "\t" +    //30
    sliderMode15 + "\t" +    //31
    sliderMode16 + "\t" +    //32
    sliderMax1 + "\t" +    //33
    sliderMax2 + "\t" +    //34
    sliderMax3 + "\t" +    //35
    sliderMax4 + "\t" +    //36
    sliderMax5 + "\t" +    //37
    sliderMax6 + "\t" +    //38
    sliderMax7 + "\t" +    //39
    sliderMax8 + "\t" +    //40
    sliderMax9 + "\t" +    //41
    sliderMax10 + "\t" +    //42
    sliderMax11 + "\t" +    //43
    sliderMax12 + "\t" +    //44
    sliderMax13 + "\t" +    //45
    sliderMax14 + "\t" +    //46
    sliderMax15 + "\t" +    //47
    sliderMax16 + "\t" +    //48
    sliderCC1 + "\t" +    //49
    sliderCC2 + "\t" +    //50
    sliderCC3 + "\t" +    //51
    sliderCC4 + "\t" +    //52
    sliderCC5 + "\t" +    //53
    sliderCC6 + "\t" +    //54
    sliderCC7 + "\t" +    //55
    sliderCC8 + "\t" +    //56
    sliderCC9 + "\t" +    //57
    sliderCC10 + "\t" +    //58
    sliderCC11 + "\t" +    //59
    sliderCC12 + "\t" +    //60
    sliderCC13 + "\t" +    //61
    sliderCC14 + "\t" +    //62
    sliderCC15 + "\t" +    //63
    sliderCC16 + "\t" +    //64
    midiChan1 + "\t" +    //65
    midiChan2 + "\t" +    //66
    midiChan3 + "\t" +    //67
    midiChan4 + "\t" +    //68
    midiChan5 + "\t" +    //69
    midiChan6 + "\t" +    //70
    midiChan7 + "\t" +    //71
    midiChan8 + "\t" +    //72
    midiChan9 + "\t" +    //73
    midiChan10 + "\t" +    //74
    midiChan11 + "\t" +    //75
    midiChan12 + "\t" +    //76
    midiChan13 + "\t" +    //77
    midiChan14 + "\t" +    //78
    midiChan15 + "\t" +    //79
    midiChan16 + "\t" +    //80
    portData               //81
   );
      
    paramsToSaveOutput.flush(); // Writes the remaining data to the file
    paramsToSaveOutput.close(); // Finishes the file
  }
} // end save method


// read preset method
void parseFile() {
  // Open the file from the createWriter() example
  BufferedReader reader = createReader(loadPresetFile);
  String line = null;
try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, TAB);
       
       prefixMsg = pieces[0];
       prefixMsgGet.setValue(pieces[0]);
       
       sliderMsg1 = pieces[1];
       sliderMsgGet1.setValue(pieces[1]);
       
       sliderMsg2 = pieces[2];
       sliderMsgGet2.setValue(pieces[2]);
       
       sliderMsg3 = pieces[3];
       sliderMsgGet3.setValue(pieces[3]);
       
       sliderMsg4 = pieces[4];
       sliderMsgGet4.setValue(pieces[4]);
       
       sliderMsg5 = pieces[5];
       sliderMsgGet5.setValue(pieces[5]);
       
       sliderMsg6 = pieces[6];
       sliderMsgGet6.setValue(pieces[6]);
       
       sliderMsg7 = pieces[7];
       sliderMsgGet7.setValue(pieces[7]);
       
       sliderMsg8 = pieces[8];
       sliderMsgGet8.setValue(pieces[8]);
       
       sliderMsg9 = pieces[9];
       sliderMsgGet9.setValue(pieces[9]);
       
       sliderMsg10 = pieces[10];
       sliderMsgGet10.setValue(pieces[10]);
       
       sliderMsg11 = pieces[11];
       sliderMsgGet11.setValue(pieces[11]);
       
       sliderMsg12 = pieces[12];
       sliderMsgGet12.setValue(pieces[12]);
       
       sliderMsg13 = pieces[13];
       sliderMsgGet13.setValue(pieces[13]);
       
       sliderMsg14 = pieces[14];
       sliderMsgGet14.setValue(pieces[14]);
       
       sliderMsg15 = pieces[15];
       sliderMsgGet15.setValue(pieces[15]);
       
       sliderMsg16 = pieces[16];
       sliderMsgGet16.setValue(pieces[16]);
       
        if (Integer.parseInt(pieces[17]) == 0) {
            if (sliderMode1 == 1)
            {
             sliderModeGet1.toggle(0);
             sliderModeGet1.setValue(0);
             sliderMode1 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[17]) == 1) {
            if (sliderMode1 == 0)
            {
             sliderModeGet1.toggle(0);
             sliderModeGet1.setValue(1);
             sliderMode1 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[18]) == 0) {
            if (sliderMode2 == 1)
            {
             sliderModeGet2.toggle(0);
             sliderModeGet2.setValue(0);
             sliderMode2 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[18]) == 1) {
            if (sliderMode2 == 0)
            {
             sliderModeGet2.toggle(0);
             sliderModeGet2.setValue(1);
             sliderMode2 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[19]) == 0) {
            if (sliderMode3 == 1)
            {
             sliderModeGet3.toggle(0);
             sliderModeGet3.setValue(0);
             sliderMode3 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[19]) == 1) {
            if (sliderMode3 == 0)
            {
             sliderModeGet3.toggle(0);
             sliderModeGet3.setValue(1);
             sliderMode3 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[20]) == 0) {
            if (sliderMode4 == 1)
            {
             sliderModeGet4.toggle(0);
             sliderModeGet4.setValue(0);
             sliderMode4 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[20]) == 1) {
            if (sliderMode4 == 0)
            {
             sliderModeGet4.toggle(0);
             sliderModeGet4.setValue(1);
             sliderMode4 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[21]) == 0) {
            if (sliderMode5 == 1)
            {
             sliderModeGet5.toggle(0);
             sliderModeGet5.setValue(0);
             sliderMode5 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[21]) == 1) {
            if (sliderMode5 == 0)
            {
             sliderModeGet5.toggle(0);
             sliderModeGet5.setValue(1);
             sliderMode5 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[22]) == 0) {
            if (sliderMode6 == 1)
            {
             sliderModeGet6.toggle(0);
             sliderModeGet6.setValue(0);
             sliderMode6 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[22]) == 1) {
            if (sliderMode6 == 0)
            {
             sliderModeGet6.toggle(0);
             sliderModeGet6.setValue(1);
             sliderMode6 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[23]) == 0) {
            if (sliderMode7 == 1)
            {
             sliderModeGet7.toggle(0);
             sliderModeGet7.setValue(0);
             sliderMode7 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[23]) == 1) {
            if (sliderMode7 == 0)
            {
             sliderModeGet7.toggle(0);
             sliderModeGet7.setValue(1);
             sliderMode7 = 1;
            }
        }
       
          if (Integer.parseInt(pieces[24]) == 0) {
            if (sliderMode8 == 1)
            {
             sliderModeGet8.toggle(0);
             sliderModeGet8.setValue(0);
             sliderMode8 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[24]) == 1) {
            if (sliderMode8 == 0)
            {
             sliderModeGet8.toggle(0);
             sliderModeGet8.setValue(1);
             sliderMode8 = 1;
            }
        }
      
         if (Integer.parseInt(pieces[25]) == 0) {
            if (sliderMode9 == 1)
            {
             sliderModeGet9.toggle(0);
             sliderModeGet9.setValue(0);
             sliderMode9 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[25]) == 1) {
            if (sliderMode9 == 0)
            {
             sliderModeGet9.toggle(0);
             sliderModeGet9.setValue(1);
             sliderMode9 = 1;
            }
        }
      
          if (Integer.parseInt(pieces[26]) == 0) {
            if (sliderMode10 == 1)
            {
             sliderModeGet10.toggle(0);
             sliderModeGet10.setValue(0);
             sliderMode10 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[26]) == 1) {
            if (sliderMode10 == 0)
            {
             sliderModeGet10.toggle(0);
             sliderModeGet10.setValue(1);
             sliderMode10 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[27]) == 0) {
            if (sliderMode11 == 1)
            {
             sliderModeGet11.toggle(0);
             sliderModeGet11.setValue(0);
             sliderMode11 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[27]) == 1) {
            if (sliderMode11 == 0)
            {
             sliderModeGet11.toggle(0);
             sliderModeGet11.setValue(1);
             sliderMode11 = 1;
            }
        }
      
         if (Integer.parseInt(pieces[28]) == 0) {
            if (sliderMode12 == 1)
            {
             sliderModeGet12.toggle(0);
             sliderModeGet12.setValue(0);
             sliderMode12 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[28]) == 1) {
            if (sliderMode12 == 0)
            {
             sliderModeGet12.toggle(0);
             sliderModeGet12.setValue(1);
             sliderMode12 = 1;
            }
        }
      
           if (Integer.parseInt(pieces[29]) == 0) {
            if (sliderMode13 == 1)
            {
             sliderModeGet13.toggle(0);
             sliderModeGet13.setValue(0);
             sliderMode13 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[29]) == 1) {
            if (sliderMode13 == 0)
            {
             sliderModeGet13.toggle(0);
             sliderModeGet13.setValue(1);
             sliderMode13 = 1;
            }
        }
      
       if (Integer.parseInt(pieces[30]) == 0) {
            if (sliderMode14 == 1)
            {
             sliderModeGet14.toggle(0);
             sliderModeGet14.setValue(0);
             sliderMode14 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[30]) == 1) {
            if (sliderMode14 == 0)
            {
             sliderModeGet14.toggle(0);
             sliderModeGet14.setValue(1);
             sliderMode14 = 1;
            }
        }
        
         if (Integer.parseInt(pieces[31]) == 0) {
            if (sliderMode15 == 1)
            {
             sliderModeGet15.toggle(0);
             sliderModeGet15.setValue(0);
             sliderMode15 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[31]) == 1) {
            if (sliderMode15 == 0)
            {
             sliderModeGet15.toggle(0);
             sliderModeGet15.setValue(1);
             sliderMode15 = 1;
            }
        }
      
       if (Integer.parseInt(pieces[32]) == 0) {
            if (sliderMode16 == 1)
            {
             sliderModeGet16.toggle(0);
             sliderModeGet16.setValue(0);
             sliderMode16 = 0;
            }
        }
        
        if (Integer.parseInt(pieces[32]) == 1) {
            if (sliderMode16 == 0)
            {
             sliderModeGet16.toggle(0);
             sliderModeGet16.setValue(1);
             sliderMode16 = 1;
            }
        }
      
         sliderMax1 = Integer.parseInt(pieces[33]);
         sliderMaxGet1.setValue(pieces[33]);
         
         sliderMax2 = Integer.parseInt(pieces[34]);
         sliderMaxGet2.setValue(pieces[34]);
         
         sliderMax3 = Integer.parseInt(pieces[35]);
         sliderMaxGet3.setValue(pieces[35]);
         
         sliderMax4 = Integer.parseInt(pieces[36]);
         sliderMaxGet4.setValue(pieces[36]);
         
         sliderMax5 = Integer.parseInt(pieces[37]);
         sliderMaxGet5.setValue(pieces[37]);
         
         sliderMax6 = Integer.parseInt(pieces[38]);
         sliderMaxGet6.setValue(pieces[38]);
         
         sliderMax7 = Integer.parseInt(pieces[39]);
         sliderMaxGet7.setValue(pieces[39]);
         
         sliderMax8 = Integer.parseInt(pieces[40]);
         sliderMaxGet8.setValue(pieces[40]);
         
         sliderMax9 = Integer.parseInt(pieces[41]);
         sliderMaxGet9.setValue(pieces[41]);
         
         sliderMax10 = Integer.parseInt(pieces[42]);
         sliderMaxGet10.setValue(pieces[42]);
         
         sliderMax11 = Integer.parseInt(pieces[43]);
         sliderMaxGet11.setValue(pieces[43]);
         
         sliderMax12 = Integer.parseInt(pieces[44]);
         sliderMaxGet12.setValue(pieces[44]);
         
         sliderMax13 = Integer.parseInt(pieces[45]);
         sliderMaxGet13.setValue(pieces[45]);
         
         sliderMax14 = Integer.parseInt(pieces[46]);
         sliderMaxGet14.setValue(pieces[46]);
         
         sliderMax15 = Integer.parseInt(pieces[47]);
         sliderMaxGet15.setValue(pieces[47]);
         
         sliderMax16 = Integer.parseInt(pieces[48]);
         sliderMaxGet16.setValue(pieces[48]);
         
         sliderCC1 = Integer.parseInt(pieces[49]);
         sliderGetCC1.setValue(Integer.parseInt(pieces[49]));
         
         sliderCC2 = Integer.parseInt(pieces[50]);
         sliderGetCC2.setValue(Integer.parseInt(pieces[50]));
         
         sliderCC3 = Integer.parseInt(pieces[51]);
         sliderGetCC3.setValue(Integer.parseInt(pieces[51]));
         
         sliderCC4 = Integer.parseInt(pieces[52]);
         sliderGetCC4.setValue(Integer.parseInt(pieces[52]));
         
         sliderCC5 = Integer.parseInt(pieces[53]);
         sliderGetCC5.setValue(Integer.parseInt(pieces[53]));
         
         sliderCC6 = Integer.parseInt(pieces[54]);
         sliderGetCC6.setValue(Integer.parseInt(pieces[54]));
         
         sliderCC7 = Integer.parseInt(pieces[55]);
         sliderGetCC7.setValue(Integer.parseInt(pieces[55]));
         
         sliderCC8 = Integer.parseInt(pieces[56]);
         sliderGetCC8.setValue(Integer.parseInt(pieces[56]));
         
         sliderCC9 = Integer.parseInt(pieces[57]);
         sliderGetCC9.setValue(Integer.parseInt(pieces[57]));
         
         sliderCC10 = Integer.parseInt(pieces[58]);
         sliderGetCC10.setValue(Integer.parseInt(pieces[58]));
         
         sliderCC11 = Integer.parseInt(pieces[59]);
         sliderGetCC11.setValue(Integer.parseInt(pieces[59]));
         
         sliderCC12 = Integer.parseInt(pieces[60]);
         sliderGetCC12.setValue(Integer.parseInt(pieces[60]));
         
         sliderCC13 = Integer.parseInt(pieces[61]);
         sliderGetCC13.setValue(Integer.parseInt(pieces[61]));
         
         sliderCC14 = Integer.parseInt(pieces[62]);
         sliderGetCC14.setValue(Integer.parseInt(pieces[62]));
         
         sliderCC15 = Integer.parseInt(pieces[63]);
         sliderGetCC15.setValue(Integer.parseInt(pieces[63]));
         
         sliderCC16 = Integer.parseInt(pieces[64]);
         sliderGetCC16.setValue(Integer.parseInt(pieces[64]));
         
         midiChan1 = Integer.parseInt(pieces[65]);
         midiChanGet1.setValue(Integer.parseInt(pieces[65]));
         
         midiChan2 = Integer.parseInt(pieces[66]);
         midiChanGet2.setValue(Integer.parseInt(pieces[66]));
         
         midiChan3 = Integer.parseInt(pieces[67]);
         midiChanGet3.setValue(Integer.parseInt(pieces[67]));
         
         midiChan4 = Integer.parseInt(pieces[68]);
         midiChanGet4.setValue(Integer.parseInt(pieces[68]));
         
         midiChan5 = Integer.parseInt(pieces[69]);
         midiChanGet5.setValue(Integer.parseInt(pieces[69]));
         
         midiChan6 = Integer.parseInt(pieces[70]);
         midiChanGet6.setValue(Integer.parseInt(pieces[70]));
         
         midiChan7 = Integer.parseInt(pieces[71]);
         midiChanGet7.setValue(Integer.parseInt(pieces[71]));
         
         midiChan8 = Integer.parseInt(pieces[72]);
         midiChanGet8.setValue(Integer.parseInt(pieces[72]));
         
         midiChan9 = Integer.parseInt(pieces[73]);
         midiChanGet9.setValue(Integer.parseInt(pieces[73]));
         
         midiChan10 = Integer.parseInt(pieces[74]);
         midiChanGet10.setValue(Integer.parseInt(pieces[74]));
         
         midiChan11 = Integer.parseInt(pieces[75]);
         midiChanGet11.setValue(Integer.parseInt(pieces[75]));
         
         midiChan12 = Integer.parseInt(pieces[76]);
         midiChanGet12.setValue(Integer.parseInt(pieces[76]));
         
         midiChan13 = Integer.parseInt(pieces[77]);
         midiChanGet13.setValue(Integer.parseInt(pieces[77]));
         
         midiChan14 = Integer.parseInt(pieces[78]);
         midiChanGet14.setValue(Integer.parseInt(pieces[78]));
         
         midiChan15 = Integer.parseInt(pieces[79]);
         midiChanGet15.setValue(Integer.parseInt(pieces[79]));
         
         midiChan16 = Integer.parseInt(pieces[80]);
         midiChanGet16.setValue(Integer.parseInt(pieces[80]));
      
         portData = Integer.parseInt(pieces[81]);
         portGet.setValue(pieces[81]);
         
         if (serverPower.getState(0) == true) {
            oscP5.stop();
            bus.clearAll();
            oscP5 = new OscP5(this, portData);
            bus.addOutput(midiDevOut);
          }
      
    } // end read params
    
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
} // end read preset method

// end sketch
