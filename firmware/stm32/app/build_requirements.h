/* Explicit engineering application profile. Does not qualify hardware or IDs. */
#if !defined(PENDANT_FACTORY_COMMON_FIRMWARE) && !defined(PENDANT_AGE_RECIPIENT)
#error Public recipient configuration required
#endif
#if defined(PENDANT_FACTORY_COMMON_FIRMWARE) && defined(PENDANT_AGE_RECIPIENT)
#error Common factory image must not contain a buyer recipient
#endif
#if !defined(PENDANT_USB_VID) || !defined(PENDANT_USB_PID)
#error Explicit USB identifiers required
#elif PENDANT_USB_VID <= 0 || PENDANT_USB_VID > 65535 || PENDANT_USB_PID <= 0 || PENDANT_USB_PID > 65535
#error Invalid USB identifier range
#elif PENDANT_USB_VID == 0x1234 && PENDANT_USB_PID == 0x5678
#error Link fixture identifiers are not allowed in configured application
#endif
#if !defined(PENDANT_COOPERATIVE_SAVE) || PENDANT_COOPERATIVE_SAVE != 1
#error Cooperative recording profile required
#endif
#if !defined(WAV_CHUNK_SAMPLES) || WAV_CHUNK_SAMPLES != 160000U
#error Ten-second recording profile required
#endif
#if !defined(PENDANT_BATTERY_STOP_MV) || PENDANT_BATTERY_STOP_MV < 3000 || PENDANT_BATTERY_STOP_MV > 4200
#error Explicit reviewed battery stop threshold required
#endif
#if !defined(PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS) || PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS != 0
#error Product image requires PA15 button for physical provisioning and cleanup confirmation
#endif
