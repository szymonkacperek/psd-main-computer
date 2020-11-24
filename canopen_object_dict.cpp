#include <canopen_object_dict.h>

CanopenNode dashboard;         // ECM
CanopenNode inverter_1;        // ECM
CanopenNode inverter_2;        // ECM
CanopenNode mppt_1;            // ECM
CanopenNode mppt_2;            // ECM
CanopenNode mppt_3;            // ECM
CanopenNode ecm;               // MPPTs, Inverters, Dashboard, Lights controller
CanopenNode lights_controller; // ECM
CanopenNode bms;               // ECM

void CanopenObjectDictInit() {
  dashboard.node_id = 0x70;
  dashboard.sdo_download_id = 0x581; // Channel with ecm
  dashboard.emcy_id = 0xF0;

  inverter_1.node_id = 0x10;
  inverter_1.pdo_producer_id = 0x290; // 0x290 - 0x296 Channel with ecm
  inverter_1.emcy_id = 0x90;

  inverter_2.node_id = 0x15;
  inverter_2.pdo_producer_id = 0x395; // 0x395 - 0x401 Channel with ecm
  inverter_2.emcy_id = 0x95;

  mppt_1.node_id = 0x33;
  mppt_1.sdo_upload_id = 0x633; // Channel with ecm
  mppt_1.sdo_download_id = 0x5B3;
  mppt_1.emcy_id = 0xB3;
  mppt_1.index = 0xAAAB;
  mppt_1.subindex_1 = 0x01;
  mppt_1.subindex_2 = 0x02;
  mppt_1.subindex_3 = 0x03; // 0x01 - 0x03

  mppt_2.node_id = 0x36;
  mppt_2.sdo_upload_id = 0x636; // Channel with ecm
  mppt_2.sdo_download_id = 0x5B6;
  mppt_2.emcy_id = 0xB6;
  mppt_2.index = 0xAAAA;
  mppt_2.subindex_1 = 0x01;
  mppt_2.subindex_2 = 0x02;
  mppt_2.subindex_3 = 0x03; // 0x01 - 0x03

  mppt_3.node_id = 0x39;
  mppt_3.sdo_upload_id = 0x639; // Channel with ecm
  mppt_3.sdo_download_id = 0x5B9;
  mppt_3.emcy_id = 0xB9;
  mppt_3.index = 0xAAAA;
  mppt_3.subindex_1 = 0x01;
  mppt_3.subindex_2 = 0x02;
  mppt_3.subindex_3 = 0x03; // 0x01 - 0x03

  ecm.node_id = 0x01;
  ecm.sdo_upload_id = 0x581;
  ecm.emcy_id = 0x81;

  bms.node_id = 0x05;
  bms.pdo_producer_id = 0x185; // 0x185 - 0x196
  bms.emcy_id = 0x85;

  lights_controller.node_id = 0x50;
  lights_controller.pdo_consumer_id = 0x581;
}
