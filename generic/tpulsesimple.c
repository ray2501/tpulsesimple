/*
 * For C++ compilers, use extern "C"
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <tcl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <pulse/simple.h>
#include <pulse/error.h>


/*
 * Only the _Init function is exported.
 */

extern DLLEXPORT int    Tpulsesimple_Init(Tcl_Interp * interp);

/*
 * end block for C++
 */

#ifdef __cplusplus
}
#endif

pa_simple *s = NULL;
pa_sample_spec ss;

typedef enum pa_stream_direction pa_stream_direction_t;


static int SimpleObjCmd(void *cd, Tcl_Interp *interp, int objc,Tcl_Obj *const*objv)
{
  int choice;
  int rc = TCL_OK;

  static const char *SIMPLE_strs[] = {
    "read",
    "write",
    "flush",
    "drain",
    "get_latency",
    "close", 
    0
  };

  enum SIMPLE_enum {
    SIMPLE_READ,
    SIMPLE_WRITE,
    SIMPLE_FLUSH,
    SIMPLE_DRAIN,
    SIMPLE_GET_LATENCY,
    SIMPLE_CLOSE,
  };

  if( objc < 2 ){
    Tcl_WrongNumArgs(interp, 1, objv, "SUBCOMMAND ...");
    return TCL_ERROR;
  }

  if( Tcl_GetIndexFromObj(interp, objv[1], SIMPLE_strs, "option", 0, &choice) ){
    return TCL_ERROR;
  }

  switch( (enum SIMPLE_enum)choice ){

    case SIMPLE_READ: {
      unsigned char zData[176400];  // 44100 x 2 x 2 -> is it OK?
      int error;
      Tcl_Obj *pResultStr = NULL;

      if( objc != 2 ){
        Tcl_WrongNumArgs(interp, 2, objv, 0);
        return TCL_ERROR;
      }

      if(pa_simple_read(s, zData, sizeof(zData), &error) < 0) {
         return TCL_ERROR;
      }

      pResultStr = Tcl_NewByteArrayObj(zData, sizeof(zData));
      Tcl_SetObjResult(interp, pResultStr);

      break;
    }

    case SIMPLE_WRITE: {
      unsigned char *zData;
      int len;
      int error;

      if( objc != 3 ){
        Tcl_WrongNumArgs(interp, 2, objv, "byte_array");
        return TCL_ERROR;
      }

      zData = Tcl_GetByteArrayFromObj(objv[2], &len);
      if( !zData || len < 1 ){
          return TCL_ERROR;
      }

      if(pa_simple_write(s, zData, (size_t) len, &error) < 0) {
         return TCL_ERROR;
      }

      break;
    }

    case SIMPLE_FLUSH: {
      int error;

      if( objc != 2 ){
        Tcl_WrongNumArgs(interp, 2, objv, 0);
        return TCL_ERROR;
      }

      if(pa_simple_flush(s, &error) < 0) {
         return TCL_ERROR;
      }

      break;
    }

    case SIMPLE_DRAIN: {
      int error;

      if( objc != 2 ){
        Tcl_WrongNumArgs(interp, 2, objv, 0);
        return TCL_ERROR;
      }

      if(pa_simple_drain(s, &error) < 0) {
         return TCL_ERROR;
      }

      break;
    }

    case SIMPLE_GET_LATENCY: {
      int error;
      pa_usec_t latency;
      Tcl_Obj *pResultStr = NULL;

      if( objc != 2 ){
        Tcl_WrongNumArgs(interp, 2, objv, 0);
        return TCL_ERROR;
      }

      if((latency = pa_simple_get_latency(s, &error)) == (pa_usec_t) -1) {
         pResultStr = Tcl_NewIntObj(-1);
         Tcl_SetObjResult(interp, pResultStr);
         return TCL_ERROR;
      }

      pResultStr = Tcl_NewIntObj((int) latency);
      Tcl_SetObjResult(interp, pResultStr);

      break;
    }

    case SIMPLE_CLOSE: {
      if (s)
        pa_simple_free(s);

      /*
       * Now remove our command!!!
       */
      Tcl_DeleteCommand(interp, Tcl_GetStringFromObj(objv[0], 0));
      break;
    }
  }

  return rc;
}


static int SimpleMain(void *cd, Tcl_Interp *interp, int objc,Tcl_Obj *const*objv)
{
  const char *zArg;
  int i = 0;
  char *name = "PulseAudio Simple";
  char *direction = "PLAYBACK";
  pa_stream_direction_t direction_t = PA_STREAM_PLAYBACK;
  char *format = "SAMPLE_S16LE";
  pa_sample_format_t format_t = PA_SAMPLE_S16LE;
  int samplerate = 44100;
  int channels = 2;
  int len;
  int error;

  /*
   * Setup a default setting
   */ 
  ss.format = PA_SAMPLE_S16LE;
  ss.rate = 44100;
  ss.channels = 2;

  if( objc<2 || (objc&1)!=0 ){
    Tcl_WrongNumArgs(interp, 1, objv,
      "HANDLE ?-appname name? ?-direction direction? ?-format format? ?-rate samplerate? ?-channels channels? "
    );
    return TCL_ERROR;
  }

  for(i=2; i+1<objc; i+=2){
    zArg = Tcl_GetStringFromObj(objv[i], 0);

    if( strcmp(zArg, "-appname")==0 ){
      name = Tcl_GetStringFromObj(objv[i+1], &len);
      if( !name || len < 1 ){
         return TCL_ERROR;
      }
    } else if( strcmp(zArg, "-direction")==0 ){
      direction = Tcl_GetStringFromObj(objv[i+1], &len);
      if( !direction || len < 1 ){
         return TCL_ERROR;
      }
    } else if( strcmp(zArg, "-format")==0 ){
      format = Tcl_GetStringFromObj(objv[i+1], &len);
      if( !format || len < 1 ){
         return TCL_ERROR;
      }
    } else if( strcmp(zArg, "-rate")==0 ){
      if(Tcl_GetIntFromObj(interp, objv[i+1], &samplerate) != TCL_OK) {
         return TCL_ERROR;
      }

      if(samplerate <= 0) {
         Tcl_AppendResult(interp, "Error: samplerate needs > 0", (char*)0);
         return TCL_ERROR;
      }
    } else if( strcmp(zArg, "-channels")==0 ){
      if(Tcl_GetIntFromObj(interp, objv[i+1], &channels) != TCL_OK) {
         return TCL_ERROR;
      }
      
      if(channels <= 0) {
         Tcl_AppendResult(interp, "Error: channels needs > 0", (char*)0);
         return TCL_ERROR;
      }
    }else{
      Tcl_AppendResult(interp, "unknown option: ", zArg, (char*)0);
      return TCL_ERROR;
    }
  }

  if(strcmp(direction, "PLAYBACK")==0) {
    direction_t = PA_STREAM_PLAYBACK;
  } else if(strcmp(direction, "RECORD")==0) {
    direction_t = PA_STREAM_RECORD;
  } else {
    direction_t = PA_STREAM_PLAYBACK;
  }

  if(strcmp(format, "SAMPLE_U8")==0) {
    format_t = PA_SAMPLE_U8;
  } else if(strcmp(format, "SAMPLE_ALAW")==0) {
    format_t = PA_SAMPLE_ALAW;
  } else if(strcmp(format, "SAMPLE_ULAW")==0) {
    format_t = PA_SAMPLE_ULAW;
  } else if(strcmp(format, "SAMPLE_S16LE")==0) {
    format_t = PA_SAMPLE_S16LE;
  } else if(strcmp(format, "SAMPLE_S16BE")==0) {
    format_t = PA_SAMPLE_S16BE;
  } else if(strcmp(format, "SAMPLE_FLOAT32LE")==0) {
    format_t = PA_SAMPLE_FLOAT32LE;
  } else if(strcmp(format, "SAMPLE_FLOAT32BE")==0) {
    format_t = PA_SAMPLE_FLOAT32BE;
  } else if(strcmp(format, "SAMPLE_S32LE")==0) {
    format_t = PA_SAMPLE_S32LE;
  } else if(strcmp(format, "SAMPLE_S32BE")==0) {
    format_t = PA_SAMPLE_S32BE;
  } else if(strcmp(format, "SAMPLE_S24LE")==0) {    // Since 0.9.15
    format_t = PA_SAMPLE_S24LE;
  } else if(strcmp(format, "SAMPLE_S24BE")==0) {    // Since 0.9.15
    format_t = PA_SAMPLE_S24BE;
  } else if(strcmp(format, "SAMPLE_S24_32LE")==0) { // Since 0.9.15
    format_t = PA_SAMPLE_S24_32LE;
  } else if(strcmp(format, "SAMPLE_S24_32BE")==0) { // Since 0.9.15
    format_t = PA_SAMPLE_S24_32BE;
  } else {
    format_t = PA_SAMPLE_S16LE;
  }

  ss.format = format_t;
  ss.rate = samplerate;
  ss.channels = channels;

  if (!(s = pa_simple_new(NULL, name, direction_t, NULL, direction, &ss, NULL, NULL, &error))) {
      Tcl_AppendResult(interp, "pa_simple_new failed: ", pa_strerror(error), (char*)0);
      return TCL_ERROR;
  }

  zArg = Tcl_GetStringFromObj(objv[1], 0);
  Tcl_CreateObjCommand(interp, zArg, SimpleObjCmd, (char *)NULL, (Tcl_CmdDeleteProc *)NULL);

  return TCL_OK;
}


/*
 *----------------------------------------------------------------------
 *
 * Tpulsesimple_Init --
 *
 *	Initialize the new package.
 *
 * Results:
 *	A standard Tcl result
 *
 * Side effects:
 *	The Tplusesimple package is created.
 *
 *----------------------------------------------------------------------
 */

int
Tpulsesimple_Init(Tcl_Interp *interp)
{
    if (Tcl_InitStubs(interp, "8.4", 0) == NULL) {
	return TCL_ERROR;
    }
    if (Tcl_PkgProvide(interp, PACKAGE_NAME, PACKAGE_VERSION) != TCL_OK) {
	return TCL_ERROR;
    }

    Tcl_CreateObjCommand(interp, "pulseaudio::simple", (Tcl_ObjCmdProc *) SimpleMain,
        (ClientData)NULL, (Tcl_CmdDeleteProc *)NULL);    

    return TCL_OK;
}
