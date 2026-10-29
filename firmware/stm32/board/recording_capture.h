#ifndef PENDANT_RECORDING_CAPTURE_H
#define PENDANT_RECORDING_CAPTURE_H
#include "recording_session.h"
#include "audio_adf.h"
/* Main task, powered mic + configured ADF/LPDMA and qualified clocks required.
 * Store/key/RNG/filesystem must be ready; queue/pipeline already initialized.
 * Same path for initial start and post-USB recovery. Does not clear pending
 * audio or cumulative sample count. Hardware start failure faults owner. */
bool recording_capture_start(recording_session *s,recording_pipeline *p,audio_queue *q,
                             MDF_HandleTypeDef *audio,const MDF_FilterConfigTypeDef *filter);
#endif
